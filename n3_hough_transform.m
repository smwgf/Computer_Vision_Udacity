pkg load image % in octave

img = imread('Data\shapes.png');
grays = rgb2gray(img);
edges = edge(grays,'canny');

figure, imshow(img), title('Original image');
figure, imshow(grays), title('Grayscale');
figure, imshow(edges), title('Edge pixels');

[accum theta rho] = hough(edges);
% figure, imagesc(accum,'XData', theta, 'YData', rho), title('Hough accumulator'); %matlab
figure, imagesc(theta, rho,accum), title('Hough accumulator'); %octave

peaks = houghpeaks(accum,100);
hold on; plot(theta(peaks(:,2)), rho(peaks(:,1)),'rs'); hold off;

% Find Lines (segment) in the image
line_segs = houghlines(edges, theta, rho, peaks);

figure, imshow(img), title('Line segments');
hold on;
for k = 1:length(line_segs)
  endpoints = [line_segs(k).point1; line_segs(k).point2];
  plot(endpoints(:,1),endpoints(:,2),'LineWidth',2,'Color','green');
endfor
hold off;

% Alt.: More precise line
peaks = houghpeaks(accum,100,'Threshold',ceil(0.6 * max(accum(:))),'NHoodSize', [5 5]);
% figure, imagesc(accum,'XData', theta, 'YData', rho), title('Hough accumulator'); %matlab
figure, imagesc(theta, rho,accum), title('Hough accumulator'); %octave
hold on; plot(theta(peaks(:,2)), rho(peaks(:,1)),'rs'); hold off;

line_segs = houghlines(edges, theta, rho, peaks,'FillGap',50,'MinLength',100);

figure, imshow(img), title('Line segments');
hold on;
for k = 1:length(line_segs)
  endpoints = [line_segs(k).point1; line_segs(k).point2];
  plot(endpoints(:,1),endpoints(:,2),'LineWidth',2,'Color','green');
endfor
hold off;