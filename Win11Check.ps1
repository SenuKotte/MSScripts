$Report = "" | Select-Object -Property "Computer Name", "Processor Speed (GHz)", "Number Of CPU Cores", "RAM Size(GB)", `
  "Free Disk Space (GB)", "TPM Version", "Firmware Type", "SecureBoot Enabled", "Graphics Resolution" #creates an empty reports
 $Report.'Computer Name' = $env:COMPUTERNAME
  $Report.'Processor Speed (GHz)' = $CurrentClockSpeed
  $Report.'Number Of CPU Cores' = $NumberOfCores
  $Report.'RAM Size(GB)' = $RAMSize
  $Report.'Free Disk Space (GB)' = $FreeSpace
  $Report.'Firmware Type' = $FirmwareType
  $Report.'SecureBoot Enabled' = $SecureBootState
  $Report.'TPM Version' = $TPMVersion
  $Report.'Graphics Resolution' = $GraphicsResolution
  #Generate report based on parameter entered by user
  If ($ExportToTextFile) {
     #"" | Out-File -FilePath $TextFileReportPath -NoNewline -Append
     "Your Computer's Specs:" | Out-File -FilePath $TextFileReportPath -Append
     "======================" | Out-File -FilePath $TextFileReportPath -Append -NoNewline 
     $Report | Out-File -FilePath $TextFileReportPath -Append
 }
 ElseIf ($PassThru) {
     Write-Host ""
     Write-Host "Your Computer's Specs:" 
     Write-Host "======================" -NoNewline
     $Report 
 #"" | Out-File -FilePath $TextFileReportPath -Append "Your Computer's Specs:" | Out-File -FilePath $TextFileReportPath -Append "======================" | Out-File -FilePath $TextFileReportPath -Append -NoNewline  $Report | Out-File -FilePath $TextFileReportPath -Append
 }
 Else {
 Write-Host ""
  Write-Host "Your Computer's Specs:" 
  Write-Host "======================" -NoNewline
  $Report 
 }
 #Windows 11 system requirements
  $Win11Report = "" | Select-Object -Property "Processor Speed (GHz)", "Number Of CPU Cores", "RAM Size(GB)", `
  "Free Disk Space (GB)", "TPM Version", "Firmware Type", "SecureBoot Enabled", "Graphics Resolution"
 $Win11Report.'Processor Speed (GHz)' = "1"
  $Win11Report.'Number Of CPU Cores' = "2"
  $Win11Report.'RAM Size(GB)' = "4"
  $Win11Report.'Free Disk Space (GB)' = "64"
  $Win11Report.'Firmware Type' = "UEFI"
  $Win11Report.'SecureBoot Enabled' = "True"
  $Win11Report.'TPM Version' = "2.0"
  $Win11Report.'Graphics Resolution' = "720"
  #Write-Host "Windows 11 System Requirements:"
  #Write-Host "" 
 If ($ExportToTextFile) {
     #"" | Out-File -FilePath $TextFileReportPath -Append
     "Windows 11 System Requirements:" | Out-File -FilePath $TextFileReportPath -Append
     "==============================" | Out-File -FilePath $TextFileReportPath -Append -NoNewline
     $Win11Report | Out-File -FilePath $TextFileReportPath -Append
 }
 ElseIf ($PassThru) {
     Write-Host ""
     Write-Host "Windows 11 System Requirements:" 
     Write-Host "==============================="
     Write-Host "                               "
     $Win11Report
 #"" | Out-File -FilePath $TextFileReportPath -Append "Windows 11 System Requirements:" | Out-File -FilePath $TextFileReportPath -Append  "==============================" | Out-File -FilePath $TextFileReportPath -Append -NoNewline  $Win11Report | Out-File -FilePath $TextFileReportPath -Append
 }
 Else {
 Write-Host ""
  Write-Host "Windows 11 System Requirements:" 
  Write-Host "==============================="
  Write-Host "                               "
  $Win11Report
 }
 #Create a final report that compares both specs
  #System Compatibility Checker Report
 $CompReport = "" | Select-Object -Property "Computer Name", "Processor Speed (GHz)", "Number Of CPU Cores", "RAM Size(GB)", `
  "Free Disk Space (GB)", "TPM Version", "Firmware Type", "SecureBoot Enabled", "Graphics Resolution"
 $CompReport.'Computer Name' = $env:COMPUTERNAME
  $CompReport.'Processor Speed (GHz)' = IF ($Report.'Processor Speed (GHz)' -ge $Win11Report.'Processor Speed (GHz)') {"Pass"} Else {"Fail"}
  $CompReport.'Number Of CPU Cores' = IF ($Report.'Number Of CPU Cores' -ge $Win11Report.'Number Of CPU Cores') {"Pass"} Else {"Fail"}
  $CompReport.'RAM Size(GB)' = IF ($Report.'RAM Size(GB)' -ge $Win11Report.'RAM Size(GB)') {"Pass"} Else {"Fail"}
  $CompReport.'Free Disk Space (GB)' = IF ($Report.'Free Disk Space (GB)' -ge $Win11Report.'Free Disk Space (GB)') {"Pass"} Else {"Fail"}
  $CompReport.'Firmware Type' = IF ($Report.'Firmware Type' -eq $Win11Report.'Firmware Type') {"Pass"} Else {"Fail"}
  $CompReport.'SecureBoot Enabled' = IF ($Report.'SecureBoot Enabled' -eq $Win11Report.'SecureBoot Enabled') {"Pass"} Else {"Fail"}
  $CompReport.'TPM Version' = IF ($Report.'TPM Version' -ge $Win11Report.'TPM Version') {"Pass"} Else {"Fail"} 
  $CompReport.'Graphics Resolution' = IF ($Report.'Graphics Resolution' -ge $Win11Report.'Graphics Resolution') {"Pass"} Else {"Fail"} 
 #Write-Host "Windows 11 Compatibility Checker Report:"
  #Write-Host "" 
  #$CompReport
 If ($ExportToTextFile) {
     #"" | Out-File -FilePath $TextFileReportPath -Append
     "Windows 11 Compatibility Checker Report:" | Out-File -FilePath $TextFileReportPath -Append
     "========================================" | Out-File -FilePath $TextFileReportPath -Append -NoNewline
     $CompReport | Out-File -FilePath $TextFileReportPath -Append
     Write-Host "Your report has been saved in $TextFileReportPath"
  }
 ElseIf ($PassThru) {
     Write-Host ""
     Write-Host "Windows 11 Compatibility Checker Report:" 
     Write-Host "======================================="
     Write-Host "                               "
     $CompReport
 #"" | Out-File -FilePath $TextFileReportPath -Append "Windows 11 Compatibility Checker Report:" | Out-File -FilePath $TextFileReportPath -Append "========================================" | Out-File -FilePath $TextFileReportPath -Append -NoNewline $CompReport | Out-File -FilePath $TextFileReportPath -Append Write-Host "Your report has also been saved in $TextFileReportPath"
 }
 Else {
 Write-Host ""
  Write-Host "Windows 11 Compatibility Checker Report:" 
  Write-Host "======================================="
  Write-Host "                               "
  $CompReport
 }
 
 # Source : https://www.itechguides.com/windows-11-compatibility-checker/
