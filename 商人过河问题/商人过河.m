%商人过河问题3商人3随从
%zmf
clc;
clear;
z = zeros(30,3);
m = zeros(1,20);
d = [0,1,1;0,2,1;1,0,1;1,1,1;2,0,1];
z(1,:) = [3,3,1];
k = 1;
m(k) = 1;
flag = 1;
answer = 0;
while k>0
    if m(k)>5
        flag = 0;
        break;
    end
    p = 0;
    z(k+1,:)=z(k,:)+(-1)^k*d(m(k),:);
    a = z(k+1,1);
    b = z(k+1,2);
    c = z(k+1,3);
    if(a==3&&(b==0||b==1||b==2||b==3))||(a==1&&b==1)||(a==2&&b==2)||(a==0&&(b==0||b==1||b==2||b==3))
        for j =1:k
            if a==z(j,1)&&b==z(j,2)&&c==z(j,3)
                if m(k) ~=5
                    m(k)=m(k)+1;
                else
                    while (m(k)==5)&&(k>1)
                        k = k-1;
                    end
                    m(k)=m(k)+1;
                end
                p=1;
                break;
            else
                p=0;
            end
        end
        if p==1
            continue;
        end
        if a==0&&b==0
            answer = 1;
            fprintf('成功找到\n')
            for i=1:100
                fprintf('     第%2d次     %d      %d\n',i,z(i,1),z(i,2))
                if z(i,1)==0&&z(i,2)==0
                    break;
                end
            end
            if m(k)~=5
                m(k)=m(k)+1;
            else
                while (m(k)==5)&&(k>1)
                    k=k-1;
                end
                m(k)=m(k)+1;
            end
            continue;
        else
            k=k+1;
            m(k)=1;
            continue;
        end
    else
        if m(k)~=5
            m(k)=m(k)+1;
        else
            while(m(k)==5)&&(k>1)
                k=k-1;
            end
            m(k)=m(k)+1;
            continue;
        end
    end
end
if answer==0&&flag==0
    fprintf('无答案!\n');
end
