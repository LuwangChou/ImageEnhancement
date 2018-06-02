% ≤‚ ‘º∆À„SSIM
X = imread('F:\fingervein_std.jpg');
X = double(X);
Y = 0.1*X;
SSIMxy = count_SSIM(X,Y);

