% show location of the found location of a subset in the orignal image
function showDiff(x, y, subset, original)

    pkg load image;

    colormap('gray'), imshow(original);
    hold on;
    rectangle('Position', [x, y, size(subset, 2), size(subset, 1)], 'EdgeColor', 'b');
    hold off;
endfunction
