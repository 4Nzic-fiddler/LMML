function Test-Administrator {
  [OutputType([bool])]
  param()
  process {
    [Security.Principal.WindowsPrincipal]$user = [Security.Principal.WindowsIdentity]::GetCurrent();
    return $user.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator);
  }
}
if (-not (Test-Administrator)) {
  Write-Error "This script must be executed as Administrator."
  break
}
Write-Output "##################################################################################"
Write-Output "`n`Configuring Account Logon Category`n"
auditpol.exe /set /subcategory:"Credential Validation" /success:enable /failure:enable
auditpol.exe /set /subcategory:"Other Account Logon Events" /success:enable /failure:enable
auditpol.exe /set /subcategory:"Kerberos Service Ticket Operations" /success:enable /failure:enable
auditpol.exe /set /subcategory:"Kerberos Authentication Service" /success:enable /failure:enable
Write-Output "##################################################################################"
Write-Output "`nConfiguring Account Management Category`n"
auditpol.exe /set /category:"Account Management" /success:enable /failure:enable
Write-Output "##################################################################################"
Write-Output "`nConfiguring Detailed Tracking Category`n"
auditpol.exe /set /subcategory:"Process Creation" /success:enable /failure:enable
auditpol.exe /set /subcategory:"Process Termination" /success:enable /failure:enable
auditpol.exe /set /subcategory:"RPC Events" /success:enable /failure:enable
Write-Output "##################################################################################"
Write-Output "`nConfiguring DS Access Category`n"
auditpol.exe /set /subcategory:"Directory Service Changes" /success:enable /failure:enable
auditpol.exe /set /subcategory:"Directory Service Access" /success:enable /failure:enable
Write-Output "##################################################################################"
Write-Output "`nConfiguring Logon/Logoff Category`n" 
auditpol.exe /set /subcategory:"Account Lockout" /success:enable
auditpol.exe /set /subcategory:"Group Membership" /success:enable #Windows 10 only
auditpol.exe /set /subcategory:"Logoff" /success:enable
auditpol.exe /set /subcategory:"Network Policy Server" /success:enable /failure:enable
auditpol.exe /set /subcategory:"Other Logon/Logoff Events" /success:enable /failure:enable
auditpol.exe /set /subcategory:"Special Logon" /success:enable /failure:enable
Write-Output "##################################################################################"
Write-Output "`nConfiguring Object Access`n"
auditpol.exe /set /subcategory:"Application Generated" /success:enable /failure:enable
auditpol.exe /set /subcategory:"Certification Services" /success:enable /failure:enable
auditpol.exe /set /subcategory:"Detailed File Share" /success:enable
auditpol.exe /set /subcategory:"File Share" /success:enable /failure:enable
auditpol.exe /set /subcategory:"File System" /success:enable
auditpol.exe /set /subcategory:"Removable Storage" /success:enable /failure:enable
auditpol.exe /set /subcategory:"Registry" /success:enable
auditpol.exe /set /subcategory:"SAM" /success:enable
auditpol.exe /set /subcategory:"Other Object Access Events" /success:enable /failure:enable
auditpol.exe /set /subcategory:"Filtering Platform Connection" /success:enable /failure:enable
auditpol.exe /set /subcategory:"Filtering Platform Packet Drop" /success:enable 
Write-Output "##################################################################################"
Write-Output "`nConfiguring Policy Change Category`n"
auditpol.exe /set /subcategory:"Audit Policy Change" /success:enable /failure:enable
auditpol.exe /set /subcategory:"Authentication Policy Change" /success:enable /failure:enable
auditpol.exe /set /subcategory:"Authorization Policy Change" /success:enable /failure:enable
auditpol.exe /set /subcategory:"Filtering Platform Policy Change" /success:enable /failure:enable
Write-output "`nConfiguring Privlege Use Category`n"
auditpol.exe /set /subcategory:"Sensitive Privilege Use" /success:enable /failure:enable
Write-Output "##################################################################################"
Write-Output "`nConfiguring System Category`n"
auditpol.exe /set /subcategory:"IPsec Driver" /success:enable
auditpol.exe /set /subcategory:"Security State Change" /success:enable /failure:enable
auditpol.exe /set /subcategory:"Security System Extension" /success:enable /failure:enable
auditpol.exe /set /subcategory:"System Integrity" /success:enable /failure:enable
Write-Output "##################################################################################"
Write-Output "`nConfiguring Command Line Logging`n"
reg add "hklm\software\microsoft\windows\currentversion\policies\system\audit" /v ProcessCreationIncludeCmdLine_Enabled /t REG_DWORD /d 1
