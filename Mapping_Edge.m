function Mapping_Edge (leftEdgeReal,rightEdgeReal,pc_tof,centerReal,finMean1,finMean2,finMean3,finMean4)

for i8 = 1:size(leftEdgeReal,1)
    
    if i8+1 > size(leftEdgeReal,1)
        break
    end
    
    figure(11);
    grid on
    hold on
    
    groundTruth = 320;
    cameraWidth = 15;
    
    %Plot Small Brown Box Position
    plot3(-30,1250,groundTruth - 130,'r+','LineWidth',2)
    plot3(-160,1250,groundTruth - 130,'r+','LineWidth',2)
    %Plot Small White Box Position
    plot3(200,950,groundTruth - 180,'r+','LineWidth',2)
    plot3(380,950,groundTruth - 180,'r+','LineWidth',2)
    %Plot Big White Box Position
    plot3(100,1550,groundTruth - 330,'r+','LineWidth',2)
    plot3(340,1550,groundTruth - 330,'r+','LineWidth',2)
    %Plot Last Box
    plot3(-100,1955,groundTruth - 400,'r+','LineWidth',2)
    plot3(100,1955,groundTruth - 400,'r+','LineWidth',2)
    
    if leftEdgeReal(i8,1) < pc_tof.cog(1) && rightEdgeReal(i8,1) < pc_tof.cog(1)
        if  leftEdgeReal(i8,4)>1350 && leftEdgeReal(i8,4) <= 1950
            
            plot3(leftEdgeReal(i8,1),leftEdgeReal(i8,3)+finMean1(1),leftEdgeReal(i8,2),'ko');%,'MarkerEdgeColor','k','MarkerFaceColor','#4DBEEE');
            leftEdgeReal(i8+1,3) = leftEdgeReal(i8+1,3) + (leftEdgeReal(1,4) - leftEdgeReal(i8,4));
            
            plot3(rightEdgeReal(i8,1),rightEdgeReal(i8,3)+finMean1(2),rightEdgeReal(i8,2),'ro','MarkerEdgeColor','k','MarkerFaceColor','#4DBEEE')
            rightEdgeReal(i8+1,3) = rightEdgeReal(i8+1,3) + (rightEdgeReal(1,4) - rightEdgeReal(i8,4));
            
            plot3(0,1950-leftEdgeReal(i8,4),320,'gv','MarkerEdgeColor','k','MarkerFaceColor','r')
            
            dL_ToCamera =  -cameraWidth/2 + leftEdgeReal(i8,1);
            dR_ToCamera =  -cameraWidth/2 + rightEdgeReal(i8,1);
            
            if dL_ToCamera >= -cameraWidth/2 || dR_ToCamera >= -cameraWidth/2
                sprintf('!!! WARNING !!! !!! OBJECT IN COLLISION COURSE ON THE LEFT SIDE!!!')
            elseif (dL_ToCamera <= -cameraWidth/2 && dL_ToCamera > -180) || (dR_ToCamera <= -cameraWidth/2 && dR_ToCamera > -180)
                sprintf('!!! WARNING !!! !!! NOT ENOUGH SPACE ON THE LEFT SIDE!!!')
            elseif dL_ToCamera < -180 || dR_ToCamera < -180
                sprintf('LEFT SIDE IS CLEAR!')
            end
        end
        
    elseif leftEdgeReal(i8,1) > pc_tof.cog(1) && rightEdgeReal(i8,1) > pc_tof.cog(1)
        if leftEdgeReal(i8,4)>1350 && leftEdgeReal(i8,4) <= 1950
            
            plot3(leftEdgeReal(i8,1),leftEdgeReal(i8,3)+finMean2(1),leftEdgeReal(i8,2),'o','MarkerEdgeColor','k','MarkerFaceColor','#77AC30');
            leftEdgeReal(i8+1,3) = leftEdgeReal(i8+1,3) + (leftEdgeReal(1,4) - leftEdgeReal(i8,4));
            
            plot3(rightEdgeReal(i8,1),rightEdgeReal(i8,3)+finMean2(2),rightEdgeReal(i8,2),'ko')%,'MarkerEdgeColor','k','MarkerFaceColor','#77AC30');
            rightEdgeReal(i8+1,3) = rightEdgeReal(i8+1,3) + (rightEdgeReal(1,4) - rightEdgeReal(i8,4));
            
            plot3(0,leftEdgeReal(i8,4),320,'gv','MarkerEdgeColor','k','MarkerFaceColor','r')
            
            dL_ToCamera =  leftEdgeReal(i8,1) - cameraWidth/2;
            dR_ToCamera =  rightEdgeReal(i8,1) - cameraWidth/2;
            
            if dL_ToCamera <= cameraWidth/2 || dR_ToCamera <= cameraWidth/2
                sprintf('!!! WARNING !!! !!! OBJECT IN COLLISION COURSE ON THE LEFT SIDE!!!')
            elseif (dL_ToCamera >= cameraWidth/2 && dL_ToCamera < 180) || (dR_ToCamera >= cameraWidth/2 && dR_ToCamera < 180)
                sprintf('!!! WARNING !!! !!! NOT ENOUGH SPACE ON THE LEFT SIDE!!!')
            elseif dL_ToCamera > 180 || dR_ToCamera > 180
                sprintf('LEFT SIDE IS CLEAR!')
            end
            
        elseif leftEdgeReal(i8,4) >= 500 &&  leftEdgeReal(i8,4)<=1350
            
            plot3(leftEdgeReal(i8,1),leftEdgeReal(i8,3)+finMean3(1),leftEdgeReal(i8,2),'o','MarkerEdgeColor','k','MarkerFaceColor','#A2142F');
            leftEdgeReal(i8+1,3) = leftEdgeReal(i8+1,3) + (leftEdgeReal(1,4) - leftEdgeReal(i8,4));
            
            plot3(rightEdgeReal(i8,1),rightEdgeReal(i8,3)+finMean3(2),rightEdgeReal(i8,2),'ko');%,'MarkerEdgeColor','k','MarkerFaceColor','#A2142F');
            rightEdgeReal(i8+1,3) = rightEdgeReal(i8+1,3) + (rightEdgeReal(1,4) - rightEdgeReal(i8,4));
            
            plot3(0,leftEdgeReal(i8,4),320,'gv','MarkerEdgeColor','k','MarkerFaceColor','r')
            
            
            dL_ToCamera =  leftEdgeReal(i8,1) - cameraWidth/2;
            dR_ToCamera =  rightEdgeReal(i8,1) - cameraWidth/2;
            
            if dL_ToCamera <= cameraWidth/2 || dR_ToCamera <= cameraWidth/2
                sprintf('!!! WARNING !!! !!! OBJECT IN COLLISION COURSE ON THE LEFT SIDE!!!')
            elseif (dL_ToCamera >= cameraWidth/2 && dL_ToCamera < 180) || (dR_ToCamera >= cameraWidth/2 && dR_ToCamera < 180)
                sprintf('!!! WARNING !!! !!! NOT ENOUGH SPACE ON THE LEFT SIDE!!!')
            elseif dL_ToCamera > 180 || dR_ToCamera > 180
                sprintf('LEFT SIDE IS CLEAR!')
            end
        end
        
    elseif leftEdgeReal(i8,4) >= 150 &&  leftEdgeReal(i8,4)<550 %leftCornerReal(i8,1) < pc_tof.cog(1)  && rightEdgeReal(i8,1) > pc_tof.cog(1)
        
        plot3(leftEdgeReal(i8,1),leftEdgeReal(i8,3)+finMean4(1),leftEdgeReal(i8,2),'o','MarkerEdgeColor','k','MarkerFaceColor','#FF00FF');
        leftEdgeReal(i8+1,3) = leftEdgeReal(i8+1,3) + (leftEdgeReal(1,4) - leftEdgeReal(i8,4));
        
        plot3(rightEdgeReal(i8,1),rightEdgeReal(i8,3)+finMean4(2),rightEdgeReal(i8,2),'o','MarkerEdgeColor','k','MarkerFaceColor','#FF00FF');
        rightEdgeReal(i8+1,3) = rightEdgeReal(i8+1,3) + (rightEdgeReal(1,4) - rightEdgeReal(i8,4));
        
        plot3(0,leftEdgeReal(i8,4),320,'gv','MarkerEdgeColor','k','MarkerFaceColor','r')
        
        sprintf('!!! WARNING !!! !!!OBJECT AHEAD!!!')
    end
end


title('Mapping of Detected Objects Error Corrected')
xlabel('X (mm)')
ylabel('Distance (mm)')
zlabel('Y (mm)')

for i9 = 1:size(leftEdgeReal,1)
    crd(i9,:) = [leftEdgeReal(i9,1:2),rightEdgeReal(i9,1:2)];
end

thres = 70;

Box{size(crd,1),1} = [];

for i12 = 1:size(crd,1)
    Box{i12,1} = crd(i12,1:4);
end

for i11 = 1:size(crd,1)
    minDist = Inf;
    idx = -1;
    for j11 = i11+1:size(crd,1)
        dL = sqrt((crd(i11,1) - crd(j11,1))^2 + (crd(i11,2) - crd(j11,2))^2);
        dR = sqrt((crd(i11,3) - crd(j11,3))^2 + (crd(i11,4) - crd(j11,4))^2);
        D = dR + dL;
        if minDist > D
            minDist = D;
            idx = j11;
        end
    end
    if minDist < thres
        Box{idx} = vertcat(Box{idx},Box{i11});
        Box{i11} = [];
    end
end
emptyCells = cellfun('isempty', Box);
Box(all(emptyCells,2),:) = [];

end

