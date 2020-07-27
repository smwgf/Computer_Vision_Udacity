% example run
% my_hough_line("edges.png");
% my_hough_line("edges2.png");
% my_hough_line("edges3.png");
% my_hough_line("edges_a.png");

function [H, value, rowIndex, colIndex] = my_hough_line(imgPath)
    pkg load image;

    img = imread(imgPath);
    img = uint8(img);
    img = rgb2gray(img);
    H = zeros(size(img, 2) * 2 + size(img, 1), 180);
    edges = edge(img, "canny");
    %imshow(edges);
    make_positive = size(img, 2) + size(img, 1);
    for x = 1:size(edges, 2);
        for y = 1:size(edges, 1);
            if (edges(y, x) == 1)
                for theta = 1:180
                    theta = deg2rad(theta);

                    d = x*cos(theta) - y*sin(theta);

                    d = round(d) + make_positive;
                    theta = round(rad2deg(theta));
                    H(d, theta) += 1;
                endfor
            endif
        endfor
    endfor

    [colVals, index] = max(H); % largest value in each column and in which row it was found
    [value, colIndex] = max(colVals); % take values and get maximum value and its column index
    rowIndex = index(colIndex); % use the column index to find row index

    rowIndex -= make_positive;

    x1 = 0;
    y1 = -rowIndex / sin(deg2rad(colIndex));

    x2 = size(img, 2);
    y2 = (cos(deg2rad(colIndex)) * x2 - rowIndex) / sin(deg2rad(colIndex));

    imshow(imgPath);
    hold on;
    line([x1, x2], [y1, y2]);
    hold off;

endfunction
