function new_im = Contrast(im,new_min,new_max)
[r, c, ch]=size(im);
new_r = r;
new_c = c;
old_min=min(im,[],'all');
old_max=max(im,[],'all');
new_im = zeros(new_r,new_c, ch);
for k=1:ch
    for i=1:r
        for j=1:c
            new_im(i,j,k)=((im(i,j,k)-old_min)/(old_max-old_min))*(new_max-new_min)+new_min;
            if (new_im(i,j,k)>255)
                new_im(i,j,k)=255;
            elseif(new_im(i,j,k)<0)
                new_im(i,j,k)=0;
            end
        end
    end
end
new_im = uint8(new_im);
figure,imshow(im),title('Original')
figure,imshow(new_im),title('Contrast')
end



