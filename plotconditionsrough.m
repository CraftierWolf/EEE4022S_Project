%plot conditions working
%Rough working 
disp("The column of Rx descriptors");
disp(M.descriptor);%gets the specific column called descriptor
disp("The unique Rx descriptors in alphabetical order");
C = unique(M.descriptor);
disp(C);%returns the descriptors in alphabetical order
disp("The row numbers where the desciptor matches the first unique descriptor alphabetically");
disp(find(M.descriptor==string(C(1))));
 count = [];
 row = [];%creates array of zeros
  for index =(1:length(C))
     rows = find(M.descriptor==string(C(index)));%finds where the values in the colum 
     %match the descriptor
     for j = 1:length(rows)%takes the row values of the descriptors
     row(j,index)=rows(j);%adds the row values as a column. These 
     %correlate to the order of C not M.descriptor
     rowsize = size(rows);
     count(index)=(rowsize(1));
     end
  end
% disp("Count displays how many occurences for each descriptor");
  %disp(count);
 % disp("Row displays the rows for each descriptor in the form: C(1) is first column, and the rows show the rows for that specific descriptor");
 % disp(row);
  sizeRow = size(row);
 % disp(sizeRow);%The rows (sizeRow (1) tells how many/max rows of occurrences and the column
  %represents the descriptors (sizeRow(2))
 RSSIarray = {};
 obsArray = {};
 RSSIobs1 = [];
 counter=0;
 observer = [];
 for column_ = 1:sizeRow(2)
     RSSIobs = [];
     for obs = 1:count(column_)
         k = counter+obs;
         RSSIobs(obs) = M.AverageRSSI_dB_(row(obs,column_));
         RSSIobs1(k) = M.AverageRSSI_dB_(row(obs,column_));
     end
     RSSIarray{column_}=RSSIobs;
     counter =counter + length(RSSIobs);
     observer = horzcat(observer,repmat(C(column_),1,count(column_)));
     observ = repmat(C(column_),1,count(column_));
     obsArray{column_}=observ;
 end
  disp(counter(1));%displays the total number of rows
  disp(RSSIarray{1});%cell array for the RSSI values for the first descriptor
  disp(obsArray{1});%cell array for the first descriptor, repeats the descriptor name N times
  disp(length(RSSIarray));
%  %figure();
%  %bar(RSSIobs1);
%  %histogram(RSSIobs1);
%   disp(RSSIarray);
%   disp(obsArray);
%  disp(count);
%  disp(C);
%  %figure();
% %  for i=1:length(RSSIarray)
% %matrix = M.descriptor(row);
% 
% 
% 
% data1 =[];
% for i = 1:length(RSSIarray)
%     [data1 transpose(RSSIarray{i})];
% end
% data = [randi([1 3], 5, 1)  randi([4 6], 5, 1)  randi([4 6], 5, 1)];
% figure(1)
% hb = bar(data);
% set(hb(1), 'FaceColor','r');
% set(hb(2), 'FaceColor','b');
% set(hb(3), 'FaceColor','g');


% figure();
% for i=1:length(RSSIarray)
%     hb=bar);
%     
% end
% bar(obsArray{1},RSSIarray{1},0.125,'FaceColor',[0,0,1]);   
% bar(obsArray{1},RSSIarray{1},0.25,'FaceColor',[0,1,0]);
%B = [];

% bar(xdata,bpcombine1,0.4,'FaceColor',[1,0,0]);
% set(gca, 'XTick', 1:6, 'XTickLabel', labels);
% title('Blocking Probability vs Routing Level');
% for i=1:length(RSSIarray)
%     hold on;
%     if i==1
%         H = bar(1:cumsum(count(1)),RSSIobs1(1:count(1)));
%     else
%         H = bar(cumsum(count(i-1)):cumsum(count(i)),RSSIobs1(cumsum(count(i-1)),cumsum(count(i))));
%     end 
% end
% H = bar(RSSIobs1);
% set(gca,'Xtick',1:length(RSSIobs1),'XtickLabel',observer);
% legend(C);
% for i = 1:length(count)
%     
% end
% %      bar(RSSIarray{i})
%      hold on;
%  end
%  set(gca, 'XTick', 1:6, 'XTickLabel', labels);
% title('Blocking Probability vs Routing Level');
% figure(1)
% hold on
% for i = 1:length(RSSIobs)
%     h=bar(i,RSSIobs(i));
%     if mydata(i) < 0.2
%         set(h,'FaceColor','k');
%     elseif mydata(i) < 0.6
%         set(h,'FaceColor','b');
%     else
%         set(h,'FaceColor','r');
%     end
% end
% hold off
%  
%  for i =1:length(RSSIarray)
%      bar(RSSIarray{i})
%      hold on;
%  end
 %bar(obsArray,RSSIarray,0,8);