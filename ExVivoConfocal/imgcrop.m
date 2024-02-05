
path = 'R:\Data\Ruifeng\25_ExpData\Ex vivo confocal\10192022RC_ChATCre;Ai167_ACh3.0_DMS\S3C2_sample.bmp';
area = [82.5 752.5 390 390];
img = imread(path);
imshow(img)
img = imcrop(img,area);
% img(:,:,2) = img(:,:,1);
% img(:,:,1) = 0;
imwrite(img,[path(1:end-4),'_croped_.bmp'],"bmp");
imshow(img)
