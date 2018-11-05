clear;
close all;

[f,map] = imread('parrots.bmp');
original = f;
figure(1)
colormap(map);
image(f);
title('Original Image');

%εφαρμογή αλλοίωσης εικόνας

parrotsNoise = imnoise(f,'gaussian');

AverageFilter = fspecial('average',[7 7]);
g = imfilter(parrotsNoise,AverageFilter);

figure(2);
colormap(map);
image(g);
title('Image after applying average filter and gaussian noise');


%Wiener φίλτρο
[M, N] = size(f);
gama = 1; 

F = fft2(f);
G = fft2(g);
H = fft2(AverageFilter,M, N); 
Hconjugate = conj(H);
Sf = abs(F).^2;
Sn = 0.01; %%Αφού η default τιμή της διασποράς είναι 0.01.

FapproxFreq = (Hconjugate./(abs(H).^2 + gama*(Sn./Sf))).* G ;
Fapprox = ifft2(FapproxFreq);

figure(3);
colormap(map);
image(Fapprox);
title('Wiener filter Restoration');

%Constrained Least Squares Restoration

[A, B] = size(f);
M = A+3-1;
N = B+3-1;

%Δημιουργούμε την μήτρα με διαστάσεις MxN με zero padding.

p = [0 -1 0; -1 4 -1;0 -1 0];
P = fft2(p,M,N);

G = fft2(g,M,N);
g = ifft2(G);
H = fft2(AverageFilter,M,N);
Hconjugate = conj(H);

n=norm((M-1)*(N-1)*(0+0.01)); 
a = 0.05 * n;
gama = 10^(-10); 

while(1)
    %ii
    F = (Hconjugate./(abs(H).^2 + gama*(abs(P).^2))).*G;
    
    %iii
    R = G - H.*F;  %μέθοδος Newton-Raphson
    r = ifft2(R);
    fgama=norm(r);
    %iv
    if (fgama < n - a)
        gama = gama + gama*2/3;
    else
        gama = gama - gama*2/3;  
    end;
    if(fgama>n-a && fgama<n+a)
        f = ifft2(F);
        break;
    end;    
end;

figure(4);
colormap(map);
image(f);
title('Constrained Least Squares Restoration');

[x,y] = size(original);
f = ifft2(fft2(f,x,y)); %Metatrepoume tin telikh eikona stis arxikes diastaseis, gia na broume to mse.

mse1 = sqrt(sum(sum((double(original) - double(Fapprox)) .^ 2))) / (x * y)

mse2 = sqrt(sum(sum((double(original) - double(f)) .^ 2))) / (x * y)
