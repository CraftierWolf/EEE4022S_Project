function plotScatter(variable,unit,Rxdescriptor,Hxdescriptor,Txdescriptor,averageRSSIdescriptor)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%variable and unit are strings describing what is being plotted
%descriptors should be in the form M.descriptor
figure();
hold on;
scatter(Rxdescriptor,averageRSSIdescriptor,'filled');
scatter(Hxdescriptor,averageRSSIdescriptor,'filled');
scatter(Txdescriptor,averageRSSIdescriptor,'filled'); 
%Fit = polyfit(Rxdescriptor,averageRSSIdescriptor,1); % x = x data, y = y data, 1 = order of the polynomial i.e a straight line 
%plot(polyval(Fit,Rxdescriptor))
legend("Rx"+" "+variable,"Hx "+variable,"Tx "+variable);
xlabel(variable+" "+unit);
ylabel("Average RSSI (dB)");
title("A Plot Showing the Relationship between the "+variable+" and Average RSSI at Different Locations",'FontSize',16);
end
%Rx
%Filename               
%AverageRSSI_dB_    RxTemperature    RxHumidity    RxPressure   RxWindM_s    RxWindKm_h    
%windDescription     direction    clouds___        descriptor       precipitation_mmLastHour_    
%typeOfPrecipitation       descriptor_1       

%Hx
%HxAmbientTemperature_degreesCelsius_    
%Humidity___    Pressure_hPa_    windSpeed_m_s_    windSpeed_km_h_     
%windDescriptor      direction_1    clouds____1       descriptor_2       
%precipitation_mmLastHour__1    typeOfPrecip       descriptor_3       

%Tx
%TxAmbientTemperature_degreesCelsius_    Humidity____1    Pressure_hPa__1    
%windSpeed_m_s__1    windSpeed_km_h__1    windDescriptor_1     direction_2    
%clouds____2      descriptor_4       precipitation_mmLastHour__2    
%typeOfPrecip_1    descriptor_5     
