clc;
clear all;
X=imread('F:\fingervein_test.jpg');%·��
wname='haar';
N=2;
[C,S] = wavedec2(X,N,wname);