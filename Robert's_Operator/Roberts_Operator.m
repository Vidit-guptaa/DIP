%Code to demonstrate the working of Image segmentation for an image using
%Robert's Operator.
clc;
clear all;
close all;

I=imread("Tom.jpg");
if size(I,3)==3;
    I=rgb2gray(I);
end                       
%Loading an 8-bit grayscale image.
I=double(I);
%Loading grayscale image and converting to double for comparison operations.

[m,n]=size(I);
edge_img=zeros(m,n);
%Creating an empty matrix to store detected edges.

Gx=[1 0;0 -1];
Gy=[0 1;-1 0];
%Defining Roberts cross operator masks for x and y direction gradients.

for i=1:m-1
    for j=1:n-1
        
        block=I(i:i+1,j:j+1);
        %Extracting a 2x2 pixel block from the image.
        
        gx=sum(sum(block.*Gx));
        gy=sum(sum(block.*Gy));
        %Computing gradient values in x and y direction.
        
        edge_img(i,j)=sqrt(gx^2+gy^2);
        %Calculating gradient magnitude to detect edge strength.
        
    end
end

edge_img=uint8(edge_img);
%Converting result to uint8 for display.

figure;
imshow(uint8(I));
title("Original Image");
%Displaying the input grayscale image.

figure;
imshow(edge_img);
title("Edge Detected Image using Roberts Operator");
%Displaying the segmented edge image.