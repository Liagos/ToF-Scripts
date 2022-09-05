function Polar_Plot(atan2_left,atan2_right,meanAvgBlobPix,BBox,PrincipalPoint)


if BBox(1,1) < PrincipalPoint(1) && BBox(1,1) + BBox(1,3)  < PrincipalPoint(1)
    atan2_left = atan2_left;
    atan2_right = atan2_right;
elseif BBox(1,1) > PrincipalPoint(1) && BBox(1,1) + BBox(1,3) > PrincipalPoint(1)
    atan2_left =  pi/2 - atan2_left;
    atan2_right = pi/2 - atan2_right;   
elseif BBox(1,1) < PrincipalPoint(1) && BBox(1,1) + BBox(1,3) > PrincipalPoint(1)
    atan2_left = -atan2_left;
    atan2_right = -atan2_right;
end

figure(3);
polarscatter(atan2_left,meanAvgBlobPix,'filled');
hold on;
polarscatter(atan2_right,meanAvgBlobPix,'filled');
thetalim([0 180])
title('Polar Scatter Plot Of Box 4')
end