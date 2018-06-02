% Example Matlab script as provided with textbook:
%
%  Fundamentals of Digital Image Processing: A Practical Approach with Examples in Matlab
%  Chris J. Solomon and Toby P. Breckon, Wiley-Blackwell, 2010
%  ISBN: 0470844736, DOI:10.1002/9780470689776, http://www.fundipbook.com
%
imfinfo('F:\ch4_images\cameraman.tif')    % Query the cameraman image that 
                            % is available with matlab. 
                            % imfinfo provides information

                            %ColorType is gray-scale, width is 256 ... etc.
                    
I1=imread('F:\ch4_images\cameraman.tif'); %Read in the TIF format cameraman image

imwrite(I1,'F:\ch4_images\cameraman.jpg','jpg');    % Write the resulting array I1 to 
                                      % disk as a JPEG image
                                      
imfinfo('F:\ch4_images\cameraman.jpg')    % Query the resulting disk image
% Note changes in storage size etc. 