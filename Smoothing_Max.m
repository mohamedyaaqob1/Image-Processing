function new_im = Smoothing_Max(im,mask)
[r, c, ch]=size(im);
new_r = r;
new_c = c;
a=mask;
a=a-1;
new = zeros(new_r+a,new_c+a, ch);
new_im = zeros(new_r,new_c, ch);
for k=1:ch
    for i=1+a/2:r+a/2
        for j=1+a/2:c+a/2
            new(i,j,k)=im(i-a/2,(j-a/2),ch);
        end
    end
end
for k=1:ch
    for i=1+a/2:r+a/2
        for j=1+a/2:c+a/2
            w=new(i-a/2:i+a/2,j-a/2:j+a/2,k);
            new_im(i-a/2,j-a/2,k)=max(w(:));
        end
    end
end


new_im = uint8(new_im);
figure,imshow(im),title('Original image')
figure,imshow(new_im),title('smoothing max image')
end