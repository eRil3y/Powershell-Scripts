# Powershell-Scripts
Repo to hold useful powershell scripts I have made and want to keep or improve upon.

Diff.ps1:
-Script compares two text files, finds the reference object (<=) not found in the difference object (=>) and writes the differences to an output text file. Used to compare any kind of lists (IP's, users, hostnames, IOC lists, ACL's, application whitelists, etc.)

deleteADcomputers.ps1:
-Takes a list of domain computer names and deletes the entries out of Active Directory. Be sure to read the comments before running. Used it to clean up old entries of systems that weren't around anymore but were never deleted out of AD.

ESXIUptime.ps1:
- Script to pull the uptime of ESXI hosts.

extract_ip.ps1:
- Script to extract IP addresses from cyber threat intel reports, emails, etc. I would eventually like to build it out to extract other IOC's like hashes, emails, domains.

VMPowerState.ps1:
- Script to connect to a vCenter server and check the Power State and VLAN of a list of VM's. Read the comments before running.
