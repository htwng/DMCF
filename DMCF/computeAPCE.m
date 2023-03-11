function [out] = computeAPCE(response_map)
% calculate the average peak-tocorrelation energy (APCE) as LMCF(CVPR2017)
w = size(response_map, 1);
h = size(response_map, 2);
Fmax = max(response_map(:));
Fmin = min(response_map(:));

numerator = (abs(Fmax - Fmin)).^2;
denominator_tmp = (response_map - Fmin).^2;
denominator = (sum(denominator_tmp(:))) / (w * h);

out = numerator / denominator;







