%Plotting scatter plots
disp(M.RxTemperature);
disp(M.RxHumidity);
disp(M.AverageRSSI_dB_);
figure();
hold on;
scatter(M.RxTemperature,M.AverageRSSI_dB_,'filled');
scatter(M.HxAmbientTemperature_degreesCelsius_,M.AverageRSSI_dB_,'filled');
scatter(M.TxAmbientTemperature_degreesCelsius_,M.AverageRSSI_dB_,'filled'); 
legend("Rx Ambient Temperature","Hx Ambient Temperature","Tx Ambient Temperature");
xlabel("Temperature (degrees celsius)");
ylabel("Average RSSI (dB)");
title("A plot showing the relationship between Temperature and Average RSSI");