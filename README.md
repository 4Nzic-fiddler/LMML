# Circle City Con 8.0 Training: LMML
Repository of resources for the "Less Money, More Lab" class at CircleCityCon 8.0

## Meron's How to Setup a Lab Blog:
https://blacklionm.medium.com/my-journey-how-to-setup-a-new-lab-environment-275de32d91b1

## Some handy audit policies to gather more in your Windows event logs:
* https://github.com/4Nzic-fiddler/LMML/blob/main/set_windows_audit_policies.ps1

## Sysmon download and reference documentation from Microsoft
https://docs.microsoft.com/en-us/sysinternals/downloads/sysmon

Example sysmon config:
https://github.com/4Nzic-fiddler/LMML/blob/main/sysmon_config.xml

Olaf Hartong's Sysmon Modular:
https://github.com/olafhartong/sysmon-modular

Binary Defense Sysmon Modular (by @thehack3r4chan)
https://github.com/BinaryDefense/sysmon-modular

## Ideas for Purple Team scenarios to run:
* Scythe Community threat plans: https://github.com/scythe-io/community-threats

## KQL Learning Resources
* ~~https://security-tzu.com/2020/08/07/become-a-kql-ninja/~~ (sadly, the server is down now)
* https://github.com/secgroundzero/KQL_Reference_Manual


## Custom Sysmon Function for your Sentinel
This makes it much easier to write KQL queries for Sentinel data
* https://github.com/4Nzic-fiddler/LMML/blob/main/Sentinel_sysmon_custom_function.kql.txt

## Saved Queries for Threat Hunting
This has just a few example threat hunting queries to get started with. There are many more...
https://raw.githubusercontent.com/4Nzic-fiddler/LMML/main/Sentinel_Hunting_Queries_Example.kql.txt




## Azure Sentinel shared access - lets other lab members query the events in your Sentinel
Allow Delegated Access to the LMML Class Group to have Azure Sentinel Contributor role in your Log Analytics Workspace:
[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2F4Nzic-fiddler%2FLMML%2Fmain%2FAzureLighthouseARM-BD-APO.json)
