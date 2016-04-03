function [saliency, gridPoints, centroidOfSalientROI, dist, score, normed, normed2,pics] = batch()
    
    pics = dir('TestImages/*.jpg');
for k = 1:numel(pics)
   img = imread(pics(k).name);
   [saliency, gridPoints, centroidOfSalientROI, dist, score, normed] = main(img);
   normed2(k)=normed;
   
   %disp(normed);
   fprintf('{"id": %d, "name": "%s" , "score:" %d, \n', k, pics(k).name, ceil(normed));
   fprintf('"');
   %json='"id:';
   %disp(json);
end
