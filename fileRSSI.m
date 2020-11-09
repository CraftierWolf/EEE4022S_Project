function [RSSIarr_,ave_power] = fileRSSI(total_samples,fs,segment_time,G,file)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
total_time = total_samples/fs;
disp("The total time");
disp(total_time);
segment_length = fs*segment_time;
disp("The segment length");
disp(segment_length);
iterations = ceil(total_samples/segment_length);
disp("Now reading in the data");
count = 0;
RSSIarr_ = zeros(1,iterations);
for i = 0:iterations-1
    index = segment_length*i;
    if (index+segment_length)>total_samples
        segment_length = total_samples-segment_length;
    else
    end
    data=loadsegFile(file,segment_length,index);%94,MHz2020091616.32.39,65.bin
    [RSSI_dB_, power_] = RSSI(data,G);
    RSSIarr_(i+1)=RSSI_dB_;
    %powerarr_(i+1) = sum(power_);
    count=count+1;
    %disp(size(data));
    disp(length(data));
    disp("The count");
    disp(count);
    disp("The RSSI");
    disp(RSSI_dB_);
    disp("The segment_length");
    disp(segment_length);
    %disp(size(power_));
    subplot(3,1,1);
    plot(abs(data));
    subplot(3,1,2);
    plot(10*log10(abs(fftshift(fft(data)))));
    subplot(3,1,3);
    plot(angle(data));
    %pause(1);
    
end
disp("The array of RSSI values");
disp((RSSIarr_));
ave_power = ave_RSSI(RSSIarr_,segment_length, total_samples); 
disp("The average power");
disp(ave_power);
end

%Code to get RSSI of segments
%total_samples =150000000; %20480000;%150000000;%determined by how much is set using rtl_sdr - 10 minutes in this case
%note that total samples IS the number of IQ pairs
%fs = 250000;%2048000;%250000;%set by rtl_sdr
%total_time = total_samples/fs;
%disp("The total time");
%disp(total_time);
%segment_time = 1;%in seconds, how long each segment should be
%segment_length = fs*segment_time;%the number of samples for the segment
%iterations = ceil(total_samples/segment_length);%the number of iterations needed, ceiled for
%case where not an entire segment is present
%disp("The segment length");
%disp(segment_length);
%G = 36.4; %set in rtl_sdr in dB
%disp("Now reading in the data");
%count = 0;
%RSSIarr_ = zeros(1,iterations);
%powerarr_ = zeros(1:iterations);
%file = "89MHz2020092515.00.05,90.bin";
% for i = 0:iterations-1
%     index = segment_length*i;
%     if (index+segment_length)>total_samples
%         segment_length = total_samples-segment_length;
%     else
%     end
%     data=loadsegFile(file,segment_length,index);%94,MHz2020091616.32.39,65.bin
%     [RSSI_dB_, power_] = RSSI(data,G);
%     RSSIarr_(i+1)=RSSI_dB_;
%     %powerarr_(i+1) = sum(power_);
%     count=count+1;
%     %disp(size(data));
%     disp(length(data));
%     disp("The count");
%     disp(count);
%     disp("The RSSI");
%     disp(RSSI_dB_);
%     disp("The segment_length");
%     disp(segment_length);
%     %disp(size(power_));
%     subplot(3,1,1);
%     plot(abs(data));
%     subplot(3,1,2);
%     plot(10*log10(abs(fftshift(fft(data)))));
%     subplot(3,1,3);
%     plot(angle(data));
%     %pause(1);
%     
% end

 %disp("The array of RSSI values");
 %disp((RSSIarr_));
 %disp(size(RSSIarr_));
 %disp("The array of total power values for each segment");
 %disp(powerarr_);
 %ave_power1 = ave_RSSI(RSSIarr_,segment_length, total_samples); 
 %disp("The average power");
 %disp(ave_power1);
%  ave_power2 = (20*log10(sqrt(sum(powerarr_)))-G)-10*log(total_samples);
%  disp("Average power method 2");
%  disp(ave_power2);