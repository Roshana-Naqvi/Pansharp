% 23.05.2014
% Ezgi KO� taraf�ndan olu�turuldu.

function sonuc = UnsharpPan(Pan,sigma,weight,threshold)

k = round( 2*(3*(sigma-0.8)+1)+1);
h = fspecial('gaussian',  [k k], sigma);
blurred = imfilter(double(Pan), h);
sharpImage = abs((1+weight)*double(Pan) - weight*blurred);
sharpImage(sharpImage < threshold) = 0;

sonuc = sharpImage;
end