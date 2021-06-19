% power law
function I3=powerlaw(img,gamma)
    c=1;
    I3 = c * img.^ gamma;    
end