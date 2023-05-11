function new_im = Negatives(im)
 new_im= 255-im;
new_im = uint8(new_im);
figure,imshow(im),title('Original')
figure,imshow(new_im),title('Brightness')
end
