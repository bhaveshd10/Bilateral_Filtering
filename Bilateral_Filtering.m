clear all;clc;close all

% Read Image
img=imread('Parrots_Noisy.tif');

% Define the spatial and tonal standard deviation
sigma_s=3;
sigma_t=400;

% Define window size
w=15;

% Pad image
padded_image= double(padarray(img,[w-1 w-1],0,'both'));
[l,n]=size(padded_image);

% Bilateral calculation
for i=1:l-w+1
    for j=1:n-w+1
        spatial=[];tonal=[];
        temp=padded_image(i:i+w-1,j:j+w-1);
        center=temp(round(w/2),round(w/2));
        for a=1:length(temp)
            for b=1:length(temp)
                dist=((round(w/2)-a)^2+((round(w/2)-b)^2));
                diffe=(center-temp(a,b))^2;
                spatial_gauss=exp(-dist/(2*sigma_s));
                tonal_gauss=exp(-diffe/(2*sigma_t));
                weight(a,b)=spatial_gauss.*tonal_gauss;
            end
        end
        weight=weight./sum(sum(weight));
        product=weight.*temp;
        out(i,j)=sum(sum(product));
    end
end

% Output image
figure,imshow(img)
figure,imshow(out,[])