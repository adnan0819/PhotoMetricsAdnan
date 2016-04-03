function [saliency, gridPoints, centroidOfSalientROI, dist, score, normed] = main(img)


fullArea=size(img,1)*size(img,2);
%saliency=gbvs(img);
saliency = ittikochmap(img);
gridPoints=drawGrid(img);
centroidOfSalientROI=labelROICentroid(saliency.master_map_resized);
[dist, score]=distances(centroidOfSalientROI, gridPoints);
maxDim=max(size(img,1),size(img,2));
normed=going(score, centroidOfSalientROI,fullArea, maxDim);
