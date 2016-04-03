function [dist, score]=distances(centroidOfSalientROI, gridPoints)
    %each of these are distances from(2,2), (2,3), (3,2), (3,3)
    %n is the number of salient regions
    
    %measuring distances from points of grid
    for n=1:size(centroidOfSalientROI,1)
         %distance from (2,2)
         dist(n,1) = sqrt((centroidOfSalientROI(n).Centroid(1) - gridPoints(2,2,1)).^2 + (centroidOfSalientROI(n).Centroid(2) - gridPoints(2,2,2)).^2);
         %distance from (2,3)
         dist(n,2) = sqrt((centroidOfSalientROI(n).Centroid(1) - gridPoints(2,3,1)).^2 + (centroidOfSalientROI(n).Centroid(2) - gridPoints(2,3,2)).^2);
         %distance from (3,2)
         dist(n,3) = sqrt((centroidOfSalientROI(n).Centroid(1) - gridPoints(3,2,1)).^2 + (centroidOfSalientROI(n).Centroid(2) - gridPoints(3,2,2)).^2);
         %distance from (3,3)
         dist(n,4) = sqrt((centroidOfSalientROI(n).Centroid(1) - gridPoints(3,3,1)).^2 + (centroidOfSalientROI(n).Centroid(2) - gridPoints(3,3,2)).^2);

    end
    
    % ------------------------------------------
    % ------(2,2)---<Line 1>----(2,3)-----------
    % --L3----|-------------------|-----L4-------
    % --------|-------------------|--------------
    % ------(3,2)----<Line 3>---(3,3)------------
    % -------------------------------------------
    
    % Scoring
    for m=1:size(centroidOfSalientROI,1)
         
         %disp (dist(m,1));
         score(m,1)=(dist(m,1)+dist(m,2))/2; %Scored from Line 1 (see above for figure)
         
         score(m,2)=(dist(m,3)+dist(m,4))/2; %Scored from Line 2 (see above for figure)
         %distance from (2,2)
         
         score(m,3)=(dist(m,1)+dist(m,3))/2; %Scored from Line 3 (see above for figure)
         %distance from (2,2)
         
         score(m,4)=(dist(m,2)+dist(m,4))/2; %Scored from Line 4 (see above for figure)
         %distance from (2,2)
         
    end 
         
       
    
    
    
    %So that I myself dont forget the calls before normalizing - Adnan
    
    %Example: A call like x=dist(1,1) is distance of (2,2) to Salient
    %regions 1
    
    %Example: A call like x=dist(1,2) is distance of (2,3) to Salient
    %regions 1
    
    %Example: A call like x=dist(1,3) is distance of (3,2) to Salient
    %regions 1
    
    %Example: A call like x=dist(1,4) is distance of (3,3) to Salient
    %regions 1
    
    %Example: A call like x=dist(2,1) is distance of (2,3) to Salient
    %regions 2
    
    %and so on
            
