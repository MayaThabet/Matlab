video = VideoReader('Wolf.mp4');

wcVideo = VideoWriter("Wolf16x16.avi");
wcVideo.FrameRate =1;
open(wcVideo);
vid = read(video,[1 10]);

for i = 1:10
    frame = vid(:,:,:,i);
    for a = 1:size(frame,1)
        for b = 1:size(frame,2)
            if(frame(a,b,1) <= 120 &&frame(a,b,2) >= 150 && frame(a,b,3)<=120)
                frame(a,b,1);
                frame(a,b,2);
                frame(a,b,3);
            end
        end
    end
    cframe = Compress_16x16_Function(frame);
    imwrite(cframe,strcat('images16x16\\img',int2str(i),'.png'));
    writeVideo(wcVideo,cframe);
end

close(wcVideo);
