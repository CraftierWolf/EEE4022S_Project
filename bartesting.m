%bar graph working out

uniqueC = unique(M.descriptor);
disp(uniqueC);
row = zeros(1,1);%creates array of zeros
lengths = [];
 for index =(1:length(uniqueC))
     rows = find(M.descriptor==string(uniqueC(index)));%finds where the values in the colum 
     %match the descriptor
     lengths(index)=length(rows);
     for j = 1:length(rows)%takes the row values of the descriptors
     row=vertcat(row,M.AverageRSSI_dB_(rows(j)));%adds the row values as a column. These 
     %correlate to the order of C no M.descriptor
     end
 end
 row = (row(2:end));
 disp(row(41));
 disp(row(42));
 disp(lengths);
%disp(row(3));
disp(size(row));
disp((M.AverageRSSI_dB_(17)));
disp((M.AverageRSSI_dB_(18)));
%disp(find(M.descriptor==string(uniqueC(2))));
cumLengths = flip(cumsum(lengths));%this is the cumulative lengths from the end to the start
figure();
colors_ = {[0, 0.4470, 0.7410],[0.8500, 0.3250, 0.0980],[0.9290, 0.6940, 0.1250],[0.4940, 0.1840, 0.5560],[0.4660, 0.6740, 0.1880],[0.3010, 0.7450, 0.9330],[0.6350, 0.0780, 0.1840],[0, 0, 1],[0, 0.5, 0],[1, 0, 0],[0, 0.75, 0.75],[0.75, 0, 0.75],[0.75, 0.75, 0],[0.25, 0.25, 0.25]};
 char('bkrgycm');
for j = 1:length(uniqueC)
     hold on;
     bar(row(1:cumLengths(j)),'FaceColor',colors_{j});
    % bar(row(1:cumLengths(j)));
end
 title("The Average RSSI under different weather descriptors at Rx");
 ylabel("Average RSSI (dB)");
 xlabel("Data point number");
 legend(flip(uniqueC));
 set(gca,'YDir','reverse');