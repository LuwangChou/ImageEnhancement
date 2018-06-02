function output_args = fx( input_args )
% f(I0(i,j))  = (I0(i,j) - I0min)/(I0max-I0min)
% input_args 输入像素点，
%inputMax 为像素灰度最大值点，inputMin 为像素灰度最小值点
inputMin=0;
inputMax=255;
output_args= (input_args-inputMin) / (inputMax-inputMin);
end

