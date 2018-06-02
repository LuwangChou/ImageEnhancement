clc;
clear all;
inputImage = imread('middle_1.bmp');
inputImage = rgb2gray(inputImage);
outputImage = 0.8*inputImage;
testMSE = count_MSE(inputImage,outputImage);

