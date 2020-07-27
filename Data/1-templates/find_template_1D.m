% example run
% s = [-1 0 0 1 1 1 0 -1 -1 0 1 0 0 -1];
% t = [-1 -1 0];
% index = find_template_1D(t, s)

% Locate template t in signal s and return index
function index = find_template_1D(t, s)
    pkg load image;
    c = normxcorr2(t, s);
    [maxValue index] = max(c);
    index = index - size(t, 2) + 1;
endfunction
