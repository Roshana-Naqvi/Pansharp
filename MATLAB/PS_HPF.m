% HPF y�ntemine g�re Pan keskinle�tirme i�lemi yap�l�r
% Pan: Pan-kromatik G�r�nt�
% MSImage = Multispektral goruntu
% Pansharp: Pan keskinle�tirilmesi yap�lm�� g�r�nt�
% High Pass Weight: HPF'den ge�mi� Pan g�r�nt�n�n RGB g�r�nt�ye eklenmeden
% �nce �arp�ld��� katsay�
% ��lem                              Yazar       Tarih
% Kod olu�turuldu                   M. Teke     20.12.2013
% G�ncelleme                        Ezgi San    23.05.2014

function [Pansharp] = PS_HPF(Pan, MSImage, HighPassWeight)
tic
 
if( strcmp( class(MSImage),'double') == 0 )
    MSImage = double(MSImage);
end

if( strcmp( class(Pan),'double') == 0 )
    Pan = double(Pan);
end

% H = padarray(2,[2 2]) - fspecial('gaussian' ,[5 5],2);
r = 2;
H = -1*ones (2*r+1,2*r+1);
H(3,3) = (2*r+1) *( 2*r+1)- 1;

%Pana elde edilen filtre uygulan�r ve y�ksek ge�iren elde edilir.
sharpened = imfilter(Pan,H);
%Elde edilen y�ksek ge�iren, katsay� ile �arp�l�r
SharpenedLayer = HighPassWeight * double(sharpened) ;

[rows, cols, bands] = size(MSImage);
Pansharp = zeros(rows, cols, bands);
%Olu�turulan keskin g�r�nt� t�m bantlara eklenir.
parfor band = 1:bands
    Pansharp(:, :, band) =  MSImage(:, :, band) + SharpenedLayer;
end

disp('HPF=');
toc

end