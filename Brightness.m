function new_im = Brightness(im,offset,type)
[r, c, ch]=size(im);
new_r = r;
new_c = c;
new_im = zeros(new_r,new_c, ch);
for k=1:ch
    for i=1:r
        for j=1:c
            if type=="Bright"
                new_im(i,j,k)= (im(i,j,k)+offset);
                if (new_im(i,j,k)>255)
                    new_im(i,j,k)=255;
                elseif(new_im(i,j,k)<0)
                    new_im(i,j,k)=0;
                end
            elseif type=="Dark"
                new_im(i,j,k)= (im(i,j,k)-offset);
                if (new_im(i,j,k)>255)
                    new_im(i,j,k)=255;
                elseif(new_im(i,j,k)<0)
                    new_im(i,j,k)=0;
                end
            end   
        end
    end
end
new_im = uint8(new_im);
figure,imshow(im),title('Original')
figure,imshow(new_im),title('Brightness')
end





