function new_im = Power_Law(im,Gamma)
im=im2double(im);
[r, c, ch]=size(im);
new_r = r;
new_c = c;
new_im = zeros(new_r,new_c, ch);
for k=1:ch
    for i=1:r
        for j=1:c
            new_im(i,j,k)=im(i,j,k)^Gamma;
         end
    end
end
new_im=Contrast(new_im,0,255);
new_im = uint8(new_im);
figure,imshow(im),title('Original')
figure,imshow(new_im),title('Power_ Law')
end

