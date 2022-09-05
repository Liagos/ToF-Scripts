clear 'all';
close 'all';

%Add Dependncies
addpath('Melexis');
addpath('helperFunctions');
addpath('Point_cloud_tools_for_Matlab-master');


%%
pathToBltstreams = 'C:\Users\Odysseas Liagouris\Desktop\Scripts\Box2_Odysseas\testImages\Series';

%Define Path to CameraParams
pathToCalibrationFile = 'C:\Users\Odysseas Liagouris\Desktop\Scripts\Box2_Odysseas\cameraParams.mat';
load(pathToCalibrationFile); % To get cameraParams into Workspace 

%create class for image rectification
recImg = rectifyToFImage(cameraParams);

% Specify image reading Params
numToAverage = 40;
modulationAmplitude = 40;

% Specify if it is a YamlFile
isYamlFile = 1;

%Image with no checkerboard
% NoCheckersImage = 'C:\Users\Odysseas Liagouris\Desktop\Scripts\Box2_Odysseas\testImages\Series02\01.bltstream';
% [meanDistBckg,meanAmpBckg] =  EVK75024_VisualizerBLTSTREAM(NoCheckersImage,numToAverage,modulationAmplitude, 'display', 0);
% meanDist_corr_Bckg =recImg.rectifyRegular(meanDistBckg);
%%
% filesInSeries = 23;
BBox = [];
leftBoxCorner = [];
rightBoxCorner = [];
leftCornerReal = [];
rightCornerReal = [];
avg = [];
leftEdgeReal = [];
rightEdgeReal = [];
centerReal = [];

            

for series = 9:9
%     for file = 20:filesInSeries
    for distance = 1950:-50:150
        if ~isYamlFile
            tofImgName = strcat(pathToBltstreams,sprintf('%02d\\%02d.bltstream',series,file));
            % Simple -> See Images ... 'display',1);
            [meanDist,meanAmp] =  EVK75024_VisualizerBLTSTREAM(tofImgName,numToAverage,modulationAmplitude, 'display', 1,'full',1);
        else
            forceYmlRead =  true;
            tofImgName = strcat(pathToBltstreams,sprintf('%02d\\frame_%02dmm_600us_L70_##REP##_testimage.yml',series,distance));
            result = read3DToFYmlData(tofImgName, 'fullstruct,verbose',[''], forceYmlRead);
            meanDist =result.MeanDistImage;
            meanAmp = result.MeanAmplImage;
            
        end
        % Advanced
        %[meanDist, meanAmp,  stdDist, stdAmp, allDist, allAmp] =  EVK75024_VisualizerBLTSTREAM(tofImgName,numToAverage,modulationAmplitude, 'display', 0, 'full', 1, 'delta', 1);
         
        % Undistort only amplitude image
        undistortedImage = undistortImage(meanAmp, cameraParams);
        undistortedPoints = undistortPoints(cameraParams.ReprojectedPoints(:,:,1+1),cameraParams);
        
        % Convert image to 8 bit
        undistortedImage = uint8(undistortedImage);

        % Show Amplitude Image - Undistorted vs Distorted
        figure(1);
        subplot(1,2,1);
        imshow(meanAmp,[0 255]);
        title('Distorted')
        subplot(1,2,2);
        imshow(undistortedImage,[0 255]);
        title('Undistorted')
%%
        % Show Distance Image - Runtimecorrected vs uncorrected
        meanDist_corr = recImg.rectifyRegular(meanDist);
        
        % Calculate point on the floor beyond which all points will be not taken into consideration   
        floorPoint = distance*sin(320/distance);
        
        % Point Cloud Calculation
        pcl_corr = recImg.rectify(meanDist);
%         pcl_corr(:,3) = -pcl_corr(:,3);
        pc_tof = geoPointCloud(pcl_corr);
        
        pc_tof.select('Limits', [-Inf Inf; floorPoint Inf; -Inf Inf]);        
        pc_tof.X(pc_tof.act,3)= Inf;
        pc_tof.select('All');
           
        z_val = reshape(pc_tof.X(:,3),240,320);


        % Choose what we want to see in the picture with cumsum of Hist
