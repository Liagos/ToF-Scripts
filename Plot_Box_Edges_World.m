function [Error_1,Error_2,Error_3,Error_4,finMean1,finMean2,finMean3,finMean4] = Plot_Box_Edges_World(leftEdgeReal,rightEdgeReal,pc_tof)

mean1 = [];
mean2 = [];
mean3 = [];
mean4 = [];

for i6 = 1:size(leftEdgeReal,1)
    figure(8);
    if leftEdgeReal(i6,1) < pc_tof.cog(1) && rightEdgeReal(i6,1) < pc_tof.cog(1)
        distanceFromBeginning = 700;
        if  leftEdgeReal(i6,4)>1350 && leftEdgeReal(i6,4) <= 1950
            euclid1_L = sqrt((leftEdgeReal(i6,4)-distanceFromBeginning+10)^2 + (130+30)^2);
            euclid1_R = sqrt((rightEdgeReal(i6,4)-distanceFromBeginning+10)^2 + (30)^2 );
            hold on
            %plot3(leftEdgeReal(i6,1),leftEdgeReal(i6,2),euclid1_L,'r+');
            %plot3(rightEdgeReal(i6,1),rightEdgeReal(i6,2),euclid1_R,'r+');
            plot3(leftEdgeReal(i6,1),leftEdgeReal(i6,3),leftEdgeReal(i6,2),'o','MarkerEdgeColor','k','MarkerFaceColor','#4DBEEE');
            plot3(rightEdgeReal(i6,1),rightEdgeReal(i6,3),rightEdgeReal(i6,2),'o','MarkerEdgeColor','k','MarkerFaceColor','#4DBEEE');
            grid on
            
            plot3(0,1950-leftEdgeReal(i6,4),320,'gv','MarkerEdgeColor','k','MarkerFaceColor','r')
            
            mean1 = [mean1;(euclid1_L-leftEdgeReal(i6,3)),(euclid1_R-rightEdgeReal(i6,3))];
        end
    elseif leftEdgeReal(i6,1) > pc_tof.cog(1) && rightEdgeReal(i6,1) > pc_tof.cog(1)
        distanceFromBeginning = 1000;
        if leftEdgeReal(i6,4)>1350 && leftEdgeReal(i6,4) <= 1950 %leftEdgeReal(i6,1) >140 && leftEdgeReal(i6,2)<300 && leftEdgeReal(i6,4)>1350 %  %pc_tof.cog(1)  && (leftEdgeReal(i6,2) - pc_tof.cog(2) > 100 && leftEdgeReal(i6,2) - pc_tof.cog(2) <=490)
            euclid2_L = sqrt((leftEdgeReal(i6,4)-distanceFromBeginning)^2 + (200)^2);
            euclid2_R = sqrt((leftEdgeReal(i6,4)-distanceFromBeginning)^2 + (200+250)^2);
           hold on
            %plot3(leftEdgeReal(i6,1),leftEdgeReal(i6,2),euclid2_L,'g+');
            %plot3(rightEdgeReal(i6,1),rightEdgeReal(i6,2),euclid2_R,'g+');
            plot3(leftEdgeReal(i6,1),leftEdgeReal(i6,3),leftEdgeReal(i6,2),'o','MarkerEdgeColor','k','MarkerFaceColor','#77AC30');
            plot3(rightEdgeReal(i6,1),rightEdgeReal(i6,3),rightEdgeReal(i6,2),'o','MarkerEdgeColor','k','MarkerFaceColor','#77AC30');
            
            plot3(0,1950-leftEdgeReal(i6,4),320,'gv','MarkerEdgeColor','k','MarkerFaceColor','r')
            
            grid on
            mean2 = [mean2;(euclid2_L-leftEdgeReal(i6,3)),(euclid2_R-rightEdgeReal(i6,3))];
        elseif leftEdgeReal(i6,4) >= 500 &&  leftEdgeReal(i6,4)<=1350 %pc_tof.cog(1) && (abs(rightEdgeReal(i6,1) - leftEdgeReal(i6,1))> 2.6 && rightEdgeReal(i6,1) - leftEdgeReal(i6,1) < 800)
            distanceFromBeginning = 400;
            euclid3_L = sqrt((leftEdgeReal(i6,4)-distanceFromBeginning)^2 + 100^2);
            euclid3_R = sqrt((rightEdgeReal(i6,4)-distanceFromBeginning)^2 + (100+240)^2);
            hold on
            %plot3(leftEdgeReal(i6,1),leftEdgeReal(i6,2),euclid3_L,'c+');
            %plot3(rightEdgeReal(i6,1),rightEdgeReal(i6,2),euclid3_R,'c+');
            plot3(leftEdgeReal(i6,1),leftEdgeReal(i6,3),leftEdgeReal(i6,2),'o','MarkerEdgeColor','k','MarkerFaceColor','#A2142F');
            plot3(rightEdgeReal(i6,1),rightEdgeReal(i6,3),rightEdgeReal(i6,2),'o','MarkerEdgeColor','k','MarkerFaceColor','#A2142F');
           
            plot3(0,1950-leftEdgeReal(i6,4),320,'gv','MarkerEdgeColor','k','MarkerFaceColor','r')
            
            grid on
            mean3 = [mean3;(euclid3_L-leftEdgeReal(i6,3)),(euclid3_R-rightEdgeReal(i6,3))];
        end
    elseif leftEdgeReal(i6,4) >= 150 &&  leftEdgeReal(i6,4)<550%leftEdgeReal(i6,1) < pc_tof.cog(1)  && rightEdgeReal(i6,1) > pc_tof.cog(1)
        euclid4_L = sqrt((leftEdgeReal(i6,4)+ 50)^2 + 65^2);
        euclid4_R = sqrt((rightEdgeReal(i6,4)+ 50)^2 + 65^2);
       hold on
        %plot3(leftEdgeReal(i6,1),leftEdgeReal(i6,2),euclid4_L,'m+');

        %plot3(rightEdgeReal(i6,1),rightEdgeReal(i6,2),euclid4_R,'m+');
        plot3(leftEdgeReal(i6,1),leftEdgeReal(i6,3),leftEdgeReal(i6,2),'o','MarkerEdgeColor','k','MarkerFaceColor','#FF00FF');
        plot3(rightEdgeReal(i6,1),rightEdgeReal(i6,3),rightEdgeReal(i6,2),'o','MarkerEdgeColor','k','MarkerFaceColor','#FF00FF');
       
        plot3(0,1950-leftEdgeReal(i6,4),320,'gv','MarkerEdgeColor','k','MarkerFaceColor','r')
        
        grid on
        mean4 = [mean4;(euclid4_L-leftEdgeReal(i6,3)),(euclid4_R-rightEdgeReal(i6,3))];
    end
    pause(0.1)
