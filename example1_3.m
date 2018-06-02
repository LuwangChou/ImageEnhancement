B=rand(256).*1000;      % Generate random image array in range 0-1000 
figure(1);
imshow(B);              % Poor contrast results using imshow because data 
                        % exceeds expected range
figure(2);
imagesc(B);             % imagesc automatically scales colourmap to data
axis image; axis off;   % range
colormap(gray); colorbar;
figure(3);
imshow(B,[0 1000]);     % But if we specify range of data explicitly then                    
% imshow also displays correct image contrast