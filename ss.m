clear;
clc;
framesPath = '';%序列图片地址
videoName = '';%保存视频文件地址
fps = 30;%视频帧率
startFrame = 1;%从哪一帧开始
endFrame = 100;%在哪一帧结束，这个自己按照图片的多少设置
videoObj = VideoWriter(videoName);
videoObj.FrameRate = fps;
open(videoObj);
for i = startFrame : endFrame
    fileName = '';%这里要对filename做字符拼接处理
    frames=imread([framesPath '\' fileName,'.jpg']);
    frames=im2frame(frames);
    writeVideo(videoObj,frames);
end
close(videoObj);