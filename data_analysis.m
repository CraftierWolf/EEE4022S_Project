%read in data for analysis

%Notes about the table that is read into matlab
% The raw RSSI data starts at column 39
%The average RSSI is column 2
%Rx is from 3 to 14
%Hx is from 15 to 26
%Tx is from 27 to 38

"""Allows you to see the reading in file options""";
%opts = detectImportOptions('89MHz_RSSI.xlsm');
%disp(opts);
%preview('89MHz_RSSI.xlsm',opts);
%filepath = 'C:\Users\ZUBAIR\Documents\University\UCT\Electrical Engineering 4th Year\EEE4022S\Sample Data\89MHz_RSSI.xlsm';
%filepath = 'C:\Users\ZUBAIR\Documents\University\UCT\Electrical Engineering 4th Year\EEE4022S\Sample Data\DAB_RSSI.xlsm';
filepath = 'C:\Users\ZUBAIR\Documents\University\UCT\Electrical Engineering 4th Year\EEE4022S\Sample Data\94MHz_RSSI.xlsm';
%94MHz_RSSI.xlsm
"""Read in data as a table""";
[ndata, text, alldata]=xlsread(filepath,'Sheet3');
[NoOfRows,NoOfColumn]= size(alldata);
range = "A1:"+"AUP"+string(NoOfRows);%for the DAB it will be till FB
M = readtable('94MHz_RSSI.xlsm','Sheet','Sheet3','Range',range);%reads in data a table
disp(M);
%disp(M(1:5,{'AverageRSSI_dB_'}));
disp(M.AverageRSSI_dB_);%shows the avergae RSSI column 

"""Plotting Conditions on a single histogram""";
%plotConditions("Rx",M.descriptor_1,M.AverageRSSI_dB_);
%plotConditions("Rx",M.typeOfPrecipitation,M.AverageRSSI_dB_);
%plotConditions("Rx",M.windDescription,M.AverageRSSI_dB_);
%M.desciptor is for RxWeather condition
%M.AverageRSSI_dB_ is for the column of RSSI values
%M.windDescription is for Rx wind
%M.descriptor_1 is for Rx rain or no rain but also other descriptors
%M.typeOfPrecipitation is for Rx rain or not
%Maybe use the weather descriptor because it incorporates rain

%M.descriptor_2 is for the HxWeather condition
%plotConditions("Hx",M.descriptor_3,M.AverageRSSI_dB_);
%plotConditions("Hx",M.typeOfPrecip,M.AverageRSSI_dB_);
%plotConditions("Hx",M.windDescriptor,M.AverageRSSI_dB_)
%windDescriptor is for Hx wind
%M.typeOfPrecip is for rain or no rain
%M.descriptor_3 is for rain description

%M.descriptor_1 for the Tx wind
%M.descriptor_4 for the Tx weather conditions
%plotConditions("Tx",M.descriptor_5,M.AverageRSSI_dB_);
%plotConditions("Tx",M.typeOfPrecip_1,M.AverageRSSI_dB_)
%plotConditions("Tx",M.windDescriptor_1,M.AverageRSSI_dB_)
%M.typeOfPrecip_1 for the Tx rain or no rain
%M. descriptor_5 is for the description of the rain

"""Plot conditions with adjusted bins""";
%plotConditions2("Rx",M.descriptor_1,M.AverageRSSI_dB_);
%plotConditions2("Rx",M.typeOfPrecipitation,M.AverageRSSI_dB_);
%plotConditions2("Hx",M.descriptor_3,M.AverageRSSI_dB_);
%plotConditions2("Hx",M.typeOfPrecip,M.AverageRSSI_dB_);
%plotConditions2("Tx",M.descriptor_5,M.AverageRSSI_dB_);
%plotConditions2("Tx",M.typeOfPrecip_1,M.AverageRSSI_dB_);

"""Plotting data on a single bar graph""";
%plotBar("Rx",M.descriptor_1,M.AverageRSSI_dB_);
%plotBar("Hx",M.descriptor_3,M.AverageRSSI_dB_);
%plotBar("Rx",M.typeOfPrecipitation,M.AverageRSSI_dB_);
%plotBar("Hx",M.typeOfPrecip,M.AverageRSSI_dB_);
%plotBar("Tx",M.descriptor_5,M.AverageRSSI_dB_);
%plotBar("Tx",M.typeOfPrecip_1,M.AverageRSSI_dB_);

%based on descriptor

"""Plotting separate bar graphs""";
%plotSepBar(location,descriptorColumn,RSSIColumn)
%plotSepBar("Rx",M.descriptor,M.AverageRSSI_dB_);
%plotSepBar("Hx",M.descriptor_2,M.AverageRSSI_dB_);
%plotSepBar("Rx",M.typeOfPrecipitation,M.AverageRSSI_dB_);
%plotSepBar("Hx",M.typeOfPrecip,M.AverageRSSI_dB_);
%plotSepBar("Tx",M.descriptor_4,M.AverageRSSI_dB_);
%plotSepBar("Tx",M.typeOfPrecip_1,M.AverageRSSI_dB_);

