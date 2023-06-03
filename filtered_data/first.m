data = Clean_data;
datat= data';

for i=1:32
    cz= datat(:,i);

    feature(i,1)= mean(cz);
    feature(i,2)= median(cz);
    feature(i,3)= var(cz);
    feature(i,4)= std(cz);
    feature(i,5)= skewness(cz);
    feature(i,6)= kurtosis(cz);
    feature(i,7)= zerocrossrate(cz);
    % feature(i,8)= (cz); %number of waves
    feature(i,9)= peak2peak(cz);
        %feature(i,10)= instfreq(cz_sec,128);

        %function [H, DH] = hjorth(cz_sec);

    dx= diff(cz);
    ddx= diff(dx);

    varx= var(cz);
    varDx= var(dx);
    varDDx= var(ddx);

    feature(i,10)= varx;
    feature(i,11)= sqrt(varDx/varx);
    feature(i,12)= sqrt(varDDx/varDx)/feature(i,11);
end

