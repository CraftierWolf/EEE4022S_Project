clc; clear all; close all;
addpath('C:\Users\ZUBAIR\Documents\University\UCT\Electrical Engineering 4th Year\EEE4022S\Data\rtlsdr_matlab');
addpath('C:\Users\ZUBAIR\Documents\University\UCT\Electrical Engineering 4th Year\EEE4022S\Sample Data\');
%addpath('C:\Users\ZUBAIR\Documents\University\UCT\Electrical Engineering 4th Year\EEE4022S\Sample Data\Data_recordings');
addpath('C:\Users\ZUBAIR\Documents\University\UCT\Electrical Engineering 4th Year\EEE4022S\Sample Data\Data_recordings\89MHz');
addpath('C:\Users\ZUBAIR\Documents\University\UCT\Electrical Engineering 4th Year\EEE4022S\Sample Data\Data_recordings\94.5MHz');
%file = 'gqrx_20200907_194426_89100000_1024000_fc';
addpath('C:\Users\ZUBAIR\Documents\University\UCT\Electrical Engineering 4th Year\EEE4022S\Sample Data\Data_recordings\DAB');
addpath('C:\Users\ZUBAIR\Documents\University\UCT\Electrical Engineering 4th Year\EEE4022S\Sample Data\Data_recordings\new_DAB');

%Code to get all the RSSI data from folder and write to an excel
%spreadsheet
pat='C:\Users\ZUBAIR\Documents\University\UCT\Electrical Engineering 4th Year\EEE4022S\Sample Data\Data_recordings\new_DAB';  % Your folder
fil=fullfile(pat,'*.bin');
xlsfile = 'C:\Users\ZUBAIR\Documents\University\UCT\Electrical Engineering 4th Year\EEE4022S\Sample Data\DAB_RSSI.xlsm';
d=dir(fil);
for k=1:numel(d)
  filename=fullfile(pat,d(k).name);%files are read in from the least recent which is needed
  [filepath,name,ext] = fileparts(filename); 
  file = string(name)+string(ext);
  disp(file);
  [RSSIarr_,ave_power] = fileRSSI(122880000,2048000,0.5,36.4,file);
  writeXLS(xlsfile,RSSIarr_,ave_power,file);
  % do
end

% [RSSIarr_,ave_power] = fileRSSI(150000000,250000,0.5,36.4,"2020091214.00.00.bin");
% filename = '89MHz_RSSI.xlsm';
% file='2020091214.00.00.bin';
% writeXLS(filename,RSSIarr_,ave_power,file);

%[ndata, text, alldata]=xlsread(filename);
%[NoOfRows,NoOfColumn]= size(ndata);



