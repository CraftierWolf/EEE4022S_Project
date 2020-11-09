function writeXLS(filename,RSSIarr_,ave_power,file)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[ndata, text, alldata]=xlsread(filename,'Sheet3');
[NoOfRows,NoOfColumn]= size(alldata);
dataRow = "AM"+string(NoOfRows);
nameRow = "A"+string(NoOfRows);
aveRow = "B"+string(NoOfRows);
xlswrite(filename, RSSIarr_, 3, dataRow);
xlswrite(filename,ave_power, 3, aveRow);
xlswrite(filename, cellstr(file), 3, nameRow);%used to write the file name
end

%filename = '89MHz_RSSI.xlsx';