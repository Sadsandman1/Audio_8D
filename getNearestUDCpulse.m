function [pulse,azerr,elerr] = getNearestUDCpulse(azimuth,elevation,h3D)
% Devuelve la respuesta al impulso del h3d que esta mas cerca al azimuth
% especificado
    if nargin<1
        fprintf('Format: [pulse,azzer,elerr] = getNearestUDCpulse(azimuth,elevation,h3D)\n');
        return;
    end
    
    azimuth=pvaldeg(azimuth);
    
    if (azimuth<-90) || (azimuth>90)
        error('Azimuth Invalido');
    end
    
    elevation=pvaldeg(elevation);
    
    elmax=50;
    elindices=1:elmax;
    elevations=-45+5.625*(elindices-1);
    el=round((elevation+45)/5.625+1);
    el=max(el,1);
    el=min(el,elmax);
    elerr=pvaldeg(elevation-elevations(el));
    
    azimuths=[-80 -65 -55 -45:5:45 55 65 80];
    [azerr, az]=min(abs(pvaldeg(azimuths-azimuth)));
    
    pulse=squeeze(h3D(az,el,:));
end

