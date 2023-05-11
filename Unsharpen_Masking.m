function new_im = Unsharpen_Masking(im)
sigma=2;
N = floor(3.7*sigma-0.5);
mask_size = 2*N+1;
t = floor(mask_size/2);
x=(-t:t);
mask=zeros(mask_size,mask_size);
coef=(1/(2*pi*(sigma^2)));
for i=1:mask_size
    for j=1:mask_size
        mask(i,j)=coef*exp(-((x(i)^2)+(x(j)^2))/(2*(sigma^2)));
    end
end
[r, c, ch]=size(im);
new_r = r;
new_c = c;
x=mask_size;
x=x-1;
new = zeros(new_r+x,new_c+x, ch);
New_im1 = zeros(new_r,new_c, ch);
for k=1:ch
    for i=1+x/2:r+x/2
        for j=1+x/2:c+x/2
            new(i,j,k)=im(i-x/2,(j-x/2),ch);
        end
    end
end
for k=1:ch
    for i=1+x/2:r+x/2
        for j=1+x/2:c+x/2
            a=new(i-x/2:i+x/2,j-x/2:j+x/2,ch).*mask(1:x+1,1:x+1);
            b=round(sum(a,'all'));
            New_im1(i-x/2,j-x/2,k)=b;
        end
    end
end
g_mask=im-New_im1;
new_im=im+g_mask;

new_im = uint8(new_im);
figure,imshow(img1),title('Original image')
figure,imshow(new_im),title('Unsharpen Masking')
end