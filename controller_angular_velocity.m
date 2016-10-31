function [ M ] = controller_angular_velocity( u )
%CONTROLLER_ANGULAR_VELOCITY Summary of this function goes here
%   Detailed explanation goes here

global I M_last_step pointer flight_log;
output_pid_angular_acceleration = [u(1) u(2) u(3)]';
dOmega0 = [u(4) u(5) u(6)]';

delta_M = I * (output_pid_angular_acceleration - dOmega0);

M = M_last_step +delta_M;
M_last_step = M;

%--------------------------------
% log

flight_log(pointer,1:3) = M;
flight_log(pointer,4:6) = delta_M;
pointer = pointer + 1;
%--------------------------------
end

