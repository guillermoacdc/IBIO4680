clc
close all
clear all

%parameters setting
	imagePath='BSDS_tiny/55075';
	featureSpace='rgb'; %'rgb', 'lab', 'hsv', 'rgb+xy', 'lab+xy' or 'hsv+xy'
	clusteringMethod = 'kmeans'; %'kmeans', 'gmm', 'hierarchical' or 'watershed'
	numberOfClusters = 4;
%load of images an segmentation computing
	rgbImage=imread([imagePath '.jpg']);%lectura de la imagen
	gt=load([imagePath '.mat']);
	% Load segmentation from third human
	segm=gt.groundTruth{3}.Segmentation;
	%automatic segmentation
	segmentation = mySegmentByClustering( rgbImage, featureSpace, clusteringMethod, numberOfClusters);

%plotting of results in the sequence original, human segmented, automatic segmented
figure,
subplot(131),...
	imshow(rgbImage)
	title (['original image:' imagePath])
subplot(132),...
	image(segm) %Or imagesc?
	colormap colorcube
	title ('segmentation from third human')
subplot(133),...
	image(segmentation) 
	colormap colorcube
	title(['image segmented by ' featureSpace ', ' clusteringMethod ', Clusters:' numberOfClusters ]);