function Pansharp = PS_HSV(MSImage,  Pan)
tic
% HSV Y�ntemine g�re Pan keskinle�tirme i�lemi yap�l�r
% Pan: Pankkromatik G�r�nt�
% MSImage: multispectral g�r�nt�
% Pansharp: Pan keskinle�tirilmesi yap�lm�� g�r�nt�
% ��lem                              Yazar       Tarih
% Kod olu�turuldu                   M. Teke     20.12.2013

% Histogram D�zeltme Ekle
%  if(class(MSImage) ~= 'double')
if( strcmp( class(MSImage),'double') == 0 )
    MSImage = double(MSImage);
end

%  if(class(Pan) ~= 'double')
  if( strcmp( class(Pan),'double') == 0 )
    Pan = double(Pan);
end
    imageHSV = rgb2hsv( MSImage(:,:,1:3) );
%     figure('Name', 'HSV Image Before') , imshow(imageHSV);
    imageHSV (: , : , 3) = Pan;
%     figure('Name', 'HSV Image After') , imshow(imageHSV);
    Pansharp = hsv2rgb( imageHSV );
    disp('HSV');
    toc
end                                
                  