for k=1:numFrame
    frame1_gray=imread(['gray1/pic_gray_1_',int2str(k),'.jpg']);
    frame2_gray=imread(['gray2/pic_gray_2_',int2str(k),'.jpg']);
    eval(['points1' int2str(k) ' = detectSURFFeatures(frame1_gray)']);
    eval(['points2' int2str(k) ' = detectSURFFeatures(frame2_gray)']);
    eval(['[f1, vpts1] = extractFeatures(frame1_gray, points1' int2str(k) ')' ]);
    eval(['[f2, vpts2] = extractFeatures(frame1_gray, points2' int2str(k) ')' ]); 
    indexPairs= matchFeatures(f1, f2,"Prenormalized", true); 
    matched_pts1= vpts1(indexPairs(:, 1));
    matched_pts2= vpts2(indexPairs(:, 1));

end


    figure;
    showMatchedFeatures(frame1_gray,frame2_gray,matched_pts1,matched_pts1);







