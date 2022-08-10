clear all, close all, clc;

addpath('Matlab_simulation/')
%  rosinit('127.0.0.1')

payload = gazebo_dynamics;
uav1 = gazebo_dynamics;
uav2 = gazebo_dynamics;
uav3 = gazebo_dynamics;
uav4 = gazebo_dynamics;

% --- now launch the gazebo files ---

%% initialize the subscriber
payload.t = rostime("now");
payload.sub = rossubscriber("/sensor_pack/groundtruth/pose","DataFormat","struct");
uav1.sub = rossubscriber("/firefly1/ground_truth/pose","DataFormat","struct");
uav2.sub = rossubscriber("/firefly2/ground_truth/pose","DataFormat","struct");
uav3.sub = rossubscriber("/firefly3/ground_truth/pose","DataFormat","struct");
uav4.sub = rossubscriber("/firefly4/ground_truth/pose","DataFormat","struct");
%% initialize the publisher
[uav1.pub, uav1.msg] = rospublisher("/firefly1/command/roll_pitch_yawrate_thrust","mav_msgs/RollPitchYawrateThrust");
[uav2.pub, uav2.msg] = rospublisher("/firefly2/command/roll_pitch_yawrate_thrust","mav_msgs/RollPitchYawrateThrust");
[uav3.pub, uav3.msg] = rospublisher("/firefly3/command/roll_pitch_yawrate_thrust","mav_msgs/RollPitchYawrateThrust");
[uav4.pub, uav4.msg] = rospublisher("/firefly4/command/roll_pitch_yawrate_thrust","mav_msgs/RollPitchYawrateThrust");

pause(0.5);


[uav1, uav2, uav3, uav4, payload] = getPose(uav1,uav2,uav3,uav4,payload); 

u1 = [-4 0 20];
u2 = [4 0 20];
while true
force_to_uav(u1,uav1,payload);
force_to_uav(u2,uav2,payload);

end


function force_to_uav(u,uav,payload)
    
    thrust = rosmessage('geometry_msgs/Vector3');
    yaw_R = rotz(rad2deg(uav.eul(1)));
    force_temp = 1/norm(u)*yaw_R'*payload.R*u';

    uav.msg.Roll = -asin(force_temp(2));
    uav.msg.Pitch = atan(force_temp(1)/force_temp(3));
    thrust.Z = norm(u);
    uav.msg.Thrust = thrust;
    send(uav.pub, uav.msg);

end

