function [output_image]=InterpolationNearest11410442(input_file,dim)
% Step 1：Read input image and interpolation dimension
A=imread(input_file);
[i,j,d2]=size(A)
x=round(dim(1));
y=round(dim(2));
% Step 2: Extend the input image edge and creat the output_image matrix
[h,w,d]=size(A);
B=zeros(h+2,w+2,d);
% Extend  the matrix A to I, besides adding 2 both in row and column
B(2:h+1,2:w+1,:)=A;
% Inside I equal to A
B(1,1,:)=A(1,1,:);
B(1,w+2,:)=A(1,w,:);
B(h+2,1,:)=A(h,1,:);
B(h+2,w+2,:)=A(h,w,:);
% Set the 4 vertex of I equal to A
B(1,2:w+1,:)=A(1,1:w,:);
B(2:h+1,1,:)=A(1:h,1,:);
B(h+2,2:w+1,:)=A(h,1:w,:);
B(2:h+1,w+2,:)=A(1:h,w,:);
% Set the 4 border of I equal to A
output_image=zeros(x,y);
for a=1:x
    for b=1:y
        m=round(a*i/x);
        n=round(b*j/y);
        % Find the nearest point of (x,y)
        output_image(a,b)=B(m+1,n+1);
        % Because the matrix has extended, the nearest point in matrix B is
        % (m+1,n+1)
    end
end
% Step 3: Output the origin image and the image being Interpolated
figure
imshow(A);
axis on
title(['原图（',num2str(i),'*',num2str(j),')']);
figure
imshow(uint8(output_image));
axis on
title(['缩放后的图像（',num2str(x),'*',num2str(y),')']);
end