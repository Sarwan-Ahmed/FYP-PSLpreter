
% function [img] =crop(img)  
taskdir1='C:\Users\boss\Desktop\data\';
outdir1='C:\Users\boss\Desktop\data1\';

listfile = dir('C:\Users\boss\Desktop\data\');
number_of_files2 = size(listfile)
for i=14:number_of_files2(1,1)-2
    taskdir=strcat(taskdir1,sprintf('%d',i),'\');
    outdir=strcat(outdir1,sprintf('%d',i),'\');
    list = dir(taskdir);
    number_of_files = size(list)
    for j=0:number_of_files(1,1)-2
        path=strcat(taskdir,sprintf('%d',j),'\');
        path1=strcat(outdir,sprintf('%d',j),'\');
        list1 = dir([path '*.jpg']);
        number_of_files1 = size(list1);
        for k=1:number_of_files1(1,1)-2
            filename = list1(k).name
            img=imread(strcat(path,filename));
            [w,h,ch]=size(img);
            I=imcrop(img,[0 15 w h]);
            mkdir(path1);
            imwrite(I,[path1 sprintf('%d.png',k)]);
        end
    end
end


% end
