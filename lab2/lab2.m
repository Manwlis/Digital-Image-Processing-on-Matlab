clear;
close all;
% 
% %Erotima 1
A = imread('contrast.jpg');
H = rgb2gray(A);
figure(1)
imhist(H)
title('Histogram')

newH = histeq(H);
figure(2)
imhist(newH)
title('Equalized histogram')
imwrite(newH,'Equalized_histogram.jpg');
figure(3)
imshow('Equalized_histogram.jpg');
title('Image with equalized histogram')
Zeros = 0;
Ones = 0;
BlackWhite = H;
[M,N]=size(H);
threshold = 200;
for i=1:M
 for j=1:N
     if( BlackWhite(i,j)>threshold )    
        BlackWhite(i,j)=255;
        Ones = Ones + 1;     
     else
        BlackWhite(i,j)=0;
        Zeros = Zeros + 1;
     end;
 end;
end;
figure(4);
imshow(BlackWhite);
title('Image after threshold.')
abs(Ones - Zeros)

% % Erotima 2
brain = imread('brain.gif');
k1 = 3;
k2 = k1 + 2;


medA = medfilt2(brain,[k1 k1]);
figure(5)
subplot(2,2,1)
imshow(medA)
title('Median Filter 9x9');

medB = medfilt2(brain,[k2 k2]);
subplot(2,2,2)
imshow(medB)
title('Median Filter 11x11');


gaussianfilterA = fspecial('gaussian',[k1 k1]);
gaussA = imfilter(brain,gaussianfilterA);
subplot(2,2,3)
imshow(gaussA)
title('Gaussian Filter 9x9');

gaussianfilterB = fspecial('gaussian',[k2 k2]);
gaussB = imfilter(brain,gaussianfilterB);
subplot(2,2,4)
imshow(gaussB)
title('Gaussian Filter 11x11');

% % Erotima 3

SnPbrain = imnoise(brain,'salt & pepper');
figure(6)
imshow(SnPbrain)
title('Salt and Pepper')

medANoise = medfilt2(SnPbrain,[k1 k1]);
figure(7)
subplot(2,2,1)
imshow(medANoise)
title('Median Filter 9x9 on salt and pepper image.');

medBNoise = medfilt2(SnPbrain,[k2 k2]);
subplot(2,2,2)
imshow(medBNoise)
title('Median Filter 11x11 on salt and pepper image.');

averageFilterANoise = fspecial('average',[k1 k1]);
averageA = imfilter(SnPbrain,averageFilterANoise);
subplot(2,2,3)
imshow(averageA)
title('Average Filter 9x9 on salt and pepper image.');

averageFilterBNoise = fspecial('average',[k2 k2]);
averageB = imfilter(SnPbrain,averageFilterBNoise);
subplot(2,2,4)
imshow(averageB)
title('Average Filter 11x11 on salt and pepper image.');

mse1 = immse(double(SnPbrain), double(medANoise));
mse2 = immse(double(SnPbrain), double(medBNoise));
mse3 = immse(double(SnPbrain), double(averageA));
mse4 = immse(double(SnPbrain), double(averageB));

fprintf('\n The mse1 is %0.4f\n', mse1);
fprintf('\n The mse2 is %0.4f\n', mse2);
fprintf('\n The mse3 is %0.4f\n', mse3);
fprintf('\n The mse4 is %0.4f\n', mse4);

%Erotima 4

h = [1 1 1; 1 -8 1; 1 1 1];
FirstFrame = rgb2gray(imread('RiverFlow1.bmp'));
SecondFrame = rgb2gray(imread('RiverFlow2.bmp'));

FirstFrameMed = medfilt2(FirstFrame,[k1 k1]);
FirstFrameH = imfilter(FirstFrame,h);

SecondFrameMed = medfilt2(SecondFrame,[k1 k1]);
SecondFrameH = imfilter(SecondFrame,h);

figure(8);
subplot(1,2,1)
imshow(FirstFrameMed)
title('First Frame with Median filter')

subplot(1,2,2)
imshow(SecondFrameMed)
title('Second Frame with Median filter')

figure(9)
imshow(FirstFrameMed-SecondFrameMed);
imwrite(FirstFrameMed-SecondFrameMed,'imageafterMed.bmp')
title('Substraction between the above two median filtered frames')

figure(10);
subplot(1,2,1)
imshow(FirstFrameH)
title('First Frame with H filter')

subplot(1,2,2)
imshow(SecondFrameH)
title('Second Frame with H filter')

figure(11)
imwrite(FirstFrameH-SecondFrameH,'imageafterH.bmp')
imshow(FirstFrameH-SecondFrameH);
title('Substraction between the above two H filtered frames')

