% example run
% my_hough_line("edgecoin.jpg");

function [H] = my_hough_circle(imgPath)
    pkg load image;

    radius = 34;

    img = imread(imgPath);
    img = uint8(img);

    imgX = size(img, 2);
    imgY = size(img, 1);

    %imshow(img);
    if (size(img, 3) == 3)
        img = rgb2gray(img);
    end
    H = zeros(imgX + 2*radius, imgY + 2*radius);
    edges = edge(img, "canny");
    %imshow(edges);

    r2 = radius^2;
    for x = 1:size(edges, 2);
        x2 = x^2;
        x / size(edges, 2) * 100
        for y = 1:size(edges, 1);
            if (edges(y, x) == 1)
              amin = x - radius;
              amax = x + radius;
              y2 = y^2;
              for a = amin:amax;
                  c = sqrt(4*y2-4*(x2-2*x*a+a^2+y2-r2));
                  b1 = round((2*y-c)/2) + radius;
                  b2 = round((2*y+c)/2) + radius;
                  H(a + radius, b1) += 1;
                  H(a + radius, b2) += 1;
              endfor
            endif
        endfor
    endfor

    % get rid of radius indexing (see above)
    H([1:radius],:) = [];
    H(:,[1:radius]) = [];
    H(:,end-radius+1:end) = [];
    H(end-radius+1:end,:) = [];
    H = transpose(H);

    % find point above 70 threshold
    maxs = find(H>70);

    % draw circles
    imshow(img);
    hold on;
    for i = 1:size(maxs)
        index = maxs(i);
        circleX = floor(index / imgY);
        circleY = index - circleX * imgY;
        viscircles([circleX, circleY], radius);
    endfor
    hold off;

endfunction
