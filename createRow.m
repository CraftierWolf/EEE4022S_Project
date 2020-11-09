function row = createRow(descriptionColumn,uniqueColumn)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
row = zeros(1,1);%creates array of zeros
 for index =(1:length(uniqueColumn))
     rows = find(descriptionColumn==string(uniqueColumn(index)));%finds where the values in the colum 
     %match the descriptor
     for j = 1:length(rows)%takes the row values of the descriptors
     row(j,index)=rows(j);%adds the row values as a column. These 
     %correlate to the order of C no M.descriptor
     end
 end
end

