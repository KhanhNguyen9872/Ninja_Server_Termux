#!/usr/bin/env bash

option="${1}" 
case ${option} in 
   --start) 
	   if ps -C httpd >/dev/null; then
		   echo "MySQL is still running...."
	   else
			httpd &> /dev/null
			mysqld --skip-grant-tables --general-log &> /dev/null
	   fi
      ;; 
   --stop)
	   killall httpd
	   killall mysqld &> /dev/null
	   killall /data/data/com.termux/files/usr/bin/mariadbd &> /dev/null
	   killall mysqld_safe &> /dev/null
      ;;
   *)  
      printf "\nCOMMAND: sql [ARGURMENT]\n\n"
      printf "  --start [Start MySQL]\n"
      printf "  --stop  [Stop MySQL]\n\n"
      exit 1
      ;; 
esac
#ib_logfile0
