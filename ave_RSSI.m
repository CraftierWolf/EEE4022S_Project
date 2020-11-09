function ave_power = ave_RSSI(RSSIarray,segment_length,total_length)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
Total_RSSI = RSSIarray*segment_length; %under the assumption of no remainder (total/segment)
ave_power = (sum(Total_RSSI))/total_length;
end

