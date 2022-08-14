classdef gazebo_distributed
    
    properties
       u1_bar
       u2_bar
       u3_bar
       u1
       u2
       u3
       Z
       B
       p_i
       spherical_constraint
       freq
       Z1
       Z2
       Z3
    end
    methods

        function [u] = cal_u(~, payload, Fd, Md)

                R = payload.R;
                
                %% upper bound
                Fd_direction = Fd/norm(Fd);
                Fd_up = 2.5*4*9.8;
                Fd_real = min(Fd_up, norm(Fd));
                Fd = Fd_real*Fd_direction;

                % Control is defined in world frame, so turn it into body frame
                payload_F = R'*Fd;
                payload_M = Md;

                % Get grasp matrix and nullspace of it
                obj.B = payload.B;
                p1 = [ -1.1     0     0 ];
                p2 = [  1.1     0     0 ];
                p3 = [   0     0.85   0 ];
                p4 = [   0    -0.85   0 ];
                obj.B = [       eye(3)   eye(3)              eye(3)       eye(3); 
                         hat_map(p1)     hat_map(p2)       hat_map(p3)  hat_map(p4)];

                obj.Z = null(obj.B);

                %% Analytical Solution of distributed force
                analytical_sol = obj.B'/(obj.B*obj.B');
                toworld = [   R     zeros(3) zeros(3) zeros(3); 
                           zeros(3)     R    zeros(3) zeros(3); 
                           zeros(3) zeros(3)    R     zeros(3); 
                           zeros(3) zeros(3) zeros(3)    R];
                
                obj.u_bar = toworld*analytical_sol*[payload_F ; payload_M];                
                obj.u1_bar = obj.u_bar(1:3);
                obj.u2_bar = obj.u_bar(4:6); 
                obj.u3_bar = obj.u_bar(7:9);
                obj.u4_bar = obj.u_bar(10:12);
                
                %% Because of gimbal constraint, decide gamma input for null(B) 
                
                gamma = [0; 0; 0; 0 ; 0 ; 0];  
                obj.p_i = [0 ; 0 ; -1];
                gimbal_angle = 45;
                obj.spherical_contraint = cos(deg2rad(gimbal_angle))*cos(deg2rad(gimbal_angle))*eye(3) - obj.p_i*obj.p_i'; 
                obj.Z1 = obj.Z(1:3,:);
                obj.Z2 = obj.Z(4:6,:);
                obj.Z3 = obj.Z(7:9,:);
                obj.Z4 = obj.Z(10:12,:);
                options = optimoptions(@fminunc,'Display','off','Algorithm','quasi-newton');
                
                tic;
                gamma_new = fminunc(@func, gamma, options);
                freq_dis = 1/toc;

                % Total null space force
                nullspace_f = obj.Z*gamma_new;
                obj.u1 = obj.u1_bar + nullspace_f(1:3);
                obj.u2 = obj.u2_bar + nullspace_f(4:6);
                obj.u3 = obj.u3_bar + nullspace_f(7:9);
                obj.u4 = obj.u4_bar + nullspace_f(10:12);
   
                u = [obj.u1; obj.u2; obj.u3; obj.u4];
                function cost = func(gamma)
            
                    s = 5;
                    upperbound = 30;
                   
                    F1 = obj.u1_bar + obj.Z1*gamma;
                    F2 = obj.u2_bar + obj.Z2*gamma;
                    F3 = obj.u3_bar + obj.Z3*gamma;
                    F4 = obj.u4_bar + obj.Z4*gamma;
                    
                    c11 = F1'*(obj.spherical_contraint)*F1;
                    c21 = F1'*F1 - upperbound^2;
                    result1 = 0.5*s*(F1'*F1) + ( -log(-c11) - log(-c21) );
                
                    c12 = F2'*(obj.spherical_contraint)*F2;
                    c22 = F2'*F2 - upperbound^2;
                    result2 = 0.5*s*(F2'*F2) + ( -log(-c12) - log(-c22) );
                
                    c13 = F3'*(obj.spherical_contraint)*F3;
                    c23 = F3'*F3 - upperbound^2;
                    result3 = 0.5*s*(F3'*F3) + ( -log(-c13) - log(-c23) );
   
                    c14 = F4'*(obj.spherical_contraint)*F4;
                    c24 = F4'*F4 - upperbound^2;
                    result4 = 0.5*s*(F4'*F4) + ( -log(-c14) - log(-c24) );

                    cost = result1 + result2 + result3 + result4;
                end
        end


        
        
    end
end

            