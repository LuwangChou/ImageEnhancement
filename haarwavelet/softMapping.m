function [ Wout ] = softMapping( Win,th,G )
% ÈíãÐÖµÓ³Éäº¯Êý
%Wout(i,j) = { Win(i,j) + G*(T1-1)  Win(i,j) > T1
% { G*Win(i,j)   -T1 < Win(i,j) < T1
% { Win(i,j) - G*(T1-1)  Win(i,j) > T1
[row,col] = size(Win);
T1=255*th;
temp=zeros(row,col);
for i=1:row
    for j=1:col
        if Win(i,j) > T1
            temp(i,j) = Win(i,j) + G*(T1-1);
        end
        if Win(i,j) < -T1
            temp(i,j) = Win(i,j) - G*(T1-1);
        end
        if (Win(i,j) < T1)&&(Win(i,j) > -T1)
            temp(i,j) = G*Win(i,j);
        end
    end
end
Wout = temp;


end

