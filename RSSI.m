function [RSSI_dB, power] = RSSI(IQdata,G)%conventional RSSI calculation
%G must be in dB, this is the gain when the data is passed through the ADC
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
N = length(IQdata);
%Vrms = zeros(N);
power = zeros(1, N);
for m = 1:N
    power(m)=((real(IQdata(m)))^2 + (imag(IQdata(m)))^2);
end
RSSI_dB = 20*log10((sqrt(sum(power)))/(2*N))-G;%original RSSi formula
%RSSI_dB = 20*log10((sqrt(sum(power)))/(N))-G;%original RSSi formula with N
%RSSI_dB = 10*log10(((sum(power))/(2*N)))-G;% corrected RSSI formula
%RSSI_dB = 20*log10((sqrt(sum(power))))+20*log10(1/(2*N))-G;%original RSSi formula
end

