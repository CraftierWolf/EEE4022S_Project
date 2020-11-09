function [R,ave] = descriptorPlot(locationx,descColumn,varColumn,RSSIColumn,x_lab)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%descColumn and othe r columns in the form M.descript
%color as a string such as 'r'
%locationx as a string 'Rx' for example
uniqueDesc = unique(descColumn);

rowT = createRow(descColumn,uniqueDesc);
%disp(size(M.descriptor_1))
size_Row = size(rowT);
 RSSIArrt = createRowRSSI(rowT,RSSIColumn,size_Row);
 descrArr = zeros(1,1);
 
 for j = 1:size_Row(2)
     for m = 1:size_Row(1)
         if ((rowT(m,j))>0)
             descrArr(j,m)=varColumn(rowT(m,j));
         else
             descrArr(j,m)=NaN;
         end
     end
 end 
   %descrArr(descrArr==0) = NaN; 
 
 disp(size_Row);%the first variable is the columns (the number of instances) and 
 %the second variable is the number of descriptors
 
 rcounts = zeros();
 rcounter = 0;
 for k = 1:size_Row(2)%This loop is used to find the number of elements for each descriptor getting 
     %rid of the NaNs
     for l = 1:size_Row(1)
         if (isnan(descrArr(k,l))==1)
             rcounter = rcounter+1;
             rcounts(rcounter) = l-1;
             break
         else
             if l==size_Row(1)
                 rcounter=rcounter+1;
                 rcounts(rcounter) = l;
             else
             end
             %do nothing
         end 
     end 
 end 
 R = zeros();
 %R1 = corrcoef(Rxvariable,RSSIvar);
 figure();
 %colors_ = {[0, 0.4470, 0.7410],[0.8500, 0.3250, 0.0980],[0.9290, 0.6940, 0.1250],[0.4940, 0.1840, 0.5560],[0.4660, 0.6740, 0.1880],[0.3010, 0.7450, 0.9330],[0.6350, 0.0780, 0.1840],[0, 0, 1],[0, 0.5, 0],[1, 0, 0],[0, 0.75, 0.75],[0.75, 0, 0.75],[0.75, 0.75, 0],[0.25, 0.25, 0.25],'g'};
 colors_ = {'r','b','g','k','m','o','c','p'};
 for k = 1:size_Row(2)
     %figure();
     hold on;
     scatter(descrArr(k,:),RSSIArrt(k,:),'filled',colors_{k});
     %title("A Scatterplot Given the Weather Description '"+string(uniqueDesc(k))+"' at Location "+locationx,'FontSize',16);
     %title(string(M.descriptor_1)+" at location "+"Rx");
     %xlabel(x_lab);
     %ylabel("Average RSSI (dB)");
     r = corrcoef(descrArr(k,1:rcounts(k)),RSSIArrt(k,1:rcounts(k)));
     if (length(r))>1
         R(k) = r(1,2);
     else
         R(k) = r(1);
     end
 end
 title("A Scatterplot Showing the Relationship Between Average RSSI and "+x_lab+ " For a Given Weather Description at Location "+locationx,'FontSize',16)
 xlabel(x_lab);
 ylabel("Average RSSI (dB)");
 legend(uniqueDesc,'FontSize',12);
 ave=zeros(1,1);
 for q  = 1:size_Row(2)
     sum_ = 0;
     last_index = 0;
     for o = 1:size_Row(1)
         if (isnan(RSSIArrt(q,o))==1)
             %
         else
             sum_ = sum_+RSSIArrt(q,o);
             last_index = last_index +1;
         end
     end
     ave(q) = sum_/last_index;
 end
 
end

