#!/bin/bash

US=$(df -BM | grep /dev/mapper | awk '{us += $3} END {print us}')
TS=$(df -BG | grep /dev/mapper |sda1' | awk '{ts += $2} END {print ts "Gb"}')
PS=$(df -BM | grep '/mapper' | awk '{us += $3} {ts += $2} END {printf("(%d%%)\n", us/ts*100)}')
wall "
	#Architecture:	$(uname -a)
	#CPU physical: $(lscpu | grep "Socket(s)" | awk '{print $2}')
	#vCPU: $(lscpu | grep "^CPU(s)" | awk '{print $2}')
	#Memory usage: $(free -m | grep "Mem:" | awk '{printf("%d/%dMB (%.2f%%)",$3, $2, ($3/$2)*100)}')
	#Disk Usage:	$US/$TS  $PS
	#CPU Load:	$(vmstat 1 2 | awk 'NR==4 {printf("%.2f%%",100-$15)}')
	#Last boot:	$(who -b | awk '{print $3, $4}')
	#LVM use:	$(lsblk | grep -q "lvm" && echo "yes" || echo "no")
	#Connections TCP: $(ss -tH state established | wc -l) "ESTABLISHED" 
	#User log:	$(users | tr ' ' '\n' | uniq | wc -l)
	#Network:	$(hostname -I | awk '{print $1}') $(ip link | grep "link/ether" | awk '{printf("("$2")")}') 
	#Sudo:		$(journalctl | grep sudo | grep COMMAND | wc -l) cmd
"
