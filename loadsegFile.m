function y = loadsegFile(filename,segmentLength,index) 
%  y = loadFile(filename)
% %segment length refers to how many samples not IQ pairs
%that means you would need twice the size if you want a certain number of
%IQ pairs - if you inputted 150000 you'd need to multiply by two because y
%is twice the size of samples inputted
% reads  complex sample segments from the rtlsdr file 
% The file y will have half the size of total samples

fid = fopen(filename,'rb');
fseek(fid,index,'bof');%sets the point where the file should start reading from
y = fread(fid,2*segmentLength,'uint8=>double');

    
y = y-127.5;
y = y(1:2:end) + 1i*y(2:2:end);
fclose('all');
