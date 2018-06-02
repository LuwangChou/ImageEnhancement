% Load original signal. 
load sumlichr; x = sumlichr;

% Use wpdencmp for signal compression. 
% Find default values (see ddencmp). 
[thr,sorh,keepapp,crit] = ddencmp('cmp','wp',x)

% De-noise signal using global thresholding with 
% threshold best basis. 
[xc,wpt,perf0,perfl2] =wpdencmp(x,sorh,3,'db2',crit,thr,keepapp);

% Using some plotting commands,
% the following figure is generated.


% Load original image. 
load sinsin

% Generate noisy image. 
init = 2055615866; randn('seed',init); 
x = X/18 + randn(size(X));
subplot(2,2,1);
plot(x);
% Use wpdencmp for image de-noising. 
% Find default values (see ddencmp).
[thr,sorh,keepapp,crit] = ddencmp('den','wp',x)

% De-noise image using global thresholding with 
% SURE best basis. 
xd = wpdencmp(x,sorh,3,'sym4',crit,thr,keepapp);

subplot(2,2,2);
plot(xd);
% Using some plotting commands,
% the following figure is generated