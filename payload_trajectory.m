classdef payload_trajectory
    methods
        function out = traj_generate(~, t)

            
            x = [15*sin(0.03*pi*t) ; 32*cos(0.01*pi*t); -1 - 0.005*t];
            v = [15*0.03*pi*cos(0.03*pi*t) ; -0.32*pi*sin(0.01*pi*t) ; -0.005];
            a = [-15*0.03*0.03*pi*pi*sin(0.03*pi*t) ; -0.01*0.32*pi*pi*cos(0.01*pi*t) ; 0];

            % xd, vd, ad
            out = zeros(9, 1);

            % xd
            out(1) = x(1);
            out(2) = x(2);
            out(3) = x(3);
            % vd
            out(4) = v(1);
            out(5) = v(2);
            out(6) = v(3);
            % ad
            out(7) = a(1);
            out(8) = a(2);
            out(9) = a(3);

        end
   end
end
