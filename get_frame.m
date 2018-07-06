clear all
clc
<<<<<<< HEAD
mkdir('color1');
mkdir('color2');
mkdir('gray1');
mkdir('gray2');
OLD_PATH = '\Users\xurongrong\Documents\GitHub\matlab-\';
NEW_PATH_COLOR_1 = './color1';
NEW_PATH_GRAY_1 = './gray1';
NEW_PATH_COLOR_2 = './color2';
NEW_PATH_GRAY_2 = './gray2';
video1 = VideoReader('1.mp4');
video2 = VideoReader('2.mp4');
numFrame=get(video1,'NumberOfFrames');
=======
video = VideoReader('test.mp4');
numFrame=get(video,'NumberOfFrames');
path = '\Users\xurongrong\Documents\GitHub\matlab-\'
>>>>>>> 03eccf78d37f48e0f665923c22f1dd2fbd96f6a4
for k=1:numFrame
    frame=read(video,k);
    frame_gray=rgb2gray(frame);
end