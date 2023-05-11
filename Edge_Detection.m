function new_im = Edge_Detection(im,type_mask)
[r, c, ch]=size(im);
new_r = r;
new_c = c;
point=[0 -1 0; -1 4 -1;0 -1 0];
Horizontal=[1 2 1;0 0 0;-1 -2 -1];
Vertical=[1 0 -1;2 0 -2;1 0 -1];
Diagonal_0=[0 1 2;-1 0 1;-2 -1 0];
Diagonal_1=[2 1 0;1 0 -1;0 -1 -2];
new = zeros(new_r+2,new_c+2);
new_im = zeros(new_r,new_c);
for k=1:ch
    for i=2:r+1
        for j=2:c+1
            new(i,j,k)=im(i-1,j-1,k);
        end
    end
end
for k=1:ch
    for i=2:r+1
        for j=2:c+1
            if type_mask==1
                m=new(i-1:i+1,j-1:j+1,k).*point;
                new_im(i-1,j-1,k)=sum(m,'all');
            elseif type_mask==2
                m=new(i-1:i+1,j-1:j+1,k).*Horizontal;
                new_im(i-1,j-1,k)=sum(m,'all');
            elseif type_mask==3
                m=new(i-1:i+1,j-1:j+1,k).*Vertical;
                new_im(i-1,j-1,k)=sum(m,'all');
            elseif type_mask==4
                m=new(i-1:i+1,j-1:j+1,k).*Diagonal_0;
                new_im(i-1,j-1,k)=sum(m,'all');
            elseif type_mask==5
                m=new(i-1:i+1,j-1:j+1,k).*Diagonal_1;
                new_im(i-1,j-1,k)=sum(m,'all');
            end
        end
    end
end
new_im = uint8(new_im);
figure,imshow(im),title('Original')
figure,imshow(new_im),title('Edge Detection')
end
