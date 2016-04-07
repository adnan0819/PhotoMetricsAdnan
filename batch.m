function [saliency, gridPoints, centroidOfSalientROI, dist, score, normed, normed2,pics] = batch()
    
    pics = dir('test/indoors/*.jpg');
     
for k = 1:numel(pics)
   img = imread(pics(k).name);
   [saliency, gridPoints, centroidOfSalientROI, dist, score, normed] = main(img);
   normed2(k)=normed;
   
   %disp(normed);
    fprintf('{');
   fprintf('"id": %d, "name": "%s" , "score:" %d', k, pics(k).name, ceil(normed));
    if (k==numel(pics)) 
        fprintf('}\n');
    else
        fprintf('},\n');
    end
   %json='"id:';
   %disp(json);
end
