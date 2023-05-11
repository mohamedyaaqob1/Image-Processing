function new_im = Add_subtract(im,im2,type)

if type=='add'
    new_im = im +im2;
    figure,imshow(new_im),title('Add')
elseif type=='sub'
    new_im = im -im2;
    figure,imshow(new_im),title('subtract')
end
new_im=Contrast(new_im,0,255);
new_im = uint8(new_im);
figure,imshow(im),title('Original im1')
figure,imshow(im),title('Original im2')
end






