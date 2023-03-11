function [yys xxs out] = get_subwindow_no_window(im, pos, sz)

if isscalar(sz),  %square sub-window
    sz = [sz, sz];
end

xs = floor(pos(2)) + (1:sz(2)) - floor(sz(2)/2);
xxs  = xs;
ys = floor(pos(1)) + (1:sz(1)) - floor(sz(1)/2);
yys = ys;

%check for out-of-bounds coordinates, and set them to the values at
%the borders
xs(xs < 1) = 1;
ys(ys < 1) = 1;
xs(xs > size(im,2)) = size(im,2);
ys(ys > size(im,1)) = size(im,1);

%extract image
out = im(ys, xs, :);
% step = 2;
% cos_window = hann(size(out, 1)) * hann(size(out,2))';
% w1 = cos(linspace(-pi/step, pi/step, size(out, 1)));
% w2 = cos(linspace(-pi/step, pi/step, size(out, 2)));
% cos_window = w1' * w2;

% out = double(out) / 255;
% out = out - mean(out(:));
        
        
%pre-process window
% out = (double(out) / 255) - 0.5;  %normalize to range -0.5 .. 0.5
%     out = powerNormalise(double(out));
% out = cos_window .* out;  %apply cosine window

end

