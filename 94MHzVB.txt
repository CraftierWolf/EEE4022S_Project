'Input Excel File's Full Path
  ExcelFilePath = "C:\Users\ZUBAIR\Documents\University\UCT\Electrical Engineering 4th Year\EEE4022S\Sample Data\94MHz_RSSI.xlsm"

'Input Module/Macro name within the Excel File
  MacroPath1 = "Module1.InsertRSSIdata"
MacroPath2 = "Module2.getWeatherRx"
MacroPath3 = "Module3.getWeatherHx"
MacroPath4 = "Module4.getWeatherTx"

'Create an instance of Excel
  Set ExcelApp = CreateObject("Excel.Application")

'Do you want this Excel instance to be visible?
  ExcelApp.Visible = True  'or "False"

'Prevent any App Launch Alerts (ie Update External Links)
  ExcelApp.DisplayAlerts = False

'Open Excel File
  Set wb = ExcelApp.Workbooks.Open(ExcelFilePath)

'Execute Macro Code
  
ExcelApp.Run MacroPath2
ExcelApp.Run MacroPath3
ExcelApp.Run MacroPath4
ExcelApp.Run MacroPath1

'Save Excel File (if applicable)
  wb.Save

'Reset Display Alerts Before Closing
  ExcelApp.DisplayAlerts = True

'Close Excel File
  wb.Close

'End instance of Excel
  ExcelApp.Quit

'Leaves an onscreen message!
  'MsgBox "Your Automated Task successfully ran at " & TimeValue(Now), vbInformation