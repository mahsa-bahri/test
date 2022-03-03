clc; clear;
%%%%%%%%%%% READ THE INPUT IMAGE %%%%%%%%%%%
img = imread('images/bengio.jpeg');
%img = imread('images/andrew.jpeg');
%img = imread('images/goodfellow.jpeg');
%img = imread('images/leskovec.jpeg');
%%%%%%%%%%% DEFINE FILTERS %%%%%%%%%%%
horizontal_edge = [[-1,-1,-1];
                   [0,0,0];
                   [1,1,1]];
               
vertical_edge = [[-1,0,1];
                 [-1,0,1];
                 [-1,0,1]];
             
sharpening = [[0,-1,0];
              [-1,5,-1];
              [0,-1,0]];
          
sobel_horizontal = [[-1,-2,-1];
                    [0,0,0];
                    [1,2,1]];
sobel_vertical = [[-1,0,1];
                  [-2,0,2];
                  [-1,0,1]];
              
gaussian_5x5 = (1/273)*[[1,4,7,4,1];
                        [4,16,26,16,4];
                        [7,26,41,26,7];
                        [4,16,26,16,4];
                        [1,4,7,4,1]];
                    
averaging_7x7 = (1/49)*ones(7,7);


          
% concatening filters ot build the `filters` tensor
filters = cat(3,averaging_7x7);
%filters = gaussian_5x5;
%%%%%%%%%%% PARAMETERS SETTING %%%%%%%%%%%
stride = 2;
padding = 'same';
%padding = 'valid';
%%%%%%%%%%% YOUR CODE HERE %%%%%%%%%%%
finaloutput=conv2D(img,filters,stride,padding);

%%%%%%%%%%% YOUR CODE HERE %%%%%%%%%%%