%% template matching 1D
s = [-1 0 0 1 1 1 0 -1 -1 0 1 0 0 -1];
t = [1 1 0];
disp('Signal: '), disp([1:size(s,2); s]);
disp('Template: '), disp([1:size(t,2); t]);
%find template 1d
[maxValue rawIndex] = max(normxcorr2(t,s))
% 끝부분부터 매칭하기 때문에 template 의 size만큼 빼고 1을 더하는것이 중요함.
index = rawIndex - size(t,2) +1;
% max_corr = 0;
% index = 1;
% for i = 1:(size(s,2)-size(t,2))
%     corr = sum(s(i:i+size(t,2)-1).*t);
%     if (max_corr<corr)
%         max_corr=corr;
%         index=i;
%     end
% end

disp('Index: '),disp(index);

%% template matching 2D
img = imread('Data\view1.png');
img = rgb2gray(img);
imshow(img);
template = img(50:70, 50:70);
imshow(template);
c = normxcorr2(template,img);
% c(:) is platten c
[yRaw xRaw] = find(c == max(c(:)));
y = yRaw - size(template,1) +1;
x = xRaw - size(template,2) +1;
max(c(:))
% [y x] = find_template_2D(template, img);
disp([y x]); % should be the top-left corner of template in tablet