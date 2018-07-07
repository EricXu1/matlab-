I1= imread('color1/pic_color_1_1.jpg');   
I1=rgb2gray(I1);
I2= imread('color2/pic_color_2_1.jpg');   
I2=rgb2gray(I2);
%Find the SURF features.Ѱ��������  
points1 = detectSURFFeatures(I1);  
points2 = detectSURFFeatures(I2);   
%Extract the features.������������  
[f1, vpts1] = extractFeatures(I1, points1);  
[f2, vpts2] = extractFeatures(I2, points2);  
%����ƥ��  
indexPairs = matchFeatures(f1, f2, 'Prenormalized', true) ;  
matched_pts1 = vpts1(indexPairs(:, 1));  
matched_pts2 = vpts2(indexPairs(:, 2));  
%��ƥ����������ʾ�����Կ���������һЩ�쳣ֵ  
figure; showMatchedFeatures(I1,I2,matched_pts1,matched_pts2);  