"""Plotting scatter plots for all three locations""";
%plotScatter("Ambient Temperature","("+char(176)+"C)",M.RxTemperature,M.HxAmbientTemperature_degreesCelsius_,M.TxAmbientTemperature_degreesCelsius_,M.AverageRSSI_dB_);
%plotScatter("Ambient Humidity","(%)",M.RxHumidity ,M.Humidity___ ,M.Humidity____1,M.AverageRSSI_dB_);
%plotScatter("Ambient Pressure","(hPa)",M.RxPressure ,M.Pressure_hPa_,M.Pressure_hPa__1,M.AverageRSSI_dB_);
%plotScatter("Wind Speed","(km/h)",M.RxWindKm_h,M.windSpeed_km_h_,M.windSpeed_km_h__1,M.AverageRSSI_dB_);
%plotScatter("Wind Speed","(m/s)",M.RxWindM_s,M.windSpeed_m_s_,M.windSpeed_m_s__1,M.AverageRSSI_dB_);
%plotScatter("Cloud Cover","(%)",M.clouds___,M.clouds____1,M.clouds____2,M.AverageRSSI_dB_);
%based on the choice of descriptor

"""Plot scatter plots for a single location""";
%For Rx
%plotSingleScatter(variable,unit,location,Rxdescriptor,averageRSSIdescriptor);
%plotSingleScatter("Temperature","("+char(176)+"C)","Rx",M.RxTemperature,M.AverageRSSI_dB_);
%plotSingleScatter("Humidity","(%)","Rx",M.RxHumidity,M.AverageRSSI_dB_);
%plotSingleScatter("Pressure","(hPa)","Rx",M.RxPressure,M.AverageRSSI_dB_);
%plotSingleScatter("Wind speed","(km/h)","Rx",M.RxWindKm_h,M.AverageRSSI_dB_);
%plotSingleScatter("Wind speed","(m/s)","Rx",M.windSpeed_m_s_,M.AverageRSSI_dB_);
%plotSingleScatter("Cloud Cover","(%)","Rx",M.clouds___,M.AverageRSSI_dB_);

%For Hx 
%plotSingleScatter(variable,unit,location,Hxdescriptor,averageRSSIdescriptor);
%plotSingleScatter("Temperature","("+char(176)+"C)","Hx",M.HxAmbientTemperature_degreesCelsius_,M.AverageRSSI_dB_);
%plotSingleScatter("Humidity","(%)","Hx",M.Humidity___,M.AverageRSSI_dB_);
%plotSingleScatter("Pressure","(hPa)","Hx",M.Pressure_hPa_,M.AverageRSSI_dB_);
%plotSingleScatter("Wind speed","(km/h)","Hx",M.windSpeed_km_h_,M.AverageRSSI_dB_);
%plotSingleScatter("Wind speed","(m/s)","Hx",M.windSpeed_m_s_,M.AverageRSSI_dB_);
%plotSingleScatter("Cloud Cover","(%)","Hx",M.clouds____1,M.AverageRSSI_dB_);

%for Tx
%plotSingleScatter(variable,unit,location,Txdescriptor,averageRSSIdescriptor);
%plotSingleScatter("Temperature","("+char(176)+"C)","Tx",M.TxAmbientTemperature_degreesCelsius_,M.AverageRSSI_dB_);
%plotSingleScatter("Humidity","(%)","Tx",M.Humidity____1,M.AverageRSSI_dB_);
%plotSingleScatter("Pressure","(hPa)","Tx",M.Pressure_hPa__1,M.AverageRSSI_dB_);
%plotSingleScatter("Wind speed","(km/h)","Tx",M.windSpeed_km_h__1,M.AverageRSSI_dB_);
%plotSingleScatter("Wind speed","(m/s)","Tx",M.windSpeed_m_s__1,M.AverageRSSI_dB_);
%plotSingleScatter("Cloud Cover","(%)","Tx",M.clouds____2,M.AverageRSSI_dB_);

"""Display the correlation coefficients for specific relationships""";
%R = correlateFx(Rxvariable,Hxvariable,Txvariable,RSSIvar)
%R = correlateFx(M.RxTemperature,M.HxAmbientTemperature_degreesCelsius_,M.TxAmbientTemperature_degreesCelsius_,M.AverageRSSI_dB_);
%R = correlateFx(M.RxHumidity,M.Humidity___ ,M.Humidity____1,M.AverageRSSI_dB_);
%R = correlateFx(M.RxPressure,M.Pressure_hPa_,M.Pressure_hPa__1,M.AverageRSSI_dB_);
%R = correlateFx(M.RxWindKm_h,M.windSpeed_km_h_,M.windSpeed_km_h__1,M.AverageRSSI_dB_);
%R = correlateFx(M.RxWindM_s,M.windSpeed_m_s_,M.windSpeed_m_s__1,M.AverageRSSI_dB_);
%R = correlateFx(M.clouds___,M.clouds____1,M.clouds____2,M.AverageRSSI_dB_);

