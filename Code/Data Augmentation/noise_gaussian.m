% gaussian noise introduction
function I3=noise_gaussian(img)
    I3 = imnoise(img,'gaussian');   
end