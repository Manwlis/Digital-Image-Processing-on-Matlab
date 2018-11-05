clear;
close all;

%Ερώτημα 1
[tools,map] = imread('tools.bmp');

f = fft2(tools);
figure(1)
Ft = abs(f);
image(Ft);
colormap(map)
title('Mέτρο του μετασχηματισμού Fourier της grayscale εικόνας tools.bmp');

c = 15;
D = fftshift(c*log(1 + Ft));
figure(2)
image(D)
colormap(map)
title('Απεικόνιση της εικόνας σε grayscale αποχρώσεις.');

figure(3)

colormap(map)
colormap(jet)
image(D)

title('Απεικόνιση της εικόνας χρησιμοποιώντας διαφορετικά χρώματα.');

%Ερώτημα 2
[landscape,map1] = imread('landscape.bmp');
Ft = abs(fftshift(fft2(landscape)));

c = 15;
D = c*log(1 + Ft);
figure(4);
subplot(1,2,1)
colormap(map1);
image(D);
title('Απεικόνιση της εικόνας landscape.bmp με μετασχηματισμό εντάσεων.');

[wood,map2] = imread('wood.bmp');
Ft = abs(fftshift(fft2(wood)));

c = 15;
D = c*log(1 + Ft);
subplot(1,2,2)
colormap(map2);
image(D);
title('Απεικόνιση της εικόνας wood.bmp με μετασχηματισμό εντάσεων.');

% Ερώτημα 3

BlackPic10 = zeros(256,256);

for i=1:256
 for j=1:256
     if( i >= (256/2-5) && i <= (256/2+5) && j >= (256/2-5) && j <= (256/2+5))    
        BlackPic10(i,j)=255;
     else
        BlackPic10(i,j)=0;
     end;
 end;
end;
figure(5)
imshow(BlackPic10)
title('10x10 λευκό τετράγωνο στο κέντρο της εικόνας')
imwrite(BlackPic10,'BlackPic10.bmp') %Αποθηκεύουμε την εικόνα για να μπορέσουμε να πάρουμε
BlackPic30 = zeros(256,256);

for i=1:256
 for j=1:256
     if( i >= (256/2-15) && i <= (256/2+15) && j >= (256/2-15) && j <= (256/2+15))    
        BlackPic30(i,j)=255;
     else
        BlackPic30(i,j)=0;
     end;
 end;
end;
figure(6)
imshow(BlackPic30)
title('30x30 λευκό τετράγωνο στο κέντρο της εικόνας')

%Δημιουργούμε το map3 και το χρησιμοποιούμε για τους μετασχηματισμούς
%fourier των εικόνων στα ερωτημάτα 3,4 και 5.
[BlackPic10,map3] = imread('BlackPic10.bmp');

Ft1 = fftshift(abs(fft2(BlackPic10)));

figure(7);
subplot(1,2,1)

colormap(map3)
image(Ft1);
title('Xωρίς την χρήση μετασχηματισμού εντάσεων για 10x10 λευκό τετράγωνο.');

c = 15;
D1 = c*log(1+Ft1);

subplot(1,2,2)
colormap(map3)
image(D1);
title('Mε την χρήση μετασχηματισμού εντάσεων για 10x10 λευκό τετράγωνο.');


Ft2 = fftshift(abs(fft2(BlackPic30)));

figure(8);
subplot(1,2,1)
colormap(map3)
image(Ft2);
title('Xωρίς την χρήση μετασχηματισμού εντάσεων για 30x30 λευκό τετράγωνο.');

c = 15;
D2 = c*log(1+Ft2);

subplot(1,2,2)
image(D2);
title('Mε την χρήση μετασχηματισμού εντάσεων για 30x30 λευκό τετράγωνο.');

% Ερώτημα 4

%10x10
BlackPic10Rot = imrotate(BlackPic10,45);  %% περιστροφή παραθύρου εικόνας κατα 45 μοίρες

