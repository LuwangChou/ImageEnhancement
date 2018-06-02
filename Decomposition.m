function [ output_args ] = Decomposition( fx,h )
%Decomposition Summary of this function goes here
%   Detailed explanation goes here
gx=zeros(1,length(fx));
while h>1
    h=floor(h/2);
    for i=0:h-1
        gx(i+1)=(fx(2*i+1)+fx(2*i+2))/sqrt(2);
        gx(h+i+1)=(fx(2*i+1)-fx(2*i+2))/sqrt(2);
    end
    fx=gx;
end
    output_args=fx;
end


