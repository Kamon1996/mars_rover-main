# Mars Rover Problem Statement
A rover is to be landed by NASA on a plateau on Mars.

This plateau, which is curiously rectangular, must be navigated by this rover so that its onboard cameras can get a complete view of the surrounding terrain to send back to Earth.

A rover's position is represented by a combination of x and y coordinates and a letter representing one of the four cardinal compass points. The plateau is divided up into a grid to simplify navigation. An example position might be 0, 0, N, which means the rover is in the bottom left corner facing North.

In order to control a rover, NASA sends a simple string of letters. The possible letters are 'L', 'R' and 'M'.

'L' and 'R' make the rover spin 90 degrees left or right respectively, without moving from its current spot. 'M' means move forward one grid point, and maintain the same heading.

Assume that the square directly North from (x, y) is (x, y+ 1).

## INPUT:
The first line of input is the upper-right coordinates of the plateau, the lower-left coordinates are assumed to be 0,0.

The rest of the input is information pertaining to the rover that has been deployed. The first line gives the rover’s position, and the second line is a series of instructions telling the rover how to explore the plateau.

The position is made up of two integers and a letter separated by spaces, corresponding to the x and y coordinates and the rover’s orientation.

## OUTPUT
The output should be its final coordinates and heading.

## INSTRUCTIONS

1. First you should run "bundle install"
2. To run the solution - "rake execute".
3. To run the tests - "rake test".

![1200px-NASA_Mars_Rover](https://user-images.githubusercontent.com/4945372/142833099-4b212c47-71dd-4c90-bd2b-d58d9ef62f8e.jpeg)
