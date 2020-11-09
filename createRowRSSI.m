function RSSIarray = createRowRSSI(row,RSSIcolumn,sizeRow)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
RSSIarray = zeros(1,1);%this array will have the RSSI values for the descriptors (based on the
%ordered descriptors) in a row
for n = 1:(sizeRow(2))
    for k = 1:(sizeRow(1))
        if row(k,n)==0
            %
        else
            RSSIarray(n,k) = RSSIcolumn(row(k,n));
        end
    end
end
H = zeros();
RSSIarray(RSSIarray==0) = NaN;
end

