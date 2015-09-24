% 03.06.2014
% Ezgi Ko� taraf�ndan olu�turuldu.
% Varies from 0 to 1.
% The value should be as close to 1 as possible.

function [SSIM] = Metric_SSIM(MSImage,Pansharp)

k1 = 0.01;
k2 = 0.03;
% k1 ve k2 sabit katsay�lar.

pixelValues = impixel(MSImage,Pansharp);

c1 = (k1*pixelValues)^2;
c2 = (k2*pixelValues)^2;

ortMSImage = mean(MSImage);
ortPansharp = mean(Pansharp(:,:,1:3));

varMSImage = var(MSImage);
varPansharp = var(Pansharp(:,:,1:3));

covariance = cov(MSImage,Pansharp(:,:,1:3));

SSIM = (2*ortMSImage.*ortPansharp+c1).*(2*covariance+c2)./...
    ((ortMSImage^2+ortPansharp^2+c1).*(varMSImage+varPansharp+c2));

end