% y = 120;
% b = 100;
% strip_left = left_gray(y:(y + b - 1), :);
% strip_right = right_gray(y:(y + b - 1), :);
% plot(match_strips(strip_left, strip_right, 10));

function disparity = match_strips(strip_left, strip_right, b)
    % For each non-overlapping patch/block of width b in the left strip,
    %   find the best matching position (along X-axis) in the right strip.
    % Return a vector of disparities (left X-position - right X-position).
    % Note: Only consider whole blocks that fit within image bounds.
    numBlocks = floor(size(strip_left, 2) / b);
    disparity = zeros([1 numBlocks]);
    for block = 0:(numBlocks - 1)
        xLeft = block * b + 1;
        patchLeft = strip_left(:, xLeft:(xLeft + b - 1));
        xRight = find_best_match(patchLeft, strip_right);
        disparity(1, block + 1) = xLeft - xRight;
    endfor
endfunction