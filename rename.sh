#!/bin/bash
##Script to rename hosts in Zabbix to retrieved SNMP value.  August 2017##
##This is pretty dirty but it should work without needing to be touched##

#Connects to Zabbix backend, queries for all Hosts that have a name in Zabbix starting with 10.%  This output is piped to read line

mysql --connect_timeout 10 zabbix -u foo --password=foo --skip-column-names -B -e "SELECT host FROM hosts WHERE host like '10.%';" | while read line
do
ip=$line

#getting and setting actual name of host
x=$(snmpwalk -Ou -Oq -Ov -v1 -c foo $ip system.sysName.0)

#Hosts are named according to the subnet that they are in.  This just parses out the 3rd octet and sets it as a variable
subnet=$(echo $ip | awk -F. '{print $3}')

#full name is set here. This will be shown in Zabbix
name=$(echo "."$subnet" "$x)

#Sets the "host" and "name" value for the row that needed to be changed. 
mysql --connect_timeout 10 zabbix -u zabbix --password=zabbix --skip-column-names -B -e "UPDATE 
hosts SET name = '$name', host = '$name' WHERE host like '$ip'";

done
