% imgmerge
area = [20.5 673.5 591 591];
red = imread('E:\RC\09282022_ChATCre_Ai167_DA2m_jGCaMP7f_DMS\Optsti_CIN_DA2m_ChATCre_Ai167.bmp');
green = imread('E:\RC\09282022_ChATCre_Ai167_DA2m_jGCaMP7f_DMS\Optsti_GreenChannel_DA2m_ChATCre_Ai167.bmp');
red_crop = imcrop(red,area);
green_crop = imcrop(green,area);
merge = ones(size(red_crop),'uint8');
merge(:,:,1) = red_crop(:,:,1);
merge(:,:,2) = green_crop(:,:,2);
merge(:,:,3) = merge(:,:,3)*0;
imwrite(merge,['E:\RC\09282022_ChATCre_Ai167_DA2m_jGCaMP7f_DMS\_merged.bmp'],"bmp");