function New_im = Grayscale(im)
[r, c, ch]=size(im);
New_r = r;
New_c = c;
New_im = zeros(New_r,New_c);
for k=1:r
    for i=1:c
        New_im(k,i)=im(k,i,1)*0.3+im(k,i,2)*0.59+im(k,i,3)*0.11;
    end
end
New_im = uint8(New_im);
%figure,imshow(im),title('Original')
%figure,imshow(New_im),title('Grayscale')
end