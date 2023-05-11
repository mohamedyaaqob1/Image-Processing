function new_im = Histogram_Matching(im,im2)
[r1, c1, ch1]=size(im);
[r2, c2, ch2]=size(im2);
colors = [0:255];
new_im1 = zeros(r1,c1,ch1);
new_im2 = zeros(r2,c2,ch2);
num_pixels1 = zeros(1,256);
num_pixels2 = zeros(1,256);
for k=1:ch1
    for l=1:256
        for i=1:r1
            for j=1:c1 
                if colors(l) == im(i,j,k)
                    num_pixels1(l) = num_pixels1(l) + 1;
                end    
            end 
        end     
    end
end    
for k=1:ch2
    for l=1:256
        for i=1:r2
            for j=1:c2 
                if colors(l) == im2(i,j,k)
                    num_pixels2(l) = num_pixels2(l) + 1;
                end    
            end 
        end     
    end
end   
Run_sum = zeros(1,256);
Run_sum2 = zeros(1,256);
for l=1:256
    if l == 1
        Run_sum(l) = num_pixels1(l);
    else
        Run_sum(l) = Run_sum(l-1) + num_pixels1(l);
    end    
end
for l=1:256
    if l == 1
        Run_sum2(l) = num_pixels2(l);
    else
        Run_sum2(l) = Run_sum2(l-1) + num_pixels2(l);
    end    
end
max_Run_sum = max(Run_sum);
Run_sum = round((Run_sum / max_Run_sum)*max(colors));
max_Run_sum2 = max(Run_sum2);
Run_sum2 = round((Run_sum2 / max_Run_sum2)*max(colors));
for k=1:ch1
    for i=1:r1
        for j=1:c1 
            new_im1(i,j,k) = Run_sum(im(i,j,k)+1);  
        end 
    end     
end  
for k=1:ch2
    for i=1:r2
        for j=1:c2 
            new_im2(i,j,k) = Run_sum2(im2(i,j,k)+1);  
        end 
    end     
end  
new_im = im;
  match = im;
  for g = 1:256
    min = 256;
    for b=1:256
      minus = abs(new_im1(g) - new_im2(b));
      if(minus < min)
        min = minus;
        match(g) = new_im2(b);
      end
    end
  end
  [row, col] = size(im);
  for r1 =1:row
    for c1 = 1:col
      new_im(r1,c1) = match(im(r1,c1)+1);
    end
  end

new_im = uint8(new_im);
figure,imshow(im),title('Original')
figure,imshow(im2),title('Original')
figure,imshow(new_im),title('Resized')
end
