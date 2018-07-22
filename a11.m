framesPath = NEW_PATH_END;
videoName = './end';
fps = 30;%视频帧率
startFrame = 1;%从哪一帧开始
endFrame = numFrame;%在哪一帧结束，这个自己按照图片的多少设置
videoObj = VideoWriter(videoName);
videoObj.FrameRate = fps;
open(videoObj);
for i = startFrame : endFrame
    fileName = ['panorama',num2str(i),];%这里要对filename做字符拼接处理
    frames=imread([framesPath '/' fileName,'.jpg']);
    frames=im2frame(frames);
    writeVideo(videoObj,frames);
end
close(videoObj);