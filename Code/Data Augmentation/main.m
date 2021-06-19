% input directory
taskdir='C:\Users\boss\Desktop\data1\';
%output directory
outdir='C:\Users\boss\Desktop\new_data\';
% for all classes
for i= 0: 127
    a=strcat(taskdir,sprintf('%d',i),'\');
    list = dir(a);
    number_of_files = size(list)
    number=1;
    %for all instances in that class
    for j=0:number_of_files(1,1)-3
        path=strcat(a,sprintf('%d',j),'\');
        list1 = dir([path '*.png']);
        number_of_files1 = size(list1);
        b=strcat(outdir,sprintf('%d',i),'\');
        number_files_out=size(dir(b))
        outpath=strcat(b,sprintf('%d',(number_files_out(1)-2)),'\')
        mkdir(outpath);
        % for all frames in the instance
        for k=1:number_of_files1(1,1)
            filename = list1(k).name
            img=imread(strcat(path,filename));
            if number~=1
                if k~=1
                    number=number-12;
                end
            end
            img = im2double(img);
            % applying logarithmic of 6 different types
            c=[0.5 0.7 0.9 1 2 5];
            for cc = 1:length(c)
                I=logar(img,c(cc));
                I = imresize(I,[240 240], 'bicubic');
                outpath=strcat(outdir,sprintf('%d',i),'\',sprintf('%d',(number_of_files(1)-3)+number),'\')
                mkdir(outpath);
                imwrite(I,[outpath sprintf('%d.png',k)]);
                number=number+1;
            end
            gamma=[0.5 0.7 0.9 1 2 5];
            for cc = 1:length(gamma)
                % applying power law of 6 different types
                I1=powerlaw(img,gamma(cc));
                I1 = imresize(I1,[240 240], 'bicubic');
                outpath=strcat(outdir,sprintf('%d',i),'\',sprintf('%d',(number_of_files(1)-3)+number),'\');
                mkdir(outpath);
                imwrite(I1,[outpath sprintf('%d.png',k)]);
                number=number+1;
            end
            
        end
%         number=number+1;
    end
end