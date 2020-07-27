%% Load and convert image to double type, range [0, 1] for convenience
img = double(imread('Data\octagon.png')) / 255.; 
imshow(img); % assumes [0, 1] range for double images

%% Compute x, y gradients
[gx gy] = imgradientxy(img, 'sobel'); % Note: gx, gy are not normalized

%% Obtain gradient magnitude and direction
[gmag gdir] = imgradient(gx, gy);
imshow(gmag / (4 * sqrt(2))); % mag = sqrt(gx^2 + gy^2), so [0, (4 * sqrt(2))]
imshow((gdir + 180.0) / 360.0); % angle in degrees [-180, 180]

%% Find pixels with desired gradient direction
% my_grad = select_gdir(gmag, gdir, 1, 30, 60); % 45 +/- 15
mag_min = 1;
angle_low = 30;
angle_high = 60;
my_grad = gmag >= mag_min & angle_low <= gdir & gdir <= angle_high;
imshow(my_grad);  % NOTE: enable after you've implemented select_gdir

%% quiz find password
frizzy = imread('Data\frizzy.png');
froomer = imread('Data\froomer.png');
% show frizzy
figure,imshow(frizzy), title('frizzy original');
% show froomer
figure,imshow(froomer), title('froomer original');

frizzy_gray = rgb2gray(frizzy);
froomer_gray = rgb2gray(froomer);

frizzy_edges = edge(frizzy_gray,'canny');
froomer_edges = edge(froomer_gray,'canny');
% show frizzy edge
figure,imshow(frizzy_edges), title('frizzy edge');
% show froomer edge
figure,imshow(froomer_edges), title('froomer edge');
% show common edge
figure,imshow(frizzy_edges.*froomer_edges), title('Password');

%% Demo
lena = imread('Data/lena.png');
figure, imshow(lena), title('Original image, color');

%% Convert to monochrome (grayscale) using rgb2gray
lenaMono = rgb2gray(lena);
figure, imshow(lenaMono), title('Original image, monochrome');

%% Make a blurred/smoothed version
h = fspecial('gaussian',[11 11],4);
figure, surf(h);
lenaSmooth = imfilter(lenaMono,h);
figure, imshow(lenaSmooth), title('Smoothed image');

%% Edge for canny
lenaMono_edges = edge(lenaMono,'canny');
figure, imshow(lenaMono_edges), title('Original edges');

lenaSmooth_edges = edge(lenaSmooth,'canny');
figure, imshow(lenaSmooth_edges), title('Smoothed edges');

%% Laplacian of Gaussian
logEdges = edge(lenaMono, 'log');
figure, imshow(logEdges), title('Lapplacian edges');

%% edge manual
doc edge