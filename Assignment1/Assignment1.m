img = imread("RGB.jpg");
imwrite(img,"rgbPNG.png");
img2 = imread("rgbPNG.png");
subplot(1,2,1),imshow(img);
subplot(1,2,2),imshow(img2);

Y = (0.299 * img(:,:,1))+(0.587 * img(:,:,2))+(0.114* img(:,:,3));
Cb = -(0.169 * img(:,:,1))-(0.311 * img(:,:,2))+(0.500* img(:,:,3));
Cr = (0.500 * img(:,:,1))-(0.419 * img(:,:,2))-(0.081* img(:,:,3));
img(:,:,1) = Y;
img(:,:,2) = Cb;
img(:,:,3) = Cr;
img_ycbcr = rgb2ycbcr(img);


subplot(1,5,1),imshow(img);
subplot(1,5,2),imshow(Y);
subplot(1,5,3),imshow(Cb);
subplot(1,5,4),imshow(Cr);
subplot(1,5,5),imshow(img_ycbcr);


comp4 = dctmtx(4);
comp8 = dctmtx(8);
comp16 = dctmtx(16);

subplot(1,3,1),imshow(comp4);
subplot(1,3,2),imshow(comp8);
subplot(1,3,3),imshow(comp16);

imwrite(comp4,"Compressed image4.png");
imwrite(comp8,"Compressed image8.png");
imwrite(comp16,"Compressed image16.png");