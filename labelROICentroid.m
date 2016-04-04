function s=labelROI(gbvsmap)
% This function takes gbvs map and labels the salient regions
% More importantly, it returns the centroids of those regions 


bw=im2bw(gbvsmap);
%may need closing here
L = bwlabel(bw);
s = regionprops(L);
distance=[];
figure;
imshow(bw);
hold on
for k = 1:numel(s)
    c = s(k).Centroid;
    text(c(1), c(2), sprintf('%d', k), ...
        'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'middle');
end
hold off


