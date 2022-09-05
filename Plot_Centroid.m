function Plot_Centroid (centerReal,pc_tof,leftEdgeReal,rightEdgeReal,finMean1,finMean2,finMean3,finMean4)

figure(12);
grid on
hold on

groundTruth = 320;

%Plot Small Brown Box Position
plot3(-30,1250,groundTruth - 130,'r+','LineWidth',2)

%Plot Small White Box Position
plot3(200,950,groundTruth - 180,'r+','LineWidth',2)

%Plot Big White Box Position
plot3(100,1550,groundTruth - 330,'r+','LineWidth',2)

%Plot Last Box
plot3(-100,1955,groundTruth - 400,'r+','LineWidth',2)
plot3(100,1955,groundTruth - 400,'r+','LineWidth',2)

for i1 = 1:size(centerReal,1)
    if i1+1 > size(centerReal,1)
        break
    end
    
    if leftEdgeReal(i1,1) < pc_tof.cog(1) && rightEdgeReal(i1,1) < pc_tof.cog(1)
        if leftEdgeReal(i1,4)>1350 && leftEdgeReal(i1,4) <= 1950
            
            plot3(centerReal(i1,1),centerReal(i1,3)+finMean1(1),centerReal(i1,2),'p','MarkerEdgeColor','k','MarkerFaceColor','#4DBEEE');
            centerReal(i1+1,3) = centerReal(i1+1,3) + (centerReal(1,4) - centerReal(i1,4));
            
            plot3(rightEdgeReal(i1,1),rightEdgeReal(i1,3)+finMean1(2),rightEdgeReal(i1,2),'o','MarkerEdgeColor','k','MarkerFaceColor','#4DBEEE');
            rightEdgeReal(i1+1,3) = rightEdgeReal(i1+1,3) + (rightEdgeReal(1,4) - rightEdgeReal(i1,4));
            
            leftEdgeReal(i1+1,3) = leftEdgeReal(i1+1,3) + (leftEdgeReal(1,4) - leftEdgeReal(i1,4));
            
            plot3(0,1950 - leftEdgeReal(i1,4),320,'gv','MarkerEdgeColor','k','MarkerFaceColor','r')
        end
    elseif leftEdgeReal(i1,1) > pc_tof.cog(1) && rightEdgeReal(i1,1) > pc_tof.cog(1)
        
        if  leftEdgeReal(i1,4)> 1350 && leftEdgeReal(i1,4) <= 1950
            
            plot3(centerReal(i1,1),centerReal(i1,3)+finMean2(1),centerReal(i1,2),'p','MarkerEdgeColor','k','MarkerFaceColor','#77AC30');
            centerReal(i1+1,3) = centerReal(i1+1,3) + (centerReal(1,4) - centerReal(i1,4));
            
            plot3(leftEdgeReal(i1,1),leftEdgeReal(i1,3)+finMean2(1),leftEdgeReal(i1,2),'o','MarkerEdgeColor','k','MarkerFaceColor','#77AC30');
            leftEdgeReal(i1+1,3) = leftEdgeReal(i1+1,3) + (leftEdgeReal(1,4) - leftEdgeReal(i1,4));
            
            rightEdgeReal(i1+1,3) = rightEdgeReal(i1+1,3) + (rightEdgeReal(1,4) - rightEdgeReal(i1,4));
            
            plot3(0,1950 - leftEdgeReal(i1,4),320,'gv','MarkerEdgeColor','k','MarkerFaceColor','r')
            
        elseif leftEdgeReal(i1,4)>=500 && leftEdgeReal(i1,4) <= 1350
            
            plot3(centerReal(i1,1),centerReal(i1,3)+finMean3(1),centerReal(i1,2),'p','MarkerEdgeColor','k','MarkerFaceColor','#A2142F');
            centerReal(i1+1,3) = centerReal(i1+1,3) + (centerReal(1,4) - centerReal(i1,4));
            
            plot3(leftEdgeReal(i1,1),leftEdgeReal(i1,3) + +finMean3(1),leftEdgeReal(i1,2),'o','MarkerEdgeColor','k','MarkerFaceColor','#A2142F');
            leftEdgeReal(i1+1,3) = leftEdgeReal(i1+1,3) + (leftEdgeReal(1,4) - leftEdgeReal(i1,4));
            
            rightEdgeReal(i1+1,3) = rightEdgeReal(i1+1,3) + (rightEdgeReal(1,4) - rightEdgeReal(i1,4));
            
            plot3(0,1950 - leftEdgeReal(i1,4),320,'gv','MarkerEdgeColor','k','MarkerFaceColor','r')
        end
        
    elseif leftEdgeReal(i1,4) >= 150 &&  leftEdgeReal(i1,4)<550
        
        plot3(centerReal(i1,1),centerReal(i1,3)+finMean4(1),centerReal(i1,2),'p','MarkerEdgeColor','k','MarkerFaceColor','#FF00FF');
        centerReal(i1+1,3) = centerReal(i1+1,3) + (centerReal(1,4) - centerReal(i1,4));
        
        plot3(leftEdgeReal(i1,1),leftEdgeReal(i1,3)+finMean4(1),leftEdgeReal(i1,2),'o','MarkerEdgeColor','k','MarkerFaceColor','#FF00FF');
        plot3(rightEdgeReal(i1,1),rightEdgeReal(i1,3)+finMean4(2),rightEdgeReal(i1,2),'o','MarkerEdgeColor','k','MarkerFaceColor','#FF00FF');
        
        
        rightEdgeReal(i1+1,3) = rightEdgeReal(i1+1,3) + (rightEdgeReal(1,4) - rightEdgeReal(i1,4));
        leftEdgeReal(i1+1,3) = leftEdgeReal(i1+1,3) + (leftEdgeReal(1,4) - leftEdgeReal(i1,4));
        
        plot3(0,1950 - leftEdgeReal(i1,4),320,'gv','MarkerEdgeColor','k','MarkerFaceColor','r')
        
    end
    title('Mapping of Detected Objects with Centroid Error Corrected')
    xlabel('X (mm)')
    ylabel('Distance (mm)')
    zlabel('Y (mm)')
    
end
end