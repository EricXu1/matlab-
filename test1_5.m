%����Matlab����Ƶͼ��ƴ��ϵͳ�������ʵ��
%������ 2018/7
%ver 1.4
%1.��Ƶ��֡��ȡ
clear all
clc
    %����4���ļ������Դ�����ȡ֡���������ļ�λ��
n=2
mkdir('color1');
mkdir('color2');
mkdir('gray1');
mkdir('gray2');
mkdir('end');
OLD_PATH = '\Users\xurongrong\Documents\GitHub\matlab-\';
NEW_PATH_COLOR_1 = './color1';
NEW_PATH_GRAY_1 = './gray1';
NEW_PATH_COLOR_2 = './color2';
NEW_PATH_GRAY_2 = './gray2';
NEW_PATH_END = './end';
    %��ȡ��Ƶ��֡��
video1 = VideoReader('1.mp4');
video2 = VideoReader('2.mp4');
numFrame=get(video1,'NumberOfFrames');
for k=1:numFrame
    %��֡��ȡ����ת��Ϊ�Ҷ�ͼ
    frame1=read(video1,k);
    frame2=read(video2,k);
    frame1_gray=rgb2gray(frame1);
    frame2_gray=rgb2gray(frame2);
    %��ȡ��Ӧ������
    points1=detectSURFFeatures(frame1_gray); 
    [features1, points1] = extractFeatures(frame1_gray, points1);
    points2 = detectSURFFeatures(frame2_gray); 
    [features2, points2] = extractFeatures(frame2_gray, points2);
    indexPairs = matchFeatures(features1, features2, 'Unique', true);
    matchedPoints = points1(indexPairs(:,1), :)
    matchedPointsPrev = points2(indexPairs(:,2), :);
    tforms(n) = projective2d(eye(3));
    tforms(n) = estimateGeometricTransform(matchedPoints, matchedPointsPrev,'projective', 'Confidence', 99.9, 'MaxNumTrials', 2000);
    imageSize = size(frame1);
for i = 1:numel(tforms)
    [xlim(i,:), ylim(i,:)] = outputLimits(tforms(i), [1 imageSize(2)], [1 imageSize(1)]);
end
for i = 1:numel(tforms)
    [xlim(i,:), ylim(i,:)] = outputLimits(tforms(i), [1 imageSize(2)], [1 imageSize(1)]);
end
xMin = min([1; xlim(:)]);
xMax = max([imageSize(2); xlim(:)]);

yMin = min([1; ylim(:)]);
yMax = max([imageSize(1); ylim(:)]);

% ȫ��ͼ�Ŀ��
width  = round(xMax - xMin);
height = round(yMax - yMin);
panorama = zeros([height width 3], 'like', frame1);
avgXLim = mean(xlim, 2);

[~, idx] = sort(avgXLim);

centerIdx = floor((numel(tforms)+1)/2);

centerImageIdx = idx(centerIdx);

Tinv = invert(tforms(centerImageIdx));

for i = 1:numel(tforms)
    tforms(i).T = Tinv.T * tforms(i).T;
end

blender = vision.AlphaBlender('Operation', 'Binary mask', ...
                              'MaskSource', 'Input port');
xLimits = [xMin xMax];
yLimits = [yMin yMax];
panoramaView = imref2d([height width], xLimits, yLimits);
    warpedImage = imwarp(frame1, tforms(1), 'OutputView', panoramaView);
    panorama = step(blender, panorama, warpedImage, warpedImage(:,:,1));
figure
imshow(panorama)
imwrite(panorama,strcat('panorama',num2str(k),'.jpg'));
fileg2 = ['panorama',num2str(k),'.jpg'];
 movefile(fileg2,NEW_PATH_END);
end
framesPath = NEW_PATH_END;
videoName = './end';
fps = 30;%��Ƶ֡��
startFrame = 1;%����һ֡��ʼ
endFrame = numFrame;%����һ֡����������Լ�����ͼƬ�Ķ�������
videoObj = VideoWriter(videoName);
videoObj.FrameRate = fps;
open(videoObj);
for i = startFrame : endFrame
    fileName = ['panorama',num2str(i),];%����Ҫ��filename���ַ�ƴ�Ӵ���
    frames=imread([framesPath '/' fileName,'.jpg']);
    frames=im2frame(frames);
    writeVideo(videoObj,frames);
end
close(videoObj);









%2.��֡�ĺϳ�

    
    %���������ƥ�䣬��������Ӧ����
    %����ͼƬ�������ȵ���
    %����ͼ�α任����Ե���������ͼ���ں�
    
    
