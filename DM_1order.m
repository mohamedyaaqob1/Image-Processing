function out = DM_1order(in,fact)
[r, c, ch]=size(in);
new_r=r*fact;
new_c=c*fact;
new_in = zeros(new_r,new_c,ch);
for k=1:ch
    for i=1:r
        for j=1:c 
            if(j==c)
                new_in(i*fact+1-fact,j*fact+1-fact:j*fact,k)= in(i,j,k);
            else
                s=j*fact+1-fact;
                l=j*fact;
                x=in(i,j,k);
                y=in(i,j+1,k);
                if(x>y)
                    max=x;
                    min=y;
                    m=fact;
                    while(s<=l)
                        if(s==(j*fact+1-fact))
                           new_in(i*fact+1-fact,s,k)=in(i,j,k); 
                        else
                           new_in(i*fact+1-fact,s,k)=round(((max-min)/fact)*m+min);
                        end
                        s=s+1;
                        m=m-1;
                    end
                elseif(x<y)
                    max=y;
                    min=x;
                    m=1;
                    while(s<=l)
                        if(s==(j*fact+1-fact))
                           new_in(i*fact+1-fact,s,k)=in(i,j,k); 
                        else
                           new_in(i*fact+1-fact,s,k)=round(((max-min)/fact)*m+min);
                           m=m+1;
                        end
                        s=s+1;     
                    end
                else
                  while(s<=l)
                      new_in(i*fact+1-fact,s,k)=in(i,j,k); 
                      s=s+1;
                  end
                           
                end
            end
        end
    end
end
[r,c,ch]=size(new_in);
new_r=r;
new_c=c;
out = zeros(new_r,new_c,ch);
for k=1:ch
    for i=1:c
        j=1;
        while (j<r) 
            if(j==(r-fact+1))
                out(j:r,i,k)=new_in(j,i,k);
            else
                s=j;
                l=j+fact;
                x=new_in(j,i,k);
                y=new_in(j+fact,i,k);
                if(x>y)
                    max=x;min=y;
                    m=fact;
                    while(s<=l)
                        if(s==j)
                        out(j,i,k)=new_in(j,i,k);
                        elseif(s<l)
                        out(s,i,k)= round(((max-min)/fact)*m+min);   
                        end
                        s=s+1;
                        m=m-1;
                    end
                elseif(x<y)
                    max=x;min=y;
                    m=1;
                    while(s<=l)
                        if(s==j)
                        out(s,i,k)= new_in(j,i,k);
                        elseif(s<l)
                        out(s,i,k)=round(((max-min)/fact)*m+min); 
                        m=m-1;
                        end
                        s=s+1;
                    end
                else
                    while(s<=l)
                        out(s,i,k)=new_in(j,i,k);
                        s=s+1;
                    end
                end
            end
            j=j+fact;
        end
    end
end
out=uint8(out);
figure,imshow(in),title('Original')
figure,imshow(out),title('Resized')
end