%电影院视角仰角问题
%zmf
clc;
clear;
n = 16;%总排数
h = 2.5;%屏幕高度
d = 6;%第一排座位到屏幕的水平距离
q = 0.8;%两排座椅间距
c = 1.1;%观众眼睛到地板的距离
c1 = 0.1;%观众眼睛到头顶的距离
k = 1:n;
k = k.';
theta = 10:20;%地板与地面夹角
theta = theta.';
nt = length(theta);
b = 2.0:0.1:3.0;%屏幕下边缘高度
b = b.';
nb = length(b);
K = k * ones(1,nt * nb);
T = ones(nb,1) * theta.';
T = reshape(T,1,nt * nb);
T = ones(n,1) * T;
B = b * ones(1,nt);
B = reshape(B,1,nt * nb);
B = ones(n,1) * B;
bk = atand((h+B-c-q*(K-1).*tand(T))./(d+q*(K-1)));%上仰角
gk = atand((B-c-q*(K-1).*tand(T))./(d+q*(K-1)));%下仰角
ak = bk - gk;%视角
ma = sum(ak)./n;%视角均值
sa = sqrt(sum((ak - ma).^2)./(n-1));%均方差
va = ma./sa;%变异系数
vasort = sort(va);%排序
for i = 0:length(vasort)
    vamax = vasort(1,length(vasort)-i);
    po = find(va == vamax);%位置
    bpo = bk(:,po);
    gpo = gk(length(po),po);
    if(bpo(3,1)<=30)%第三排仰角小于等于30度
        if(gpo > (c1-q*tand(T(1,po))))%前排不遮挡后排的约束条件
            fprintf('满足约束条件\n');
            fprintf('最大值为：%f\n',vamax);
            fprintf('屏幕下边缘距地面高度b为：%d米\n座位地板与水平地面夹角为：%d度',B(1,po),T(1,po));
            break;
        end
    end
end
