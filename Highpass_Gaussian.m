function New_im = Highpass_Gaussian(im,D0)
img=im;
im = fft2(im);
im = fftshift(im);
Real = real(im);
Imag = imag(im);
[r, c]=size(Real);
New_r = r;
New_c = c;
M=r;
N=c;
a=zeros(New_r,New_c);
filter = zeros(New_r,New_c);
for i=1:r
    for j=1:c
        a(i,j)=((i-M/2)^2+(j-N/2)^2)^(0.5);
        filter(i,j)=1-exp(-(a(i,j))^2/(2*D0)^2);
    end
end
for i=1:r
    for j=1:c
        Real(i,j)=Real(i,j).*filter(i,j);
        Imag(i,j)=Imag(i,j).*filter(i,j);
    end
end
New_im=ifftshift(Real+(1.0i)*Imag);
New_im=ifft2(New_im);
New_im = uint8(New_im);
figure,imshow(img),title('Original')
figure,imshow(New_im),title('Highpass Gaussian')
end