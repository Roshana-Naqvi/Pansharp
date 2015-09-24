function [ResultImg] = KontrastIyilestir(image, Kontrast)
[~,~,bands] = size(image);
 ResultImg = image;

parfor band=1:bands
    if(Kontrast==1)
        
        %%Do�rusal
    elseif(Kontrast==2)
        ResultImg(:,:,band)=DogrusalKontrast(image(:,:,band));
        %%Do�rusal %1
    elseif(Kontrast==3)
        ResultImg(:,:,band)=imadjust(image(:,:,band));
        %%Histogram e�itleme
    elseif(Kontrast==4)
        ResultImg(:,:,band)=histeq(image(:,:,band));
        %%Adapte Histogram E�itleme
    elseif(Kontrast==5)
        ResultImg(:,:,band)=adapthisteq(image(:,:,band));
        
    end
    
end