"""Plot time of day versus RSSI for a particular day""";
%plotTimeofDay(date,fileNameColumn,averageRSSIColumn,"frequencyMHz")
%plotTimeofDay("20201007",M.Filename,M.AverageRSSI_dB_,"239.2MHz");
%plotTimeofDay("20201007",M.Filename,M.AverageRSSI_dB_,"89MHz");
%plotTimeofDay("20201012",M.Filename,M.AverageRSSI_dB_,"89MHz");
%plotTimeofDay("20201008",M.Filename,M.AverageRSSI_dB_,"89MHz");

%plotTimeofDay("20201007",M.Filename,M.AverageRSSI_dB_,"94,5MHz")
%plotTimeofDay("20201012",M.Filename,M.AverageRSSI_dB_,"94,5MHz");
%plotTimeofDay("20201008",M.Filename,M.AverageRSSI_dB_,"94,5MHz");

%plotTimeofDay("20201007",M.Filename,M.AverageRSSI_dB_,"239.2MHz")
%plotTimeofDay("20201012",M.Filename,M.AverageRSSI_dB_,"239.2MHz");
%plotTimeofDay("20201008",M.Filename,M.AverageRSSI_dB_,"239.2MHz");
%plotTimeofDay("20201009",M.Filename,M.AverageRSSI_dB_,"239.2MHz");

"""Plot a bar graph""";
%createBarGraph("Rx",M.descriptor_1,M.AverageRSSI_dB_);
%createBarGraph("Hx",M.descriptor_3,M.AverageRSSI_dB_);
%createBarGraph("Tx",M.descriptor_5,M.AverageRSSI_dB_);
"""Plot conditions based on a particular descriptor""";
%still need to create this function
%[R,ave] = descriptorPlot(locationx,descColumn,varColumn,RSSIColumn,color,x_lab)
%average gets the average per descriptor in the same order as unique, x_lab
%is the description of the units used
%R returns the correlation coefficients for a specific descriptor 

%[R,ave] = descriptorPlot("Rx",M.descriptor_1,M.RxTemperature,M.AverageRSSI_dB_,"Temperature"+"("+char(176)+"C)")
%[R,ave] = descriptorPlot("Rx",M.descriptor_1,M.RxHumidity,M.AverageRSSI_dB_,"Humidity (%)")
%[R,ave] = descriptorPlot("Rx",M.descriptor_1,M.RxPressure,M.AverageRSSI_dB_,"Pressure (hPa)")
%[R,ave] = descriptorPlot("Rx",M.descriptor_1,M.RxWindM_s,M.AverageRSSI_dB_,"Wind Speed (m/s)")
%[R,ave] = descriptorPlot("Rx",M.descriptor_1,M.clouds___,M.AverageRSSI_dB_,"Cloud Cover (%)")

%[R,ave] = descriptorPlot("Hx",M.descriptor_3,M.HxAmbientTemperature_degreesCelsius_,M.AverageRSSI_dB_,"Temperature"+"("+char(176)+"C)")
%[R,ave] = descriptorPlot("Hx",M.descriptor_3,M.Humidity____1,M.AverageRSSI_dB_,"Humidity (%)")
%[R,ave] = descriptorPlot("Hx",M.descriptor_3,M.Pressure_hPa_,M.AverageRSSI_dB_,"Pressure (hPa)")
%[R,ave] = descriptorPlot("Hx",M.descriptor_3,M.windSpeed_m_s_,M.AverageRSSI_dB_,"Wind Speed (m/s)")
%[R,ave] = descriptorPlot("Hx",M.descriptor_3,M.clouds____1,M.AverageRSSI_dB_,"Cloud Cover (%)")

%[R,ave] = descriptorPlot("Tx",M.descriptor_5,M.TxAmbientTemperature_degreesCelsius_,M.AverageRSSI_dB_,"Temperature"+"("+char(176)+"C)")
%[R,ave] = descriptorPlot("Tx",M.descriptor_5,M.Humidity____1,M.AverageRSSI_dB_,"Humidity (%)")
%[R,ave] = descriptorPlot("Tx",M.descriptor_5,M.Pressure_hPa__1,M.AverageRSSI_dB_,"Pressure (hPa)")
%[R,ave] = descriptorPlot("Tx",M.descriptor_5,M.windSpeed_m_s__1,M.AverageRSSI_dB_,"Wind Speed (m/s)")
%[R,ave] = descriptorPlot("Tx",M.descriptor_5,M.clouds____2,M.AverageRSSI_dB_,"Cloud Cover (%)")

"""Plot conditions based on3 a particular time of day""";
%still need to create this function
%This function plots the RSSI based on time of day for the entire day on a
%single bar plot
%plotTime(M.Filename,M.AverageRSSI_dB_,".00")
%plotTime(M.Filename,M.AverageRSSI_dB_,".20")
%plotTime(M.Filename,M.AverageRSSI_dB_,".40")
