% %Log
% img=imread('1.png');
function I3=logar(img,cc)
    I3 = cc.*(log10(1+img));   
end