function plotSingleScatter(variable,unit,location,Rxdescriptor,averageRSSIdescriptor)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%location is specififed as "Rx", "Tx" or "Hx"
figure();
scatter(Rxdescriptor,averageRSSIdescriptor,'filled');
legend(location+" "+variable);
xlabel(variable+" "+unit);
ylabel("Average RSSI (dB)");
title("A plot showing the relationship between ambient "+variable+" and Average RSSI at "+location);
end

