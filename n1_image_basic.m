
%% Gaussian Noise
noise = randn([1000 2]);
% noise = rand([1000 2]); %uniform noise
hist3(noise);
% noise = randi([1 1000]); %intiger noise
% plot(noise);

%% Gaussian Noise Visualization 
hsize =31;
sigma = 5;
h = fspecial('gaussian',hsize,sigma);
surf(h);
% imagesc(h);


%% Image filter and Correlation
img = imread('Data\view1.png');


filter_size =5;
filter_sigma = 1;
filter = fspecial('gaussian',filter_size,filter_sigma);

smoothed = imfilter(img,filter,0);
% smoothed = imfilter(img,filter,'circular');
% smoothed = imfilter(img,filter,'replicate');
% smoothed = imfilter(img,filter,'symmetric');
imshow(smoothed)

%% salt and pepper noise and Median filter
img = imread('Data\view1.png');
img = rgb2gray(img);
imshow(img);
% make salt and pepper noise
noisy_img = imnoise(img, 'salt & pepper', 0.02);
imshow(noisy_img);

% median filter
median_filtered = medfilt2(noisy_img);
imshow(median_filtered);

