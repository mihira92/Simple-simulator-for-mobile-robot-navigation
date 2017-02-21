# Simple-simulator-for-mobile-robot-navigation
The variable ‘map’ which stores values of robot position, goal position, obstacles and free space. 
Obstacle = -1, Target = 0, Robot=1, Free Space=2, Explored space=3

There is a function called nextPos which returns value of 8 connected next cell values which can be added in the current position and a new position can be obtained. 

Inside a while loop, I am checking if the next cell is free space or obstacle, if the next cell is,
1)	Free space: go to that cell
2)	Obstacle: avoid it
3)	Target: Stop the robot

All the relevant data is streamed on the GUI. You have to click on ‘PlotGrid’ push button to start the robot to navigate.

1)	We can change the axis length and width in the code to make a bigger map
2)	We can easily use following functions for their respective purpose,
a.	Obs(x,y) : to draw an obstacle
b.	map(x,y) = -1 : to define an obstacle in the map
c.	rob(x,y,r) : to draw a robot of radius ‘r’ on the map at position (x,y) 
d.	nextPos(cn, curX, curY) : to give next cell position based on current position

There are many limitations in this navigation since it is a simple implementation,
1)	It randomly explores the free space, thus it can go to the same point ‘n’ number of times
2)	It can hit the edges of the obstacles: since I have not applied Minkowski Sums to expand the obstacle and assign a distance cost for not to go closer to the obstacle, the robot is currently hitting the edges.
3)	Rotation is assigned with the corresponding cell. Right now the robot directly turns in any direction without stopping and actually turning in the simulation.
