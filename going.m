function normed=going(score, centroidOfSalientROI,fullArea,maxDim)
    
    %rawScore=min(score(i,:));
    %maxScore=max(score(i,:));
    %temp=maxDim/3/2;
    
    
    sum=0;
    bench=0;
    for i=1:size(score,1)
        %a=((maxDim/6)/(min(score(i,:))))/maxDim;
        %a=1/((max(score(i,:)))/(min(score(i,:))));
        a=1/(maxDim/(min(score(i,:))));
        b=(centroidOfSalientROI(i).Area/fullArea);
        bench=max(score(i,:));
        bench=bench*fullArea;
        
        %disp(max(score(i,:)));
        %disp(min(score(i,:)));
        
        normed=(0.6*a+0.4*b);
        %normed=((10*a)+(10*b))/2;
        %disp(normed);
        sum=sum+normed;
    end
    %sum=sum/size(score,1); %size(score,1)is the number of ROIs
    
    normed=sum*10;
    
    