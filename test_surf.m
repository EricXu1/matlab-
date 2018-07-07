I1= imread('color1/pic_color_1_1.jpg');   
I1=rgb2gray(I1);
I2= imread('color2/pic_color_2_1.jpg');   
I2=rgb2gray(I2);
%Find the SURF features.寻找特征点  
points1 = detectSURFFeatures(I1);  
points2 = detectSURFFeatures(I2);   
%Extract the features.计算描述向量  
[f1, vpts1] = extractFeatures(I1, points1);  
[f2, vpts2] = extractFeatures(I2, points2);  
%进行匹配  
indexPairs = matchFeatures(f1, f2, 'Prenormalized', true) ;  
matched_pts1 = vpts1(indexPairs(:, 1));  
matched_pts2 = vpts2(indexPairs(:, 2));  
%对匹配结果进行显示，可以看到，还有一些异常值  
figure; showMatchedFeatures(I1,I2,matched_pts1,matched_pts2);  