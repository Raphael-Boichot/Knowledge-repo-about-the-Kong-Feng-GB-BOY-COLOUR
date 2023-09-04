clc
clear

name='HITEK_MULTI-0.dump'
fileID = fopen(name);
data=fread(fileID);
k = strfind(data',[0xCE 0xED 0x66 0x66])-261;%Nintendo logo

for i=1:1:length(k)-1
    disp(['Rom name: ',char(data(k(i)+309:k(i)+324))',' Size in bytes: 0x',dec2hex(k(i+1)-k(i),6),' - Starting offset: 0x',dec2hex(k(i),6)])
end
disp(['Rom name: ',char(data(k(end)+309:k(end)+324))',' Size in bytes: 0x',dec2hex(length(data)-k(end),6),' - Starting offset: 0x',dec2hex(k(end),6)])
