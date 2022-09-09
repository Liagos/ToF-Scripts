# Obstacle Detection for Mobile Robot using a 3D ToF Camera

This repository contains the code for the project "Obstacle Detection for Mobile Robot using a 3D ToF Camera". The goal of this project is for an autonomous ground vehicle (AGV) to collect, process, and visualize sensor data, in order to identify objects in its surrounding and define their position in space.

This repository is organised as follows:
- The ***Box2_V_1_5*** file contains the the code we use to import and process the acquired by the Time-Of-Flight sensor.
- ***BBox_World_EdgeBox*** file is used to shift the points from the edges of the created bounding box onto the edges of the actual box used for the calibration.
- ***Polar_plot*** is used to plot the angle of the left and right box edge
- ***Plot_Box_Edges*** is used to plot the detected points and their corresponding ground truth.
- ***Mapping_Edge*** is used to plot the edge of the detected boxes along with their ground truth.

|------------------------------------|

Here we provide the Matlab code we use to import and process the data acquired by the Time-Of-Flight sensor. For this reason, we use the script Box2_V_1_5.

The helper functions we use are:
- BBox_World_EdgeBox which is used to shift the points from the edges of the created bounding box onto the the edges of the actual box used for the           calibration.
 
- Polar_plot is used to plot the angle of the left and right box edge.

- Plot Box Edges is used to plot the detected points and their corresponding ground truth.

- Mapping_Edge which is used to plot the edge of the detected boxes along with their ground truth.
