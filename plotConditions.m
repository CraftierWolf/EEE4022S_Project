function plotConditions(location,descriptorColumn,RSSICol)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
%Descriptor column and RSSIColumn needs to be in the for M.descriptor where M is the table
%that is read in
%The title for the descriptors in the table M
% Rx - descriptor
% Hx -  descriptor_2
% Tx - desciptor_4
%Locattion is either Rx, Tx or Hx in string format
C_uni1 = unique(descriptorColumn);
row1 = createRow(descriptorColumn,C_uni1);
 size_Row = size(row1);
 RSSIArr = createRowRSSI(row1,RSSICol,size_Row);
figure();

%bins=0;

for k=1:size_Row(2)
    %figure();
    %H(k)=zeroes();
    %H(k) = bar(RSSIarr(k,:));
    %[a ed] = histcounts(RSSIarr(k,:));
    
    range = round(abs(max(max(RSSIArr))-min(min(RSSIArr))));
    bins=0;
 
    if ((range/2)==0)
    bins=range;
    else
    bins = range+1;
    disp(bins);
    H(k) = histogram(RSSIArr(k,:),bins);
    disp("The number of counts in each bin for "+C_uni1(k));
    hold on;
    [N,edges]=histcounts(RSSIArr(k,:),bins);
    disp(N);
    disp("The total number of samples");
    disp(cumsum(N));
    disp(edges);
    end
   %disp(N);
    %title(location+" "+C(k)+" description");
    %ylabel("Number of occurrence");
    %xlabel("RSSI(dB)");
end
disp(size(H));
%title("A Histogram Showing the Number of Data Points within Each RSSI Bin for Each "+location +" Weather"+" Description",'FontSize',14);
%title("A Histogram Showing the Number of Data Points for Rain and No Rain Conditions at "+location,'FontSize',14);
title("A Histogram Showing the Number of Data Points within Each RSSI Bin for Each "+location +" Wind"+" Description",'FontSize',14);
ylabel("Number of Elements in the Bin");
xlabel("Average RSSI(dB)");
legend(C_uni1);

end 
%H.BinWidth=1;

  
  

