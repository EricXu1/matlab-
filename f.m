function [tforms] = f(pic1,pic2)
pic1_gray= rgb2gray(pic1);
pic2_gray= rgb2gray(pic2);
surf_1= detectSURFFeatures(pic1_gray);
surf_2= detectSURFFeatures(pic2_gray);
[features_1, points_1] = extractFeatures(pic1_gray, surf_1);
[features_2, points_2] = extractFeatures(pic2_gray, surf_2);
[des1, des2] = matchFeatures(features_1,features_2);
matchedPointsPrev = surf_1(indexPairs(:,2), :);
matchedPoints = surf_2(indexPairs(:,1), :);
tforms = estimateGeometricTransform(matchedPoints, matchedPointsPrev,'projective', 'Confidence', 99.9, 'MaxNumTrials', 2000);

