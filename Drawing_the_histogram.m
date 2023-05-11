function new_im = Drawing_the_histogram(im)
[r, c, ch]=size(im);
colors = [0:255];
new_im = zeros(r,c,ch);
num_pixels = zeros(1,256);
for k=1:ch
    for l=1:256
        for i=1:r
            for j=1:c 
                if colors(l) == im(i,j,k)
                    num_pixels(l) = num_pixels(l) + 1;
                end    
            end 
        end     
    end
figure,imshow(im),title('Original')
figure,imshow(num_pixels),title('Drawing the histogram')


end