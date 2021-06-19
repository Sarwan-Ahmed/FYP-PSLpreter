% input directory
taskdir='C:\Users\boss\Desktop\data1\';
% output directory
outdir='C:\Users\boss\Desktop\new_data\';
%for all the classes
for i=0: 127
    a=strcat(taskdir,sprintf('%d',i),'\');
    list = dir(a);
    number_of_files = size(list)
    number=1;
    %for all instances in the classes
    for j=0:number_of_files(1,1)-3
        path=strcat(a,sprintf('%d',j),'\');
        list1 = dir([path '*.png']);
        number_of_files1 = size(list1);
        b=strcat(outdir,sprintf('%d',i),'\');
        number_files_out=size(dir(b))
        outpath=strcat(b,sprintf('%d',(number_files_out(1)-2)),'\')
        mkdir(outpath);
        % for all the frames in the instances
        for k=1:number_of_files1(1,1)
            filename = list1(k).name
            % read the image
            img=imread(strcat(path,filename));
            % adding brightness to images
            I=brighter(img); 
            %adding darkness
%             I=darker(img);
            % adding smoothness to images
%             I=avg_filter(img);
            % adding gaussian noise
%             I=noise_gaussian(img);  
            I = imresize(I,[240 240], 'bicubic');
            imwrite(I,[outpath sprintf('%d.png',k)]);  
        end
        number=number+1;
    end
end