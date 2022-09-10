# Obstacle Detection for Mobile Robot using a 3D ToF Camera

This repository contains the code for the project "**Obstacle Detection for Mobile Robot using a 3D ToF Camera**". The goal of this project is to build a prototype system that enables an autonomous ground vehicle (AGV) to successfully identify objects and their position in space.

The repository is organised as follows:
- The `Box2_V_1_5.m` file contains the the code we use to import and process the acquired by the Time-Of-Flight sensor.
- `BBox_World_EdgeBox.m` file is used to shift the points from the edges of the created bounding box onto the edges of the actual box used for the calibration.
- `Polar_plot.m` is used to plot the angle of the left and right box edge
- `Plot_Box_Edges.m` is used to plot the detected points and their corresponding ground truth.
- `Mapping_Edge.m` is used to plot the edge of the detected boxes along with their ground truth.
