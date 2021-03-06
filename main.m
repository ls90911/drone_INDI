clear
clc

global k_F k_M L m g I_xx I_yy I_zz I matrix_force_2_omega
% global k_p_angular_velocity_p k_p_angular_velocity_q k_p_angular_velocity_r 
% global k_i_angular_velocity_p k_i_angular_velocity_q k_i_angular_velocity_r
% global k_d_angular_velocity_p k_d_angular_velocity_q k_d_angular_velocity_r

global M_last_step

global flight_log pointer;

flight_log = zeros(1,15);
pointer = 1;
%------------------------------------------------------
%                  model parameter
%------------------------------------------------------
k_F = 6.11*10^-8;
k_M = 1.5*10^-9;
L = 0.175;
I_xx = 2.32*10^-3;
I_yy = 2.32*10^-3;
I_zz = 4.00*10^-3;
m = 0.5;
g = 9.8;
I = [I_xx 0 0; 0 I_yy 0; 0 0 I_zz];
k_p_angular_velocity = 0.7;
M_last_step = [0 0 0]';

%-------------------------------------------------------
%   Controller parameters
%-------------------------------------------------------
k_p_angular_velocity_p = 8;
k_i_angular_velocity_p = 0;
k_d_angular_velocity_p = 0;

k_p_angular_velocity_q = 8;
k_i_angular_velocity_q = 0;
k_d_angular_velocity_q = 0;

k_p_angular_velocity_r = 5;
k_i_angular_velocity_r = 0;
k_d_angular_velocity_r = 0;




state_initial = [0 0 3 0 0 0 0 0 0 0 0 0];
matrix_omega_2_force = [k_F k_F k_F k_F; 0 k_F*L 0 -k_F*L;...
    -k_F*L 0 k_F*L 0; k_M -k_M k_M -k_M];
matrix_force_2_omega = inv(matrix_omega_2_force);

sim('simulink_main');

