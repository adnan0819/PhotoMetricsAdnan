function [saliency, gridPoints, centroidOfSalientROI] = main(img)

saliency=gbvs(img);

gridPoints=drawGrid(img);

centroidOfSalientROI=labelROICentroid(saliency.master_map_resized);


