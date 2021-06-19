function blurred=avg_filter(img)
    fil = fspecial('average',3);
    blurred = imfilter(img,fil);   
end