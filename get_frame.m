clear all
clc
video = VideoReader('test.mp4');
numFrame=get(video,'NumberOfFrames');
path = '\Users\xurongrong\Documents\GitHub\matlab-\'
for k=1:numFrame
    frame=read(video,k);
    frame_gray=rgb2gray(frame);
end