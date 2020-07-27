% my_gradient('leaves.png');
% my_gradient('octagon.png');
% my_gradient('moon.png');

function my_gradient(imgName)
    pkg load image;

    %% Load and convert image to double type, range [0, 1] for convenience
    img = imread(imgName);
    if (size(img, 3) == 3)
        img = rgb2gray(img);
    end
    img = double(img) / 255.;
    %imshow(img); % assumes [0, 1] range for double images

    %% Compute x, y gradients
    [gx gy] = imgradientxy(img, 'sobel'); % Note: gx, gy are not normalized

    %% Obtain gradient magnitude and direction
    [gmag gdir] = imgradient(gx, gy);
    imshow(gmag / (4 * sqrt(2))); % mag = sqrt(gx^2 + gy^2), so [0, (4 * sqrt(2))]
    %imshow((gdir + 180.0) / 360.0); % angle in degrees [-180, 180]

    %% Find pixels with desired gradient direction
    %my_grad = select_gdir(gmag, gdir, 1, 30, 60); % 45 +/- 15
    %imshow(my_grad);  % NOTE: enable after you've implemented select_gdir
endfunction
