% Ezgi Ko� taraf�ndan g�ncellendi.
% Her band�n Spatial metrik de�eri eklendi.
% Pan g�r�nt�yle pankeskinle�tirilmi� g�r�nt�n�n her bir band�n� y�ksek ge�iren filtreden ge�irip uzamsal benzerli�ini kar��la�t�r�r. 
% Referans de�eri 1.

function [spatialSonuc,spatialSonucVector]=Metric_Spatial(Pansharp,Pan)
% Referans de�eri 1
Pansharp(isnan(Pansharp))=0;
[rows,colums,bands]=size(Pansharp);
mask=[-1,-1,-1;-1,8,-1;-1,-1,-1];
Pan = double(Pan);
PanCon=conv2(Pan, mask,'same');%maskeyle pan�n konvol�syonu
spatialSonucToplam = 0;
FuseCon=zeros(rows,colums,bands);

for i=1:bands    
    FuseCon(:,:,i)=conv2(Pansharp(:,:,i), mask, 'same'); %Pansharp edilmi� resmin her band�n maskelenmesi
    A=corrcoef(PanCon, FuseCon(:,:,i)); %Maskelenmi� her bantla maskelenmi� pan�n corrolation coefficient'�n�n bulunmas�
    spatialSonucToplam = spatialSonucToplam+A(1,2);% Corrcoef'lerin toplam�
    spatialSonucVector(i)= A(1,2);
end

spatialSonuc = abs(spatialSonucToplam/bands);
abs(spatialSonucVector());
end