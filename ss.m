clear;
clc;
framesPath = '';%����ͼƬ��ַ
videoName = '';%������Ƶ�ļ���ַ
fps = 30;%��Ƶ֡��
startFrame = 1;%����һ֡��ʼ
endFrame = 100;%����һ֡����������Լ�����ͼƬ�Ķ�������
videoObj = VideoWriter(videoName);
videoObj.FrameRate = fps;
open(videoObj);
for i = startFrame : endFrame
    fileName = '';%����Ҫ��filename���ַ�ƴ�Ӵ���
    frames=imread([framesPath '\' fileName,'.jpg']);
    frames=im2frame(frames);
    writeVideo(videoObj,frames);
end
close(videoObj);