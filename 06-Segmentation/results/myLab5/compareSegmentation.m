function [ precision ] = compareSegmentation( humanSeg, automaticSeg )
%COMPARESEGMENTATION This function compares two segmentation pixel to pixel and computes a percentage of precision
%   
	rows	=	size(humanSeg,1);
	columns	=	size(humanSeg,2);
	compare	= 	humanSeg==automaticSeg;
	compare	=	reshape(compare, rows*columns,1);
	
	positives= sum(compare);

	precision= positives/(rows*columns);


end
