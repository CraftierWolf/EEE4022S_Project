function plotBar(location,descriptorColumn,RSSIColumn)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
%Descriptor column and RSSIColumn needs to be in the for M.descriptor where M is the table
%that is read in
%The title for the descriptors in the table M
% Rx - descriptor
% Hx -  descriptor_2
% Tx - desciptor_4
%Locattion is either Rx, Tx or Hx in string format
Cbar = unique(descriptorColumn);
row = createRow(descriptorColumn,Cbar);
 size_row = size(row);
 RSSIarr = createRowRSSI(row,RSSIColumn,size_row);

figure()
hb = bar(RSSIarr,'FaceColor','b');
%RSSIarr is used because each data point in the column goes to the next 
%histogram(RSSIarr);
%hb(1).FaceColor='r';
set(gca,'Xtick',1:length(Cbar),'XtickLabel',Cbar,'YDir','reverse');
%set(gca,'Xtick',1:length(C),'XtickLabel',C,'YDir','reverse','FontSize',8);
title("Bar graph showing the RSSI under different "+location+" weather conditions");
ylabel("Average RSSI in dB");
xlabel("Weather descriptor");
%legend(C);


end

