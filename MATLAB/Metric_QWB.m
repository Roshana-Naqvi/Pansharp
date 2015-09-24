% 02.06.2014 
% Ezgi Ko� taraf�ndan olu�turuldu.
% Varies from 0 to 1.
% The value should be as close to 1 as possible. 

function [QWB] = Metric_QWB(MSImage,Pansharp)

ortMSImage = mean(MSImage);
ortPansharp = mean(Pansharp);

varMSImage = var(MSImage);
varPansharp = var(Pansharp);

covariance = cov(MSImage,Pansharp(:,:,1:3));

QWB = (4*covariance.*ortMSImage.*ortPansharp)./...
    (varMSImage + varPansharp).*(ortMSImage.^2 + ortPansharp.^2);

end