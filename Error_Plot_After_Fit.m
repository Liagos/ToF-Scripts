function Error_Plot_After_Fit (Error_1,Error_2,Error_3,Error_4)

x1_l = [];
y1_l = [];
x1_r = [];
y1_r = [];
 
 for i7 = 1:size(Error_1)
     figure(12);
     hold on
     x1_l = [x1_l;Error_1(i7,2)];
     y1_l = [y1_l;Error_1(i7,1)];
     x1_r = [x1_r;Error_1(i7,4)];
     y1_r = [y1_r;Error_1(i7,3)];
     subplot(2,2,1);
     plot(x1_l,y1_l,'rs-','LineWidth',2,'MarkerFaceColor','b');
     plot(x1_r,y1_r,'bs-','LineWidth',2,'MarkerFaceColor','r');
     grid on
     xlabel('Distance (mm)')
     ylabel('Relative Error (%)')
     title('Box 1 Distance Vs. Error')
 end
 
x2_l = [];
y2_l = [];
x2_r = [];
y2_r = [];
 
 for i7 = 1:size(Error_2)
     figure(12);
     hold on
     x2_l = [x2_l;Error_2(i7,2)];
     y2_l = [y2_l;Error_2(i7,1)];
     x2_r = [x2_r;Error_2(i7,4)];
     y2_r = [y2_r;Error_2(i7,3)];
     subplot(2,2,2);
     plot(x2_l,y2_l,'rs-','LineWidth',2,'MarkerFaceColor','b');
     plot(x2_r,y2_r,'bs-','LineWidth',2,'MarkerFaceColor','r');
     grid on
     xlabel('Distance (mm)')
     ylabel('Relative Error (%)')
     title('Box 2 Distance Vs. Error')
 end
 
x3_l = [];
y3_l = [];
x3_r = [];
y3_r = [];
 
 for i7 = 1:size(Error_3)
     figure(12);
     hold on
     x3_l = [x3_l;Error_3(i7,2)];
     y3_l = [y3_l;Error_3(i7,1)];
     x3_r = [x3_r;Error_3(i7,4)];
     y3_r = [y3_r;Error_3(i7,3)];
     subplot(2,2,3);
     plot(x3_l,y3_l,'rs-','LineWidth',2,'MarkerFaceColor','b');
     plot(x3_r,y3_r,'bs-','LineWidth',2,'MarkerFaceColor','r');
     grid on
     xlabel('Distance (mm)')
     ylabel('Relative Error (%)')
     title('Box 3 Distance Vs. Error')
 end
x4_l = [];
y4_l = [];
x4_r = [];
y4_r = [];
 
 for i7 = 1:size(Error_4)
     figure(12);
     hold on
     x4_l = [x4_l;Error_4(i7,2)];
     y4_l = [y4_l;Error_4(i7,1)];
     x4_r = [x4_r;Error_4(i7,4)];
     y4_r = [y4_r;Error_4(i7,3)];
     subplot(2,2,4);
     plot(x4_l,y4_l,'rs-','LineWidth',2,'MarkerFaceColor','b');
     plot(x4_r,y4_r,'bs-','LineWidth',2,'MarkerFaceColor','r');
     grid on
     xlabel('Distance (mm)')
     ylabel('Relative Error (%)')
     title('Box 4 Distance Vs. Error')
 end