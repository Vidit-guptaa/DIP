%Code to demonstrate the working of Local Binary Pattern for an image
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
LBP=zeros(m,n);
%Creating an empty matrix to store LBP values.

for i=2:m-1
    for j=2:n-1
        center=I(i,j);
        %Taking the center pixel value.

        binary=[
            I(i-1,j-1)>=center
            I(i-1,j)>=center
            I(i-1,j+1)>=center
            I(i,j+1)>=center
            I(i+1,j+1)>=center
            I(i+1,j)>=center
            I(i+1,j-1)>=center
            I(i,j-1)>=center
        ];
        %Comparing 8 neighbours with center pixel to form binary pattern.

        weights=[1 2 4 8 16 32 64 128]';
        %Assigning binary weights for decimal conversion.

        LBP(i,j)=sum(binary.*weights);
        %Converting binary pattern into decimal LBP value.
    end
end

LBP=uint8(LBP);
%Converting final LBP image to uint8 for display.

figure;
imshow(uint8(I));
title("Original Image");
%Displaying the input grayscale image.

figure;
imshow(LBP);
title("Local Binary Pattern Image");
%Displaying the LBP texture representation.