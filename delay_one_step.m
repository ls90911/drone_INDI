function [ y ] = delay_one_step( M )
%DELAY_ONE_STEP Summary of this function goes here
%   Detailed explanation goes here
global start_flag M_last_step;
if start_flag == 0
    y = [0 0 0]';
    M_last_step = M;
    start_flag = 1;
    return;
else
    y = M_last_step;
    M_last_step = M;
end

end

