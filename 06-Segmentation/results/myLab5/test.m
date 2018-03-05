clc
close all
clear all

rgbImage=imread('BSDS_tiny/55075.jpg');%lectura de la imagen
figure,
imshow(rgbImage)
segmentation = mySegmentByClustering( rgbImage, 'lab', 'kmeans',4);
figure,
image(segmentation), title('image labeled by cluster index');
colormap colorcube

return

gt=load('BSDS_tiny/55075.mat')
% Load segmentation from third human
segm=gt.groundTruth{3}.Segmentation;
figure
image(segm) %Or imagesc?
colormap colorcube

% create a new figure
figure
% Boundaries from first human
bound=gt.groundTruth{1}.Boundaries;
image(bound)
colormap flag
