function [A,b,x_exact] = gaussian_load
x_exact=ones(1024,1);
load('D:\model\MATLAB\random sketch\ref&pro_sketch\test\gaussian\gaussian_1024_A.mat');
load('D:\model\MATLAB\random sketch\ref&pro_sketch\test\gaussian\gaussian_1024_b.mat');
A=gaussian_1024_A.mat';
b=gaussian_1024_b.mat;
end

