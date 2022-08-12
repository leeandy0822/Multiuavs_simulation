function [payload, icl_trans, icl_rot, ctrl, traj_handle]= gazebo_init(traj_mode,groundtruth_mode, sim_t)

    payload = payload_dynamics;
    payload.traj_mode = traj_mode;

    %% Physical property
    payload.m = 2;
    payload.J = [0.030, 0, 0;
                    0, 0.03, 0;
                    0, 0, 0.0500];
    % Gazebo simulation time
    payload.t = sim_t / 0.025;

    payload.x = zeros(3,length(payload.t));
    payload.v = zeros(3,length(payload.t));
    payload.R = zeros(9, length(payload.t));
    payload.Rd = zeros(9, length(payload.t));
    payload.W = zeros(3, length(payload.t));
    payload.dW = zeros(3, length(payload.t));
    payload.ex = zeros(3, length(payload.t));
    payload.ev = zeros(3, length(payload.t));
    payload.force = zeros(3,length(payload.t));
    payload.moment = zeros(3,length(payload.t));
    
    % translation: m m*CoG  rotation: CoG J3x1 (todo: 6x1)
    payload.translation_estimation = zeros(4, length(payload.t));
    payload.rotation_estimation = zeros(6, length(payload.t));
    
    %% Grasp position 
    payload.u1 = zeros(3, length(payload.t));
    payload.u2 = zeros(3, length(payload.t));
    payload.u3 = zeros(3, length(payload.t));
    payload.freq =  zeros(1, length(payload.t));
    
    %% Optimal Grasp Position and Initial Condition
    % 優化
    if groundtruth_mode == 1

        payload.translation_estimation(:,1) = [payload.m; payload.m*0.08 ; payload.m*0.08 ; 0 ];
        payload.rotation_estimation(:, 1) = [0.08; 0.08; 0; 0; 0; 0];
    
    else

        payload.translation_estimation(:,1) = [1; 0.05 ; 0.05 ; 0.05 ];
        payload.rotation_estimation(:, 1) = [0; 0; 0; 0; 0; 0];

    end


    %payload.B = [eye(3) eye(3) eye(3); hat_map(payload.p1) hat_map(payload.p2) hat_map(payload.p3)];

    x0 = [0; 0; 0];
    x0_dot = [0 ; 0; 0];
    eul = [0 0 0];
    R0 = eul2rotm(eul);
    
    payload.x(:,1) = x0;
    payload.v(:,1) = x0_dot;
    payload.R(:,1) = reshape(R0,9,1);
    payload.W(:,1) = [0, 0, 0];
    
    %% ICL initialize

    % Translation ICL initialize
    icl_trans = integral_concurrent_learning;
    icl_trans.N_diag = 10;
    icl_trans.mat_diag_matrix = zeros(4, icl_trans.N_diag);
    icl_trans.mat_diag_sum = zeros(4, 1);
    icl_trans.index_diag = 0;
    icl_trans.current_force = zeros(3, 1);
    
    % Rotation ICL initialize
    icl_rot = integral_concurrent_learning;
    icl_rot.N_diag = 10;
    icl_rot.mat_diag_matrix = zeros(6, icl_rot.N_diag);
    icl_rot.mat_diag_sum = zeros(6, 1);
    icl_rot.index_diag = 0;
    icl_rot.current_moment = zeros(3,1);
    icl_rot.W_last = zeros(3, 1);
    icl_rot.f_last = zeros(3, 1);


    %% initialize controller
    ctrl = controller;
    optim_mode = 2;
    emk_mode = 0;
    ctrl.gain_setup(optim_mode, emk_mode);

    %% initialize trajectory
    traj_handle = payload_trajectory;
    traj_handle.traj = zeros(9, length(payload.t));
    traj_handle.traj(:,1) = traj_handle.traj_generate(payload.t(1),payload.traj_mode);


end