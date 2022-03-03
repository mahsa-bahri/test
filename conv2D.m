function [feature_map] = conv2D(img, filters, stride, padding)
f = size(filters, 1);
p = (f-1)/2;
nfilter=size(filters,3);
%% this is the slight change
img=uint8(img);
subplot(1,nfilter+1,1);
imshow(img);
%%
%%zero padding
if isequal(padding ,'same')
    img = padarray(img,[p p],0,'both');
end 

h=size(img,1);
w=size(img,2);
s=stride;
xlong=floor((h-f)/s)+1;
ylong=floor((w-f)/s)+1;


%finoutput is used to create the final image
finoutput=zeros(xlong,ylong);
page=zeros(xlong,ylong);    
output=cat(3,page,page,page);
i=1;
rowstep=0;
columnstep=0;


    for rgb =1:3
        for row = 1:s:h-f+1
            rowstep=rowstep+1;
            for column = 1:s:w-f+1
                columnstep=columnstep+1;
                local = img(row:row+f-1, column:column+f-1,rgb);
                if(nfilter<rgb)
                    output(rowstep, columnstep,rgb)=0;
                else   
                 convolution = double(local) .* filters(:,:,rgb) ;
                 output(rowstep, columnstep,rgb) = sum(convolution, 'all');
                end
            end
            columnstep=0;
        end 
        rowstep=0;
        if(nfilter>=rgb)
           %% i change the i to i+1
           finoutput=finoutput+output(:,:,rgb);
           ot = uint8(output(:,:,rgb));
           subplot(1,nfilter+1,i+1);
           %%
           imshow(ot);
           i=i+1;
        end
    end
 %%   i deleted this part in which finoutput is shown
%finoutput = uint8(finoutput);
%subplot(1,nfilter+1,nfilter+1);
%imshow(finoutput);
%%
feature_map=output;
end