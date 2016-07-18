% calculate ACF of a 2D distribution with zero mean value
% then calcualted the rotational average of this 2D ACF

% the input file is in (2D distribution) and dr (pixel size)
% the output file is r, bnr, and summed 
% orignially written by Andrew Radovich 
% https://9005e1f827a9e25b4b6aeea1895421b6a580f414.googledrive.com/host/0BxcilyptyF8hTTlxVEJSY0lreW8/index.html
% modifed by Yue Li

% use Wiener-Khinchine theorem
F = fftn(in);
2DACF = fftshift(ifftn(F.*conj(F)));

% perform rotational average
% set the matrix size
size = (length(2DACF)-1)/2;
[x,y] = ndgrid([-size:size],[-size:size]);
new_grid= sqrt(x.^2+y.^2);

% use accumarray to calculate the distance to the center of each pixel
position = 1 + floor(new_grid+0.5);
distance = accumarray(position(:),ones(1,numel(2DACF)))';
bnr = accumarray(position(:),2DACF(:))./distance';

position = [0:max(position(:))-1]';
summed = bnr.*(2*pi*position)*dr;
r = position*dr;

% only take half of the distribution because it's symetric
r = r(1:half+1);
bnr = bnr(1:half+1);
summed = summed(1:half+1);