end
title('Points of Edged Detected')
xlabel('X(mm)')
ylabel('Y(mm)')
zlabel('Distance(mm)')

mean1_l = mean(mean1(:,1));
mean1_r = mean(mean1(:,2));

mean2_l = mean(mean2(:,1));
mean2_r = mean(mean2(:,2));

mean3_l = mean(mean3(:,1));
mean3_r = mean(mean3(:,2));

mean4_l = mean(mean4(:,1));
mean4_r = mean(mean4(:,2));

finMean1 = [];
finMean2 = [];
finMean3 = [];
finMean4 = [];

Error1_l = [];
Error1_r = [];
Error_1 = [];

Error2_l = [];
Error2_r = [];
Error_2 = [];

Error3_l = [];
Error3_r = [];
Error_3 = [];

Error4_l = [];
Error4_r = [];
Error_4 = [];

for i7 = 1:size(leftEdgeReal,1)
    %figure(9);
    if leftEdgeReal(i7,1) < pc_tof.cog(1) && rightEdgeReal(i7,1) < pc_tof.cog(1)
        distanceFromBeginning = 700;
        if  leftEdgeReal(i7,4)>1350 && leftEdgeReal(i7,4) <= 1950
            euclid1_L = sqrt((leftEdgeReal(i7,4)-distanceFromBeginning+10)^2 + (130+30)^2);
            euclid1_R = sqrt((rightEdgeReal(i7,4)-distanceFromBeginning+10)^2 + (30)^2 );
     %       hold on
      %      plot3(leftEdgeReal(i7,1),leftEdgeReal(i7,2),euclid1_L,'r+');
       %     plot3(rightEdgeReal(i7,1),rightEdgeReal(i7,2),euclid1_R,'r+');
            
        %    plot3(leftEdgeReal(i7,1),leftEdgeReal(i7,2),leftEdgeReal(i7,3) + abs(mean1_l),'ro');
         %   plot3(rightEdgeReal(i7,1),rightEdgeReal(i7,2),rightEdgeReal(i7,3) + abs(mean1_r),'ro');
          %  grid on
            
            finMean1 = [finMean1;mean1_l,mean1_r];
            
            
            Error1_l = [((euclid1_L - (leftEdgeReal(i7,3) + abs(mean1_l)))/(euclid1_L + leftEdgeReal(i7,3) + abs(mean1_l))/2)*100,euclid1_L];
            Error1_r = [((euclid1_R - (rightEdgeReal(i7,3) + abs(mean1_r)))/(euclid1_R + rightEdgeReal(i7,3) + abs(mean1_r))/2)*100,euclid1_R];
            Error_1 = [Error_1;Error1_l,Error1_r];
        end
    elseif leftEdgeReal(i7,1) > pc_tof.cog(1) && rightEdgeReal(i7,1) > pc_tof.cog(1)
        distanceFromBeginning = 1000;
        if leftEdgeReal(i7,4)>1450 && leftEdgeReal(i7,4) <= 1950 %leftEdgeReal(i7,1) >300 && leftEdgeReal(i7,2)>140 && leftEdgeReal(i7,4)>1350
            euclid2_L = sqrt((leftEdgeReal(i7,4)-distanceFromBeginning)^2 + (200)^2);
            euclid2_R = sqrt((leftEdgeReal(i7,4)-distanceFromBeginning)^2 + (200+250)^2);
           % hold on
            %plot3(leftEdgeReal(i7,1),leftEdgeReal(i7,2),euclid2_L,'g+');
            %plot3(rightEdgeReal(i7,1),rightEdgeReal(i7,2),euclid2_R,'g+');
            
            %plot3(leftEdgeReal(i7,1),leftEdgeReal(i7,2),leftEdgeReal(i7,3) + abs(mean2_l),'gs');
            %plot3(rightEdgeReal(i7,1),rightEdgeReal(i7,2),rightEdgeReal(i7,3) + abs(mean2_r),'gs');
            %grid on
            
            finMean2 = [finMean2;mean2_l,mean2_r];
           
            Error2_l = [((euclid2_L - (leftEdgeReal(i7,3) + abs(mean2_l)))/(euclid2_L + leftEdgeReal(i7,3) + abs(mean2_l))/2)*100,euclid2_L];
            Error2_r = [((euclid2_R - (rightEdgeReal(i7,3) + abs(mean2_r)))/(euclid2_R + rightEdgeReal(i7,3) + abs(mean2_r))/2)*100,euclid2_R];
            Error_2 = [Error_2;Error2_l,Error2_r];
            
        elseif leftEdgeReal(i7,4) >= 500 &&  leftEdgeReal(i7,4)<=1350 %leftEdgeReal(i7,2) < 22 &&  leftEdgeReal(i7,4)<=1350 
            distanceFromBeginning = 400;
            euclid3_L = sqrt((leftEdgeReal(i7,4)-distanceFromBeginning)^2 + 100^2);
            euclid3_R = sqrt((rightEdgeReal(i7,4)-distanceFromBeginning)^2 + (100+240)^2);
           % hold on
           % plot3(leftEdgeReal(i7,1),leftEdgeReal(i7,2),euclid3_L,'c+');
           % plot3(rightEdgeReal(i7,1),rightEdgeReal(i7,2),euclid3_R,'c+');
            
           % plot3(leftEdgeReal(i7,1),leftEdgeReal(i7,2),leftEdgeReal(i7,3) + abs(mean3_l),'cd');
           % plot3(rightEdgeReal(i7,1),rightEdgeReal(i7,2),rightEdgeReal(i7,3) + abs(mean3_r),'cd');
            
            finMean3 = [finMean3;mean3_l,mean3_r];

            
            Error3_l = [((euclid3_L - (leftEdgeReal(i7,3) + abs(mean3_l)))/(euclid3_L + leftEdgeReal(i7,3) + abs(mean3_l))/2)*100,euclid3_L];
            Error3_r = [((euclid3_R - (rightEdgeReal(i7,3) + abs(mean3_r)))/(euclid3_R + rightEdgeReal(i7,3) + abs(mean3_r))/2)*100,euclid3_R];
            Error_3 = [Error_3;Error3_l,Error3_r];
            
           % grid on
        end
    elseif leftEdgeReal(i6,4) >= 100 &&  leftEdgeReal(i6,4)<500%leftEdgeReal(i7,1) < pc_tof.cog(1)  && rightEdgeReal(i7,1) > pc_tof.cog(1)
        euclid4_L = sqrt((leftEdgeReal(i7,4)+ 50)^2 + 65^2);
        euclid4_R = sqrt((rightEdgeReal(i7,4)+ 50)^2 + 65^2);
       % hold on
       % plot3(leftEdgeReal(i7,1),leftEdgeReal(i7,2),euclid4_L,'m+');
       % plot3(rightEdgeReal(i7,1),rightEdgeReal(i7,2),euclid4_R,'m+');
        
       % plot3(leftEdgeReal(i7,1),leftEdgeReal(i7,2),leftEdgeReal(i7,3)+ abs(mean4_l),'mh');
       % plot3(rightEdgeReal(i7,1),rightEdgeReal(i7,2),rightEdgeReal(i7,3) + abs(mean4_r),'mh');
        
        finMean4 = [finMean4;mean4_l,mean4_r];
        
            Error4_l = [((euclid4_L - (leftEdgeReal(i7,3) + abs(mean4_l)))/(euclid4_L + leftEdgeReal(i7,3) + abs(mean4_l))/2)*100,euclid4_L];
            Error4_r = [((euclid4_R - (rightEdgeReal(i7,3) + abs(mean4_r)))/(euclid4_R + rightEdgeReal(i7,3) + abs(mean4_r))/2)*100,euclid4_R];
            Error_4 = [Error_4;Error4_l,Error4_r];

       % grid on
        pause (0.1)
    end
end
%title('BBox Edges Vs. Ground Truth & Error Corrected')
%xlabel('X (mm)')
%ylabel('Y (mm)')
%zlabel('Distance (mm)')


