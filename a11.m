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