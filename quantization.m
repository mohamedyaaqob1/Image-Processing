function new_im = quantization(im,k_num)
[r, c, ch]=size(im);
graylevel = 2^k_num;
Gab = 256/graylevel;
colors=Gab:Gab:256;
new_im = zeros(r,c, ch);
for k=1:ch
    for i=1:r
        for j=1:c
         temb = im(i,j,k)/Gab;
         index = floor(temb);
         if index > (max(colors))
            y = size(x);
            index = y(2)-1;
            new_im(i,j,k) = colors(index);
         elseif index < 1
             index = 1;
             new_im(i,j,k) = colors(index);
         else 
              new_im(i,j,k) = colors(index);
         end
        end
    end
end
new_im = uint8(new_im);
%figure,imshow(im),title('Original')
%figure,imshow(new_im),title('Quantized')
end