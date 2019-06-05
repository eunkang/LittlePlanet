clear;
clc;
% sanfrancisco, nightview, oneworld, quayside, terranea
image = imread('sanfrancisco.jpg'); %load image
[height1,width1,~] = size(image); % matrix of image
image = imcrop(image) % crop image 
image_o = imread('sanfrancisco.jpg'); % load image
image = flip(image); % flip image
% exchang the x axis and y axis (rotate 90 degrees)
%                      x, y, color values
%           1, 2, 3 -> 2, 1, 3
image = permute(image, [2,1,3]);

[height,width,~] = size(image); % Pull height, width values of image. 
% Third part is the RGB value position. '~' is a arugment placeholder
plane = min(height,width)/2; % Determine the length of reference plane for rotate
% This computes the rho and theta values ??at each location and stores them in an array.
[rho,theta] = meshgrid(linspace(0,plane-1,plane), linspace(0,2*pi)); 
[x,y] = pol2cart(theta, rho); % Calculate location to put into matrix with rho and theta values
emptyM = zeros(size(x)); % set the empty matrix z to have all zero with same size as x for speed efficiency
warp(x, y, emptyM, image), view(2), axis square tight off % after converting into polar coord