%Ερώτημα 1
clear;
[A,mapA] = imread('parrots.bmp');
figure(1)
imshow(A,mapA);

[B,mapB] = imread('Ghibli.bmp');
figure(2)
imshow(B,mapB);

imwrite(A,mapB,'imageA.bmp');
imwrite(B,mapA,'imageB.bmp');

figure(3)
imshow(A,mapB);

figure(4)
imshow(B,mapA);

%Ερώτημα 2

clear ;
[A,map] = imread('parrots.bmp');
for i=1:length(map)
    Y(i) = (222*map(i,1)+707*map(i,2)+71*map(i,3))/1000; 
    for j=1:3
    	map(i,j)= Y(i);
    end;
end;

imwrite(A,map,'grayscaledImage.bmp');
figure(5);
imshow(A,map);


%Ερώτημα 3
clear;

k = 9;

H = linspace(0,360,256) ;
S =(1-k/10);
I = 0.5;

if I <= 0.5
   M=I*(1+S); %Αφού Ι = 0.5
else
    M = I+S-I*S;
end    
m=2*I-M;

% Υπολογισμός του R:

for i = 1:256
  if H(i)<60 
      map(i,1) = m+(M-m)*(H(i)/60);
  elseif H(i)<180 
      map(i,1) = M;
  elseif H(i)<240
      map(i,1) = m+(M-m)*((240 - H(i))/60);
  elseif H(i)<360 
      map(i,1) = m;
  end
end

% Υπολογισμός του G:

for i = 1:256
  if H(i)<120 
      map(i,2) = m;
  elseif H(i)<180 
      map(i,2) =  m+(M-m)*((H(i) - 120 )/60);
  elseif H(i)<300
      map(i,2) = M;
  elseif H(i)<360 
      map(i,2) = m+(M-m)*((360 - H(i) )/60);
  end
end

% Υπολογισμός του B:

for i = 1:256
  if H(i)<60 
      map(i,3) = M;
  elseif H(i)<120 
      map(i,3) =  m+(M-m)*((120 - H(i))/60);
  elseif H(i)<240
      map(i,3) = m;
  elseif H(i)<300 
      map(i,3) = m+(M-m)*((H(i) - 240 )/60);
  elseif H(i)<360 
      map(i,3) = M;
  end
end

%Δημιουργία νέας Εικόνας


for i = 1:256
    for j = 1:256
        new_Image(i,j) = i;
    end
end

figure(6)
imwrite(new_Image,map,'new_Image.bmp') % Η New_Image είναι indexed image και το map είναι η παλέτα
imshow('new_Image.bmp');


%Ερώτημα 4
clear

k = 9;

H = linspace(0, 360 ,8) ;
S =(1-k/10);
I = 0.5;

M=I*(1+S); %Αφού Ι = 0.5
m=2*I-M;

% Υπολογισμός του R:

for i = 1:8
  if H(i)<60 
      map(i,1) = m+(M-m)*(H(i)/60);
  elseif H(i)<180 
      map(i,1) = M;
  elseif H(i)<240
      map(i,1) = m+(M-m)*((240 - H(i))/60);
  elseif H(i)<360 
      map(i,1) = m;
  end
end

% Υπολογισμός του G:

for i = 1:8
  if H(i)<120 
      map(i,2) = m;
  elseif H(i)<180 
      map(i,2) =  m+(M-m)*((H(i) - 120 )/60);
  elseif H(i)<300
      map(i,2) = M;
  elseif H(i)<360 
      map(i,2) = m+(M-m)*((360 - H(i) )/60);
  end
end

% Υπολογισμός του B:

for i = 1:8
  if H(i)<60 
      map(i,3) = M;
  elseif H(i)<120 
      map(i,3) =  m+(M-m)*((120 - H(i))/60);
  elseif H(i)<240
      map(i,3) = m;
  elseif H(i)<300 
      map(i,3) = m+(M-m)*((H(i) - 240 )/60);
  elseif H(i)<360 
      map(i,2) = M;
  end
end

%Δημιουργία νέας Εικόνας


for i = 1:256
    for j = 1:256
        new_Image(i,j) = fix(i/33)+1;
    end
end

imwrite(new_Image,map,'new_Image2.bmp'); % Η New_Image είναι indexed image και το map είναι η παλέτα
figure(7)
imshow('new_Image2.bmp');

%Ερώτημα 5
clear;

[X,map] = imread('parrots.bmp');

HSI = rgb2hsv(map); 
S = HSI(:,2);


for k = 1:5
    for i = 1:256
        S(i)=1;
        if S(i) > 0.2*k;
           S(i) = S(i) - 0.2*k;
        else
           S(i) = 0;
        end
    end
    if (k==1)
        
    	HSI(:,2) = S;
        map = hsv2rgb(HSI);
        imwrite(X,map,'faded1.bmp');
        figure(8)
        imshow('faded1.bmp');
    elseif(k==2)
        
    	HSI(:,2) = S;
        map = hsv2rgb(HSI);
        imwrite(X,map,'faded2.bmp');
        figure(9)
        imshow('faded2.bmp');
    elseif(k==3)
    	HSI(:,2) = S;
        map = hsv2rgb(HSI);
        imwrite(X,map,'faded3.bmp');
        figure(10)
        imshow('faded3.bmp');
    elseif(k==4)
    	HSI(:,2) = S;
        map = hsv2rgb(HSI);
        imwrite(X,map,'faded4.bmp');
        figure(11)
        imshow('faded4.bmp');   
    else
    	HSI(:,2) = S;
        map = hsv2rgb(HSI);
        imwrite(X,map,'faded5.bmp');
        figure(12)
        imshow('faded5.bmp');
    end
end