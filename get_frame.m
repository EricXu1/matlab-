clear all
clc
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
for k=1:numFrame
    frame1=read(video1,k);
    frame2=read(video2,k);
    frame1_gray=rgb2gray(frame1);
    frame2_gray=rgb2gray(frame2);
    imwrite(frame1,strcat('pic_color_1_',num2str(k),'.jpg'));
    filec1 = ['pic_color_1_',num2str(k),'.jpg'];
    movefile(filec1,NEW_PATH_COLOR_1);  
    imwrite(frame2,strcat('pic_color_2_',num2str(k),'.jpg'));
    filec2 = ['pic_color_2_',num2str(k),'.jpg'];
    movefile(filec2,NEW_PATH_COLOR_2);  
    imwrite(frame1_gray,strcat('pic_gray_1_',num2str(k),'.jpg'));
    fileg1 = ['pic_gray_1_',num2str(k),'.jpg'];
    movefile(fileg1,NEW_PATH_GRAY_1);
    imwrite(frame2_gray,strcat('pic_gray_2_',num2str(k),'.jpg'));
    fileg2 = ['pic_gray_2_',num2str(k),'.jpg'];
    movefile(fileg2,NEW_PATH_GRAY_2);
end
