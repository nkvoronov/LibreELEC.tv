#!/bin/sh
# systeminfo.sh: external data collection script
# This file belongs to the VDR plugin systeminfo
#
# See the main source file 'systeminfo.c' for copyright information and
# how to reach the author.
#
# $Id$
#
# possible output formats:
# (blanks around tabs only for better reading)
# 1)   Name \t Value         	displays Name and Value
# 2)   Name \t Value1 \t Value2 displays Name, Value1 and Value2
# 3)   Name \t total used       displays an additional progress bar (percentage) after the values
# 4)   s \t Name \t ...         defines a static value, this line is only requested during the first cycle
#
# special keywords (they are replaced by the plugin with the actual value):
#      CPU%    CPU usage in percent
#
# test with: for i in $(seq 1 16); do systeminfo.sh $i;echo;done
#

PATH=/usr/bin:/bin:/sbin

case "$1" in
	1)	# kernel version (static)
		KERNEL=$(uname -rm)
		echo -ne "s\tLinux Kernel:\t"$KERNEL
        	;;

	2)	# distribution release (static)
		if test -f /etc/distribution; then
			DISTRI="OpenELEC("$(head -n 1 /etc/build)")"
			RELEASE=$(head -n 1 /etc/version)
			ARCH=$(head -n 1 /etc/arch)
		else
			DISTRI="unknown"
			RELEASE="unknow"
			ARCH="unknow"
		fi
        echo -ne "s\tDistribution:\t"$DISTRI"   Version: "$RELEASE"   Arch: "$ARCH
		exit
        	;;

	3)	# CPU type (static)
		CPUTYPE=$(grep 'model name' /proc/cpuinfo | cut -d':' -f 2  | cut -d' ' -f2- | uniq)
		echo -ne "s\tCPU Type:\t"$CPUTYPE
        	;;

	4)	# current CPU speed
                VAR=$(awk '/cpu MHz/ {a=$NF} ; END { printf("%d MHz\n",a) }' /proc/cpuinfo)
		echo -ne "CPU speed:\t"$VAR
		exit
        	;;        	

    5)	# current Display resolution
		D_RES=$(xrandr |grep " connected"| awk '{print $3}'| sed s/+.*//)
		echo -ne "Display resolution:\t"$D_RES
		exit
        	;;

	6)	# hostname and IP (static)
		hostname=$(hostname)
		dnsname=$(dnsdomainname)
		IP=$(ifconfig eth0 | grep inet | cut -d: -f2 | cut -d' ' -f1)
		echo -ne "s\tHostname:\t"${hostname:-<unknown>}"."${dnsname:-<unknown>}"\tIP: "${IP:-N/A}
		exit
        	;;

	7)	# fan speeds
		CPU=$(sensors | grep -i 'fan1' | tr -s ' ' | cut -d' ' -f 2)
		CASE1=$(sensors | grep -i 'fan2' | tr -s ' ' | cut -d' ' -f 2)
                CASE2=$(sensors | grep -i 'fan3' | tr -s ' ' | cut -d' ' -f 2)
		echo -ne "Fans:\tCPU: "$CPU" rpm  Case1: "$CASE1" rpm  Case2: "$CASE2" rpm "
		exit
        	;;

	8)	# temperature of CPU and mainboard
		CPU=$(sensors | grep -m1 'temp1' | tr -s ' ' | cut -b 9-15)
		MB=$(sensors | grep -m1 'temp2' | tr -s ' ' | cut -b 9-15)
		GPU=$(gputemp)
		echo -ne "Temperatures:\tCPU: "$CPU"    MB: "$MB"       GPU: "$GPU
		exit
        	;;
        
	9)	# temperature of hard disks
		DISK1=`/usr/bin/hddtemp --unit=C /dev/sda | cut -d: -f1,3`
		DISK2=`/usr/bin/hddtemp --unit=C /dev/sdb | cut -d: -f1,3`
        echo -ne "s\tDisks:\t"$DISK1"\t"$DISK2
		exit
        ;;

	10)	# time and uptime
        TIME=$( echo `uptime` | awk '{ print $1 }' )
        UPTIME=$( echo `uptime` | sed 's/,/ /' | cut -d' ' -f3,4,6 )
		echo -ne "Time:\t"$TIME"\tUptime: "$UPTIME
		exit
        ;;

	11)	# header (static)
		echo -ne "s\t\ttotal / free"
		exit
		;;

	12)	# video disk usage
		VAR=$(df -Pk /storage/videos | tail -n 1 | tr -s ' ' | cut -d' ' -f 2,4)
		echo -ne "Video Disk:\t"$VAR
		exit
        ;;

	13)	# memory usage
		VAR=$( grep -E 'MemTotal|MemFree' /proc/meminfo | cut -d: -f2 | tr -d ' ')
		echo -ne "Memory:\t"$VAR
		exit
        ;;

	14)	# swap usage
		VAR=$(grep -E 'SwapTotal|SwapFree' /proc/meminfo | cut -d: -f2 | tr -d ' ')
		echo -ne "Swap:\t"$VAR
		exit
        ;;

	test)
		echo ""
		echo "Usage: systeminfo.sh {1|2|3|4|...}"
		echo ""
		exit 1
		;;
esac
exit
