function plotTime(fileColumn,RSSIColumn,minutes)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%Variable inputs
%fileColumn in the form M.Filename
minutes;
times = {};
for k = 1:24
    times{k} = string(k-1)+minutes;
end 
%radio = "89MHz";
indices_ = zeros(1,1);
names = {};
counter = 0;

%The code below creates an indices array where the rows represent the times
%from 0 to 23.00 and the columns represent the respective indices 
for j = 1:length(times)
    for i = 1:length(fileColumn)
    if contains(fileColumn(i),times{j})==1
        counter = counter+1;
        indices_(j,i)=i;
        names{j,i}=fileColumn(i);
    else
        %
    end
end
end 

%the problem with using contains is that filenames with 4.00 and 14.00 will
%both be recorded for the index

indiceSize = size(indices_);
for k = 1:indiceSize(2)
    count = 0;
    row = zeros(1,1);
    for n = 1:indiceSize(1)
        if indices_(n,k)==0
            %
        else
            count = count+1;
            row(1,count)=n;
            if count==2
                indices_(row(1,1),k)=0;
            else 
            end
        end
    end
end 
 lengths = zeros(1,length(times));
 counts = 0;
 RSSIarr = zeros();
for c = 1:indiceSize(1)
    items =0;
    for col = 1:indiceSize(2)
        if indices_(c,col)==0
        else
            items = items+1;
            counts = counts+1;
            RSSIarr(counts) = RSSIColumn(indices_(c,col));
        end
    end
    lengths(1,c) = items;
end 

cumLengths = flip(cumsum(lengths));%flips the cumulative lengths 
%colors_ = {[0, 0.4470, 0.7410],[0.8500, 0.3250, 0.0980],[0.9290, 0.6940, 0.1250],[0.4940, 0.1840, 0.5560],[0.4660, 0.6740, 0.1880],[0.3010, 0.7450, 0.9330],[0.6350, 0.0780, 0.1840],[0, 0, 1],[0, 0.5, 0],[1, 0, 0],[0, 0.75, 0.75],[0.75, 0, 0.75],[0.75, 0.75, 0],[0.25, 0.25, 0.25],'g'};
for j = 1:length(times)
     hold on;
     bar(RSSIarr(1:cumLengths(j)),'FaceColor',rand(1,3),'EdgeColor','none','LineStyle','none');
    % bar(row(1:cumLengths(j)));
end
 title("The Average RSSI Based on Time of Day",'FontSize',16);
 ylabel("Average RSSI (dB)");
 xlabel("Sample Number");
 legend(flip(times));
 set(gca,'YDir','reverse');
end