figure(9);
imshow(BlackPic10Rot);
title('Η εικόνα μετά την περιστροφή της κατά 45 μοίρες.(10x10)')


ftrot = abs(fftshift(fft2(BlackPic10Rot)));

figure(10);
subplot(1,2,1)
colormap(map3)
image(ftrot);
title('Η περιστραμμένη εικόνα χωρίς μετασχηματισμό εντάσεων(10x10)');

Drot = c*log(1+ftrot);

subplot(1,2,2)
image(Drot);
title('Η περιστραμμένη εικόνα με μετασχηματισμό εντάσεων(10x10)');

%%30x30
BlackPic30rot = imrotate(BlackPic30,45);

figure(11);
imshow(BlackPic30rot);
title('Η εικόνα μετά την περιστροφή της κατά 45 μοίρες.(30x30)')


ft2rot = abs(fftshift(fft2(BlackPic30rot)));

figure(12);
subplot(1,2,1)
colormap(map3)
image(ft2rot);
title('Η περιστραμμένη εικόνα χωρίς μετασχηματισμό εντάσεων(30x30)');

D2rot = c*log(1+ft2rot);

subplot(1,2,2)
image(D2rot);
title('Η περιστραμμένη εικόνα με μετασχηματισμό εντάσεων(30x30)');

% Ερώτημα 5

BlackPic10shifted = zeros(256,256);

for i=1:256
 for j=1:256
     if( i >= (256/4-5) && i <= (256/4+5) && j >= (256/4-5) && j <= (256/4+5))    
        BlackPic10shifted(i,j)=255;
     else
        BlackPic10shifted(i,j)=0;
     end;
 end;
end;
figure(13)
imshow(BlackPic10shifted)
title('10x10 λευκό  μετατοπισμένο τετράγωνο.') 

BlackPic30shifted = zeros(256,256);

for i=1:256
 for j=1:256
     if( i >= (256/4-15) && i <= (256/4+15) && j >= (256/4-15) && j <= (256/4+15))    
        BlackPic30shifted(i,j)=255;
     else
        BlackPic30shifted(i,j)=0;
     end;
 end;
end;
figure(14)
imshow(BlackPic30shifted)
title('30x30 λευκό μετατοπισμένο τετράγωνο.')

Ftshift = abs(fftshift(fft2(BlackPic10shifted)));

figure(15);
subplot(1,2,1)
colormap(map3)
image(Ftshift);
title('Xωρίς την χρήση μετασχηματισμού εντάσεων για 10x10 λευκό μετατοπισμένο τετράγωνο.');

c = 15;
D1shift = c*log(1+Ft1);

subplot(1,2,2)
image(D1shift);
title('Mε την χρήση μετασχηματισμού εντάσεων για 10x10 μετατοπισμένο λευκό τετράγωνο.');

Ft2shift = abs(fftshift(fft2(BlackPic30shifted)));

figure(16);
subplot(1,2,1)
colormap(map3)
image(Ft2shift);
title('Xωρίς την χρήση μετασχηματισμού εντάσεων για 30x30 μετατοπισμένο λευκό τετράγωνο.');

c = 15;
D2shift = c*log(1+Ft2shift);

subplot(1,2,2)
image(D2shift);
title('Mε την χρήση μετασχηματισμού εντάσεων για 30x30 μετατοπισμένο λευκό τετράγωνο.');


% Ερώτημα 6

Tools_Histeq = histeq(tools);

figure(17)
imshow(Tools_Histeq);
title('Η εικόνα αφού έγινε εξισορρόπηση ιστογράμματος')

fthisteq = abs(fftshift(fft2(Tools_Histeq)));
Dhisteq = c*log(1+fthisteq);

figure(18);
colormap(map);
image(Dhisteq);
title('O μετασχηματισμός Fourier με την εξισορρόπηση ιστογράμματος.');

