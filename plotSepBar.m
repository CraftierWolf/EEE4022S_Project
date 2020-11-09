function plotSepBar(location,descriptorColumn,RSSIColumn)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

C = unique(descriptorColumn);
row = createRow(descriptorColumn,C);
 size_row = size(row);
RSSIarray=  createRowRSSI(row,RSSIColumn,size_row2);

colors_ = {[0, 0.4470, 0.7410],[0.8500, 0.3250, 0.0980],[0.9290, 0.6940, 0.1250],[0.4940, 0.1840, 0.5560],[0.4660, 0.6740, 0.1880],[0.3010, 0.7450, 0.9330],[0.6350, 0.0780, 0.1840],[0, 0, 1],[0, 0.5, 0],[1, 0, 0],[0, 0.75, 0.75],[0.75, 0, 0.75],[0.75, 0.75, 0],[0.25, 0.25, 0.25]}; 	
 for k=1:size_row(2)
     %H(k)=zeros();
     %H(k) = (RSSIarr(k,:));
     figure();
     H(k) = bar(RSSIarray(k,:),'FaceColor',colors_{k});
    %H(k) = histogram(RSSIarr(k,:));
     %legend_(k)=string(C(k));
     %hold on;
     
     title("Ambient weather condition "+C(k)+" at "+location);
     ylabel("Average RSSI (dB)");
     xlabel("Number of occurence");
     set(gca,'Xtick',1:length(find(descriptorColumn==string(C(k)))),'YDir','reverse','Fontsize',6);
 legend(C(k));
 end 
end

