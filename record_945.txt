echo  %date%-%time%
FOR %%A IN (%Date%) DO (
    FOR /F "tokens=1-3 delims=/-" %%B in ("%%~A") DO (
        SET Today=%%D%%C%%B
    )
)

for /f "tokens=* delims= " %%N in ("%time%") do set "time=%%N"

cd C:\Program Files\GNURadio-3.8\bin
rtl_sdr.exe
rtl_sdr -f 94500000 -s 250000 -g 36.4 -n 150000000 94,5MHz%Date:/=%%time::=.%.bin

move "C:\Program Files\GNURadio-3.8\bin\*.bin" "C:\Users\ZUBAIR\Documents\University\UCT\Electrical Engineering 4th Year\EEE4022S\Sample Data\Data_recordings\new_94,5MHz"


