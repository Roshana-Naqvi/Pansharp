% Brovey  metodu
% Pan: Pan-kromatik G�r�nt�
% MSImage = Multispektral goruntu
% Pansharp: Pan keskinle�tirilmesi yap�lm�� g�r�nt�
% ��lem                         Yazar              Tarih
% Kod olu�turuldu      Mustafa Teke      05.08.2014



function [Pansharp] = PS_SFIM(MSImage,Pan)
tic
if( strcmp( class(MSImage),'double') == 0 )
    MSImage = double(MSImage);
end

if( strcmp( class(Pan),'double') == 0 )
    Pan = double(Pan);
end

MSImageToplam = 0;
[rows, cols, bands] = size(MSImage);
Pansharp = zeros(rows, cols, bands);
% Filter Pan
r = 2;
H = ones(r,r)/r^2;
I = imfilter(Pan, H);

%Band numaras� panla �arp�ld�ktan sonra MS g�r�nt�n�n her band�yla ...
%bant bant �arp�larak bantlar�n toplam�na b�l�nerek g�r�nt�
%keskinle�tirilir.

PanOverI = Pan./I;

parfor band = 1:bands
    Pansharp(:,:,band) = MSImage(:,:,band) ./PanOverI;
end

disp('SFIM=');
toc

end