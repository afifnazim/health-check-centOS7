#!/bin/bash

echo;
echo "==============";
echo "------------";
echo "HOSTNAME"; hostname | egrep '<hostname of the machines>' --color=never;
echo "------------";
echo "Load";w |grep -i load --color=never; echo "------------"; ## Check current CPU Load
echo "DATE"; date;
echo "------------"; echo "DISK USE"; df -h |egrep -i 'root|mapper|boot|mnt\/' --color=never; echo "------------"; ## Check disk usage
echo "MEMORY USE"; free -h |egrep -i 'mem|total|used|free|available' --color=never; echo "------------"; ## Check memory usage
echo "DMESG"; dmesg -T |egrep -i 'total\ ram|starting\ in|processors\ activated|warn|error|fail|stop|start|Xeon|hotplug cpu|booting node' --color=never; echo "------------";
echo "Last Boot"; last |grep boot --color=never| head -10 ; echo "------------";
echo "tail messages"; tail -600000 /var/log/messages |egrep -i 'error|warn|fail|not' --color=never; echo "------------";
echo "tail cron"; tail /var/log/cron; echo "------------";    ## Cron logs
echo "tail apache error log"; tail /var/log/httpd/error_log; echo "------------";  ## Apache or httpd logs 
echo "tail apache access log"; tail /var/log/httpd/access_log; echo "------------";  ## Apache or httpd logs
echo "tail yum log"; tail /var/log/yum.log; echo "------------"; 
echo "apache status"; /bin/systemctl status httpd.service |grep -i active --color=never; echo "------------";
echo "apache configtest"; httpd -t; echo "------------";
echo "apache ssl pass dialog"; cat /usr/libexec/httpd-ssl-pass-dialog |grep Wal48ale --color=never; echo "------------";
echo "yum List Apache";yum list httpd |grep httpd. --color=never; echo "------------";
echo "cron status"; /bin/systemctl status crond.service |grep -i active --color=never; echo "------------";
echo "kernel version"; uname -r; echo "------------";
echo "yum List Kernel"; yum list kernel --color=never |egrep 'Installed|kernel'; echo "------------";
echo "OS Release version"; cat /etc/centos-release |grep release --color=never;echo;echo "------------";
echo "PHP version"; php -v; echo;echo "------------";
echo "Apache version"; httpd -v; echo;echo "------------";
