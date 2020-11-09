function createBarGraph(locx,descrCol,RSSIColAve)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
%"Rx",M.descriptor,M.AverageRSSI_dB_
C_col = unique(descrCol);
row_bar = zeros(1,1);%creates array of zeros
lengths = [];
 for index =(1:length(C_col))
     rows = find(descrCol==string(C_col(index)));%finds where the values in the colum 
     %match the descriptor
     lengths(index)=length(rows);
     for j = 1:length(rows)%takes the row values of the descriptors
     row_bar=vertcat(row_bar,RSSIColAve(rows(j)));%adds the row values as a column. These 
     %correlate to the order of C no M.descriptor
     end
 end
 row_bar = (row_bar(2:end));
cumLengths = flip(cumsum(lengths));%this is the cumulative lengths from the end to the start
figure();
colors_ = {[0, 0.4470, 0.7410],[0.8500, 0.3250, 0.0980],[0.9290, 0.6940, 0.1250],[0.4940, 0.1840, 0.5560],[0.4660, 0.6740, 0.1880],[0.3010, 0.7450, 0.9330],[0.6350, 0.0780, 0.1840],[0, 0, 1],[0, 0.5, 0],[1, 0, 0],[0, 0.75, 0.75],[0.75, 0, 0.75],[0.75, 0.75, 0],[0.25, 0.25, 0.25],'g'};
 char('bkrgycm');
for j = 1:length(C_col)
     hold on;
     bar(row_bar(1:cumLengths(j)),'FaceColor',colors_{j},'EdgeColor','none','LineStyle','none');
    % bar(row(1:cumLengths(j)));
end
 title("The Average RSSI for Different Weather Descriptors Observed at "+locx,'FontSize',16);
 ylabel("Average RSSI (dB)");
 xlabel("Sample Number");
 legend(flip(C_col));
 set(gca,'YDir','reverse');
 

end

