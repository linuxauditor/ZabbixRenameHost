# ZabbixRenameHost

Tested with v2.4.8

Using Zabbix v2.4 I ran into an issue where autodiscovery would add new hosts and name them by IP address.  The envoriment had about 400 remote hosts that needed to be monitored.  The idea of manually changing 400 hosts with their corrosponding IP addresses didn't sound like fun.  Hostnames are discovered through SNMP.  This script is very light on resources after the first time it is run.  I have set this to run hourly through cron.  When new hosts are added to the network, SNMP has to be configured correctly and it is automatically added to Zabbix and renamed correctly with no intervention.

Furthermore, I was able to name the hosts based on the /24 subnet they were in which aids when scrolling through 400+ hosts.
