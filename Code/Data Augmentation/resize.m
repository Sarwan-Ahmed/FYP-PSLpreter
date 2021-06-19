% the input directory
taskdir='C:\Users\boss\Desktop\FYP\Current\new_data\';
% the output directory
outdir='C:\Users\boss\Desktop\new_data100x100\';
% for all the classes
for i= 0: 127
    a=strcat(taskdir,sprintf('%d',i),'\');
    list = dir(a);
    number_of_files = size(list)
    b=strcat(outdir,sprintf('%d',i),'\');
    % for all the files in the class
    for j=0:number_of_files(1,1)-3
        path=strcat(a,sprintf('%d',j),'\');
        list1 = dir([path '*.png']);
        number_of_files1 = size(list1);
        outpath=strcat(b,sprintf('%d',j),'\')
        mkdir(outpath);
        % for all frames in the instances
        for k=1:number_of_files1(1,1)
            filename = list1(k).name
            img=imread(strcat(path,filename));
            % resize image to 100x100 using bicubic interpolation
            i = imresize(img,[100 100], 'bicubic');
            imwrite(i,[outpath sprintf('%d.png',k)]);
            
        end
    end
end
