function [ M ] = controller_angular_velocity( u )
%CONTROLLER_ANGULAR_VELOCITY Summary of this function goes here
%   Detailed explanation goes here

x = x_u(1);
y = x_u(2);
z = x_u(3);
v_x = x_u(4);
v_y = x_u(5);
v_z = x_u(6);
phi = x_u(7);
theta = x_u(8);
psi = x_u(9);
p = x_u(10);
q = x_u(11);
r = x_u(12);

Omega_d = [u(13) u(14) u(15)]';
Omega_0 = [p q r]';



end

