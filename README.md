# Obstacle Detection for Mobile Robot using a 3D ToF Camera

This repository contains the code for the project "**Obstacle Detection for Mobile Robot using a 3D ToF Camera**". The goal of this project is to build a prototype system that enables an autonomous ground vehicle (AGV) to successfully identify objects and their position in space.

The repository is organised as follows:
- The `Box2_V_1_5.m` file imports and process the acquired by the data of the Time-Of-Flight sensor.
- The `BBox_World_EdgeBox.m` file shifts the points from the edges of the created bounding box onto the edges of the actual box used for the calibration.
- The `Polar_plot.m` file plots the angle of the left and right box edge.
- The `Plot_Box_Edges.m` file plots the detected points and their corresponding real position (ground truth).
- `Mapping_Edge.m` file is used to plot the edges of the detected boxes along with the real edges (ground truth).
