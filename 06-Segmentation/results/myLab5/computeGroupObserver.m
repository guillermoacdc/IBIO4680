function [ k observer ] = computeGroupObserver( gt )
%COMPUTEGROUPOBSERVER This function computes the groups of segmentation k for the observer with most groups
%   

for n=1:size(gt.groundTruth,2)
    segm=gt.groundTruth{n}.Segmentation;
    groups(n)=max(max(segm));
end
observer = find(groups==max(groups),1);
k=max(groups);
end
