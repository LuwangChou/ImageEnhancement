clc;
clear all;
folder = 'F:\databaseOne\0001_1_1_120509-135315.png';
inputImage = imread(folder);
% [ca,ch,cv,cd] = dwt2(inputImage,'haar');
N=3;
wname='haar';
[ca,ch,cv,cd] = wavedec2(inputImage,N,wname)
%[ca,ch,cv,cd] 对应 [LL,HL,LH,HH]
%直方图均衡化
% caHq=histeq(uint8(ca));

%自适应直方图均衡化
cl=0.01;
caHq = adapthisteq(uint8(ca),'NumTiles',[12,12],'clipLimit',cl,'Distribution','rayleigh','Alpha',0.4,'NBins',512);
% reconImage=mat2gray(idwt2(caHq,ch,cv,cd,'haar'));
% reconImage=imadjust(reconImage,[],[],1.3);
% 
% [inputE,reconE] = count_Entropy(inputImage, reconImage);
% count_PSNR(inputImage,reconImage);
% otsuShow(mat2gray(inputImage),reconImage);

% aheImage=adapthisteq(inputImage,'NumTiles',[8,8],'clipLimit',cl,'Distribution','rayleigh','Alpha',0.4,'NBins',256);
inputImage = rgb2gray(inputImage);
aheImage=adapthisteq(inputImage);
%加权平均
otsuShow(inputImage,aheImage);
outputImage=weightedAverage(inputImage,aheImage,1.5,0.9);
otsuShow(inputImage,mat2gray(outputImage));
% otsuShow(inputImage,reconImage);