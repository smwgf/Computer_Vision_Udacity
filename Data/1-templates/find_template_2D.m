% example run
% tablet = imread('tablet.png');
% glyph = tablet(75:165, 150:185);
% [y x] = find_template_2D(glyph, tablet)

% find image subset in the original image
% or find the most similar area in the original image
function [yIndex xIndex] = find_template_2D(template, img)

    pkg load image;

    c = normxcorr2(template, img);

    [value, index] = max(c);
    [colVal, colIndex] = max(value);
    rowIndex = index(colIndex);

    yIndex = rowIndex - size(template, 1) + 1;
    xIndex = colIndex - size(template, 2) + 1;

endfunction