%         dist2img = 255*(z_val - min(z_val(:))) / (max(z_val(:)) - min(z_val(:)));
        [counts,centers] = hist(z_val(:));
        csum = cumsum(counts);
        mindist_idx = find(csum>100,1);
        dist2img = uint8(z_val>=centers(mindist_idx)-150 & z_val<centers(mindist_idx) + 350);
        img2binary = imbinarize(dist2img);

        %Filter Image to improve regionprops
        img2binary = medfilt2(img2binary,[17 17]);

        % Apply regionprops to get only the area of interest
         stats = regionprops(img2binary,'BoundingBox','Centroid','PixelList','Image');
         
%%        
        % Construct the Bounding Box using line or rectangle
        for i0 = 1: size(stats,1)
            BBox(i0,:) = round(stats(i0).BoundingBox);
            stats(i0).Centroid = round(stats(i0).Centroid);
                                         b
            %Calculate Average Distance of Pixels in Blob found
            for i1 = 1:size(stats(i0).PixelList,1)
                avgPix(i1,1) = z_val(stats(i0).PixelList(i1,2),stats(i0).PixelList(i1,1));
            end
            
            avgPixIdx = find(avgPix ~= Inf);
            meanAvgBlobPix = mean(avgPix(avgPixIdx));
            
            % Calculate Rectangle
            figure(2);
            imshow(z_val,[])
            rectangle('Position',BBox(i0,:), 'EdgeColor',[0 1 0],'Linewidth',2);
           
            % Plot left corner and right corner   
            % Plot left corner
            hold on
            %plot(BBox(i0,1),BBox(i0,2),'r+')
            
            % Plot right corner
            %plot(BBox(i0,1) + BBox(i0,3),BBox(i0,2) ,'r+')
            
            [scaled_BBox] = Resize_BBox(stats(i0).BoundingBox,stats(i0).Centroid,cameraParams.PrincipalPoint,distance);
            % Plot Centroid of the Blob Detected
            plot(stats(i0).Centroid(1),stats(i0).Centroid(2),'o','MarkerEdgeColor','k','MarkerFaceColor','g');
