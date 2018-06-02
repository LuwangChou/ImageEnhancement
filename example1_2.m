A=imread('F:\ch4_images\cameraman.tif');      % Read in intensity image


subplot(2,2,1); imshow(A);      % First display image using imshow

subplot(2,2,2); imagesc(A);     % Next display image using imagesc

axis image;                     % Correct aspect ratio of displayed image
axis off;                       % turn off the axis labelling
colormap(gray);                 % display intensity image in gray-scale

% errata corrected - 19/3/16 TPB