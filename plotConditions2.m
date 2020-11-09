function plotConditions2(location,descriptorColumn,RSSIColumn)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
%Descriptor column and RSSIColumn needs to be in the for M.descriptor where M is the table
%that is read in
%The title for the descriptors in the table M
% Rx - descriptor
% Hx -  descriptor_2
% Tx - desciptor_4
%Locattion is either Rx, Tx or Hx in string format
C_uni = unique(descriptorColumn);
row = createRow(descriptorColumn,C_uni);
 size_row2 = size(row);
 RSSIarr2=  createRowRSSI(row,RSSIColumn,size_row2);
figure();

%bins=0;
disp("Size RSSIarr2");
disp(size(RSSIarr2));
disp(size_row2);
for k=1:size_row2(2)
    %figure();
    %H(k)=zeroes();
    %H(k) = bar(RSSIarr(k,:));
    %[a ed] = histcounts(RSSIarr(k,:));
    
    range = round(abs(max(max(RSSIarr2(k,:)))-min(min(RSSIarr2(k,:)))));
    if range==0
        range = 1;
    else
    end
    bins=0;
 
    if (mod(range,2)==0)
    bins=range;
    disp(bins);
    H(k) = histogram(RSSIarr2(k,:),bins);
    disp("The number of counts in each bin for "+C_uni(k));
    hold on;
    [N,edges]=histcounts(RSSIarr2(k,:),bins);
    disp(N);
    disp(edges);
    
    else
    bins = range+1;
    disp(bins);
    H(k) = histogram(RSSIarr2(k,:),bins);
    disp("The number of counts in each bin for "+C_uni(k));
    hold on;
    [N,edges]=histcounts(RSSIarr2(k,:),bins);
    disp(N);
    disp(edges);
    end
   %disp(N);
    %title(location+" "+C(k)+" description");
    %ylabel("Number of occurrence");
    %xlabel("RSSI(dB)");
end
disp(size(H));
title("A Histogram Showing the Data Distribution Across RSSI Values for "+ location+" Weather"+" Descriptions",'FontSize',14);
%title("A Histogram Showing the Number of Data Points for Rain and No Rain Conditions at "+location,'FontSize',14);
%title("A Histogram Showing the Number of Data Points within Each RSSI Bin for Each "+location +" Wind"+" Description",'FontSize',14);
ylabel("Number of Elements in the Bin");
xlabel("Average RSSI(dB)");
legend((C_uni));
disp(C_uni);
end 