%             plot([stats(i0).Centroid(1),BBox(i0,1)],[stats(i0).Centroid(2),BBox(i0,2)],'rs-');
                        
            % Plot Width of the Camera (Robot) divided by two on each side
            xline(cameraParams.PrincipalPoint(1)+7.5,'r--');
            xline(cameraParams.PrincipalPoint(1)-7.5,'r--');
            
            %Set conditions for the detected objects
            if BBox(i0,1) < cameraParams.PrincipalPoint(1) && (BBox(i0,1) + BBox(i0,3)) <= cameraParams.PrincipalPoint(1)
                plot([BBox(i0,1) + BBox(i0,3),cameraParams.PrincipalPoint(1)-7.5*2],[BBox(i0,2),BBox(i0,2)],'s-','MarkerEdgeColor','k','MarkerFaceColor','g')
                right_side_edgeBox = BBox(i0,1) + BBox(i0,3); 
                    if ((cameraParams.PrincipalPoint(1)-7.5*2) - (BBox(i0,1) + BBox(i0,3))) <= 50 
                        rectangle('Position', BBox(i0,:), 'EdgeColor',[1 0 0],'Linewidth',2);
                        sprintf('Too Close to the Right Edge of Box')
                    elseif (((cameraParams.PrincipalPoint(1)-7.5*2) - (BBox(i0,1) + BBox(i0,3))) > 50 && ((cameraParams.PrincipalPoint(1)-7.5*2) - (BBox(i0,1) + BBox(i0,3))) < 90   )
                        rectangle('Position', BBox(i0,:), 'EdgeColor',[1 1 0],'Linewidth',2);
                        sprintf('Object Close to the Right Edge of Box')
                    elseif (cameraParams.PrincipalPoint(1)-7.5*2) - (BBox(i0,1) + BBox(i0,3)) >= 90
                         sprintf('Left Side is Clear')
                         rectangle('Position', BBox(i0,:), 'EdgeColor',[0 1 0],'Linewidth',2);               
                    else
                         sprintf('NOT ENOUGH SPACE ON THE LEFT SIDE')
                         rectangle('Position', BBox(i0,:), 'EdgeColor',[1 0 0],'Linewidth',2);
                    end                 
            elseif BBox(i0,1) > cameraParams.PrincipalPoint(1) && (BBox(i0,1) + BBox(i0,3)) > cameraParams.PrincipalPoint(1)
                 plot([BBox(i0,1) ,round(cameraParams.PrincipalPoint(1)+7.5*2)],[BBox(i0,2),BBox(i0,2)],'gs-','MarkerEdgeColor','k','MarkerFaceColor','g');
                 left_side_edgeBox = BBox(i0,1);
                        if abs((cameraParams.PrincipalPoint(1)-7.5*2) - BBox(i0,1)) < 50 
                            sprintf('Too Close to the Left Edge of Object')
                            rectangle('Position', BBox(i0,:), 'EdgeColor',[1 1 0],'Linewidth',2);
                        elseif abs((cameraParams.PrincipalPoint(1)-7.5*2) - BBox(i0,1)) > 50 && abs((cameraParams.PrincipalPoint(1)-7.5*2) - BBox(i0,1)) < 90 
                            rectangle('Position', BBox(i0,:), 'EdgeColor',[1 1 0],'Linewidth',2);
                            sprintf('Object Close to the Left Edge of Box')
                        elseif abs((cameraParams.PrincipalPoint(1)-7.5*2) - BBox(i0,1)) >= 90
                            sprintf('Right Side is Clear')
                            rectangle('Position', BBox(i0,:), 'EdgeColor',[0 1 0],'Linewidth',2);
                        else
                            sprintf('NOT ENOUGH SPACE ON THE RIGHT SIDE')
                            rectangle('Position', BBox(i0,:), 'EdgeColor',[1 0 0],'Linewidth',2);
                        end
            elseif  BBox(i0,1) < cameraParams.PrincipalPoint(1) && (BBox(i0,1) + BBox(i0,3)) > cameraParams.PrincipalPoint(1)
                rectangle('Position', BBox(i0,:), 'EdgeColor',[1 0 0],'Linewidth',2);
                sprintf('!!!WARNING!!! !!!OBJECT AHEAD!!!')
            end

            % Plot Polarscatter with World Coordinates
            [atan2_left, atan2_right, leftReal, rightReal] = BBox_World(scaled_BBox,pc_tof.X);
            leftCornerReal = [leftCornerReal;leftReal,distance]; 
            rightCornerReal = [rightCornerReal;rightReal,distance]; 
            
            % Calculate Edges in Real World
            [leftEdge,rightEdge,center] = BBox_World_EdgeBox(pc_tof.X,BBox(i0,:),stats(i0).Centroid,z_val);
            leftEdgeReal = [leftEdgeReal;leftEdge,distance];
            rightEdgeReal = [rightEdgeReal;rightEdge,distance];
            centerReal = [centerReal;center,distance];
            
            Polar_Plot(atan2_left,atan2_right,meanAvgBlobPix,BBox(i0,:),cameraParams.PrincipalPoint)
            avg = [avg;meanAvgBlobPix,distance,BBox(i0,:)];

        end    
        pause(0.1)
    end
end

 %[Error_1,Error_2,Error_3,Error_4,finMean1,finMean2,finMean3,finMean4] = Plot_Box_Edges_World(leftEdgeReal,rightEdgeReal,pc_tof);
  
% Mapping(leftCornerReal,rightCornerReal,pc_tof,finMean1,finMean2,finMean3,finMean4);

Plot_Centroid(centerReal,pc_tof,leftEdgeReal,rightEdgeReal,finMean1,finMean2,finMean3,finMean4);

% Mapping_Edge (leftEdgeReal,rightEdgeReal,pc_tof,centerReal,finMean1,finMean2,finMean3,finMean4);

% Error_Plot_After_Fit(Error_1,Error_2,Error_3,Error_4);
