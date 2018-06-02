clc;
clear all;
X=imread('F:\fingervein_test.jpg');%Â·¾¶
wname='haar';
N=2;
[C,S] = wavedec2(X,N,wname);