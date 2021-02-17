function angle = pvaldeg(angle)
%PVALDEG Summary of this function goes here
%   mapea el angulo de -90  a 270
    if nargin<1
        fprintf('Format: angle = pvaldeg(angle)\n');
        return;
    end
    dtr=pi/180;
    angle=atan2(sin(angle*dtr),cos(angle*dtr))/dtr;
    
    if angle<-90
        angle=angle+360;
    end
end

