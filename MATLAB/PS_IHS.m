% Fast IHS  metodu
% ��lem                         Yazar              Tarih
% Kod olu�turuldu             MS. Seyfioglu      15.01.2014
% G�ncelleme                  Ezgi Ko�           16.05.2014
% G�ncelleme                  Ezgi San           23.05.2014
% Perf. Improvement         Mustafa Teke    04.08.2014
% Pan: Pan-kromatik G�r�nt�
% MSImage: Multispektral goruntu
% Pansharp: Pan keskinle�tirilmesi yap�lm�� g�r�nt�
% Referans http://www.math.ucla.edu/~wittman/pansharpening/
function [Pansharp] = PS_IHS( MSImage, Pan)
if( strcmp( class(MSImage),'double') == 0 )
    MSImage = double(MSImage);
end

if( strcmp( class(Pan),'double') == 0 )
    Pan = double(Pan);
end

[rows, cols, bands] = size(MSImage);
Pansharp = zeros(rows, cols, bands);

% I = zeros(rows, cols);
% 
% %MS g�r�nt�den IHS d�n���m� yap�larak I hesaplan�r.
% for band = 1:bandnum
%     I = I + MSImage(:,:,band) * (1/bandnum);
% end

I =  sum(MSImage, 3)/bands;

%Pan ile I band� yerde�i�tirir
MeanPan = mean( Pan(:) );
MeanI = mean( I(:) );
Pan = Pan*std(std(I))/std(std(Pan));
Pan = Pan-MeanPan-MeanI;
Pan = (Pan-MeanPan)*std(I(:))/std(Pan(:)) + MeanI; % Color Balancing

%Yeni Pan de�eri I dan ��kart�ld�ktan sonra her banda eklenerek...
%keskin g�r�nt� elde edilmi� olur.

PanMinusI = Pan - I;
parfor band = 1:bandnum
    Pansharp(:,:,band) = MSImage(:,:,band) + PanMinusI;
end
clear I

disp('IHS=');
toc

end