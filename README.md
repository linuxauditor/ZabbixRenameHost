# ZabbixRenameHost

Using Zabbix v2.4 I ran into an issue where autodiscovery would add new hosts and name them by IP address.  The envoriment had about 400 remote hosts that needed to be monitored.  The idea of manually changing 400 hosts with their corrosponding IP addresses didn't sound like fun.

Furthermore, I was able to name the hosts based on the /24 subnet they were in which aids when scrolling through 400+ hosts.
