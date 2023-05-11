function new_im = Convert_to_Gray(im)

new_im=im(:,:,1)*0.3+im(:,:,2)*0.59+im(:,:,3)*0.11;

new_im = uint8(new_im);
figure,imshow(im),title('Original')
figure,imshow(new_im),title('Grayscale')
end