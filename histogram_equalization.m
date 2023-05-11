function new_im = histogram_equalization(im)
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
end    
Run_sum = zeros(1,256);
for l=1:256
    if l == 1
        Run_sum(l) = num_pixels(l);
    else
        Run_sum(l) = Run_sum(l-1) + num_pixels(l);
    end    
end
max_Run_sum = max(Run_sum);
Run_sum = round((Run_sum / max_Run_sum)*max(colors));
for k=1:ch
    for i=1:r
        for j=1:c 
            new_im(i,j,k) = Run_sum(im(i,j,k)+1);  
        end 
    end     
end  
new_im = uint8(new_im);
figure,imshow(im),title('Original')
figure,imshow(new_im),title('Resized')
end
