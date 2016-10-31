function [ M ] = controller_angular_velocity( u )
%CONTROLLER_ANGULAR_VELOCITY Summary of this function goes here
%   Detailed explanation goes here

global I M_last_step;
x = u(1);
y = u(2);
z = u(3);
v_x = u(4);
v_y = u(5);
v_z = u(6);
phi = u(7);
theta = u(8);
psi = u(9);
p = u(10);
q = u(11);
r = u(12);
dp = u(16);
dq = u(17);
dr = u(18);

output_pid_angular_velocity = [u(13) u(14) u(15)]';
Omega_0 = [p q r]';
dOmega0 = [dp dq dr]';
delta_M = I * (output_pid_angular_velocity - dOmega0);

M = M_last_step +delta_M;
M_last_step = M;
end

