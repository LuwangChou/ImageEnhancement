clear all;
%Set wavelet name. 
wname = 'haar';

% Compute the four filters associated with wavelet name given 
% by the input string wname. 
[Lo_D,Hi_D,Lo_R,Hi_R] = wfilters(wname);
subplot(2,2,1); stem(Lo_D); 
title('Decomposition low-pass filter'); 
subplot(2,2,2); stem(Hi_D); 
title('Decomposition high-pass filter'); 
subplot(2,2,3); stem(Lo_R); 
title('Reconstruction low-pass filter'); 
subplot(2,2,4); stem(Hi_R); 
title('Reconstruction high-pass filter'); 
xlabel('The four filters for db5')

% Editing some graphical properties,
% the following figure is generated.