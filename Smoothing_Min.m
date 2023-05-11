function New_img = Smoothing_Min(img , Average_filter)

[r, c, ch]=size(img);
New_r = r;
New_c = c;
a=Average_filter;
a=a-1;

New = zeros(New_r+a,New_c+a, ch);
New_img = zeros(New_r,New_c, ch);


for k=1:ch
    for i=1+a/2:r+a/2
        for j=1+a/2:c+a/2
            New(i,j,k)=img(i-a/2,(j-a/2),ch);
        end
    end
end


for k=1:ch
    for i=1+a/2:r+a/2
        for j=1+a/2:c+a/2
            w=New(i-a/2:i+a/2,j-a/2:j+a/2,k);
            New_img(i-a/2,j-a/2,k)=min(w(:));
        end
    end
end


New_img = uint8(New_img);
figure,imshow(img),title('Original image')
figure,imshow(New_img),title('smoothing min image')
end
