clc;
clear all;
A = imread('F:\Lena.jpg');
A = double(A);
% aE = entropy(A);
% bE = count_Entropy(A);
% LEI = count_LEI(A,0.9*A,16,16); %LEI 45.9370
% LEI = count_LEI(A,0.9*A,8,8); %LEI 45.9146
LEI = count_LEI(A,0.5*A,16,16); 