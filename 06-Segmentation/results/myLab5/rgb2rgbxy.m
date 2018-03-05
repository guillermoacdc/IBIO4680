function [ rgbxy ] = rgb2rgbxy( rgb )
%RGB2RGBXY This function converts a MxNx3 image in a MxNx5 image
%   The two additional planes& (4,5) represent the x-position and y-position respectively

	M=size(rgb,1);
	N=size(rgb,2);
	x=1:1:M;
	y=1:1:N;

	x=x'*ones(1,N);
	y=(y'*ones(1,M))';
	rgbxy = rgb; 
	rgbxy(:,:,4) = x;
	rgbxy(:,:,5) = y;
end


