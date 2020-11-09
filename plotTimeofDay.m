function plotTimeofDay(date,fileNameColumn,averageRSSIColumn,radio)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

%Day in the form 20201023 where year then month then day, in the form of
%a string
%fileNameColumn is for example M.Filename
%fileColumn is M.AverageRSSI_dB_
%disp(size(M.Filename));
%date = '20201008';
indices_ = zeros();
names = {};
counter = 0;
for i = 1:length(fileNameColumn)
    if contains(fileNameColumn(i),date)==1
        counter = counter+1;
        indices_(counter)=i;
        names{counter}=fileNameColumn(i);
    else
        %
    end
end 
%disp(indices_{1});
for j =1:length(names)
    disp(names{j});
end 
times = {};
for i=1:length(names)
    newStr = string(erase(names{i},radio+date));
    newStr= convertStringsToChars(newStr);
    newStr = newStr(1:end-10);
    times{i}=newStr;
end
disp(times);
RSSIval = zeros(1,length(indices_));
for c = 1:length(indices_)
    RSSIval(c) = averageRSSIColumn(indices_(c));
end
disp(RSSIval);

figure();
bar(RSSIval),
set(gca,'Xtick',1:length(times),'XtickLabel',times,'YDir','reverse');
%set(gca,'Xtick',1:length(C),'XtickLabel',C,'YDir','reverse','FontSize',8);
title("Bar Graph Showing the RSSI at Different Times of the Day Date (YYYYMMDD format): "+date,'FontSize',16);
ylabel("Average RSSI (dB)");
xlabel("Time of Day");
end

