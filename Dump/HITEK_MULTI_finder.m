clc
clear

name='HITEK_MULTI-0.dump'
fileID = fopen(name);
data=fread(fileID);
k = strfind(data',[0xCE 0xED 0x66 0x66])-261;%Nintendo logo

disp('| Data (rom or junk):                  | Size in bytes:          |Starting offset:             |Starting bank:             |')
disp('|----------------------------|-------------------------|-----------------------------|-----------------------------|')

for i=1:1:length(k)-1
    disp(['| ',char(data(k(i)+309:k(i)+324))',' | 0x',dec2hex(k(i+1)-k(i),6),' | 0x',dec2hex(k(i),6),'|',dec2hex(k(i)/2^15),'|'])
end
disp(['| ',char(data(k(end)+309:k(end)+324))',' | 0x',dec2hex(length(data)-k(end),6),' | 0x',dec2hex(k(end),6),'|',dec2hex(k(end)/2^15),'|'])

fid = fopen('HITEK_MULTI_alone.gb','w');
fwrite(fid,data(1:2^15));
fclose(fid);