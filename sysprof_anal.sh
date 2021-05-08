#!/bin/bash
# SYSPROF ANALYZER V.1.0 by Philipp Shilov 06.11.2018
# prev day from SDP:  ./sysp_an.sh `ls -lrt *.sysprof | tail -2 |head -1 | awk '{print $9}'` dslu
bold=$(tput bold); blue=$(tput setaf 4); normal=$(tput sgr0); black=$(tput setaf 0); red=$(tput setaf 1); green=$(tput setaf 2); yellow=$(tput setaf 3); lime_yellow=$(tput setaf 190); powder_blue=$(tput setaf 153); magenta=$(tput setaf 5); cyan=$(tput setaf 6); white=$(tput setaf 7); bright=$(tput bold); blink=$(tput blink); reverse=$(tput smso); underline=$(tput smul);
function help_me_please {
  printf "\nAnalyse ${lime_yellow}${bold}SYSPROF V1.1 & V1.3${normal} files and provides computational RAM usage statistics which can be exported to exel for building graphs.\n
  ${bold}${lime_yellow}FOR GENERAL STATISTICS:${normal}\n
  ${powder_blue}Usage:${normal} ./sysprof_anal.sh \042filename\042 \n
  ${powder_blue}Example:${normal} ${bold}./sysprof_anal.sh sysprof_unitel_sdp_7a.log.sdp1_170730.sysprof ${normal}\n
  ${bold}${lime_yellow}FOR EXACT UNIT OR UNITTYPE:${normal}\n
  ${powder_blue}Usage:${normal} ./sysprof_anal.sh \042filename\042 \042SDP client\042 \n
  ${powder_blue}Example:${normal} ${bold}./sysprof_anal.sh sysprof_unitel_sdp_7a.log.sdp1_170730.sysprof osa32 ${normal}
  ${powder_blue}Example:${normal} ${bold}./sysprof_anal.sh sysprof_unitel_sdp_7a.log.sdp1_170730.sysprof osa ${normal}\n
  ${bold}${lime_yellow}FOR UNIT LOCALHOST PROCESSES:${normal}\n
  ${powder_blue}Usage:${normal} ./sysprof_anal.sh \042filename\042 \042localhost\042 \042local SDP process name\042 \n
  ${powder_blue}Example:${normal} ${bold}./sysprof_anal.sh sysprof_unitel_sdp_7a.log.sdp1_170730.sysprof localhost sdsagent ${normal}\n\n"
}
if [ ! -n "$1" ]; then help_me_please; exit; fi; #Help information

######################
#  VARS SET BY USER  #  VERIFY and set this BEFORE RUNNING SCRIPT.
######################
sysprof_version=1.1 #YOUR SYSPROF VERSION 1.1 or 1.3.
client_names="osa dslu slu eci notif ofr sapi ajms feadmin sdp" #SDP clients pattern. For func. gen_stat_get()
local_processes="sdsagent /ure java tsp nsrexecd nsrmmdbd nsrjb clstrmgr nmon topasrec arc gzip /DWH"

######################
#   INTERNAL VARS    #  Dont edit this vars
######################
start=`date +%s`;                                      #start time for benchmark (func. print_bench)
file_init=$1;                                          #1st argument
exact_unit=$2;                                         #2nd argument
exact_local_process=$3;                                #3rd argument
file=/tmp/megafile                                     #temp file with all data
file_l=/tmp/megafile_local                             #temp file with localhost processes
filedate=20`printf $file_init | rev |cut -c9-14 | rev` #getting full filedate from the sysprof file name. i.e. 20190904
if [ $sysprof_version = "1.1" ]; then
	printf "\nRunning for Sysprof version: ${bold}${lime_yellow}1.1${normal}\n"; 
	cat $file_init| grep oraclemain |awk -F '|' '{print $1"|"$7"|"$3}'|grep -v "||" > /tmp/megafile
	cat $file_init| grep -v oraclemain| awk -F '|' '{print $1"|"$6"|"$3}'|grep -v "||" | grep -v localhost > /tmp/megafile_local
else
	printf "\nRunning for Sysprof version: ${bold}${lime_yellow}1.3${normal}\n";
	cat $file_init| awk -F '|' '{print $1"|"$10"|"$6}'|grep -v "||" | grep -v localhost > /tmp/megafile.txt
	cat $file_init| grep localhost| awk -F '|' '{print $1"|"$9"|"$6}'|grep -v "||" | grep -v localhost > /tmp/megafile_local.txt
fi;

# Array with full timeline from 0000 to 2355:
	unset array_full    
	array_full=(`cat $file | awk -F '|' '{ print $1; }' | rev | cut -c 1-4 | rev |uniq`)
	# Getting every 12th element (0000,0100,0200,0300 etc.) to new array (every hour):
	unset array_hours
		for((n=0;n<${#array_full[@]};n++)); do
		        if (( $(($n % 12 )) == 0 )); then
		        	array_hours+=(${array_full[$n]})
		        fi
		done

#####################
#   ALL FUNCTIONS   #
#####################
function print_header {  #Print first report table row with hostname and hours
	printf "%-9s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s\n" "HOSTNAME" `for every_hour in "${array_hours[@]}"; do echo ""$every_hour""; done`;
}
function print_bench {  #Dispaly exectution benchmark in seconds
	printf "Execution time: $((($(date +%s)-$start))) seconds\n";
}
function gen_stat_get {  #If arguments for unittype ($2 aka $exact_unit) is passed.
	print_header
	unset array_units; 
	filef="$file$3" #/tmp/megafile or /tmp/megafile_local
	# Sorting out the most consumed ure sessions and finding top 10 units from this sorted list, then gets first unit from this ten.
	for units in $1; do
		array_units=( $(grep $units $filef | awk -F '|' '{print $3,$2}' | sort -n | awk '!seen[$0]++' | tail -10 -r |awk '{print $2}'| awk '!seen[$0]++' | head -1) );
			for every_unit in "${array_units[@]}"; do
				if [ ! -z "$every_unit" ]; then 																										#awk ‘{print $(NF)}’
					printf "%-9s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s\n" `echo $every_unit | awk -F "/" '{print $NF}'|cut -c1-9` `for every_hour in "${array_hours[@]}"; do     
					echo "$(eval "grep $units $filef |grep $filedate$every_hour|grep $every_unit |"$2)"; done`;
				fi;
			done;
	done
	print_bench
}
function exact_unit_stat_get {  #If arguments for unittype ($2 aka $exact_unit) was not passed.
	print_header
	unset list_to_check;
	list_to_check=( $(grep $exact_unit $file | awk -F '|' '{print "|"$2"|"}' | sort -n | awk '!seen[$0]++'| tr '\n' ' ') );
		for every_exact_unit in "${list_to_check[@]}"; do
				if [ ! -z "$exact_unit" ]; then 
					printf "%-9s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s|%-5s\n" `echo "$every_exact_unit"| tr -d '|'` `for every_hour in "${array_hours[@]}"; do 
					echo "$(eval "grep '$every_exact_unit' $file |grep $filedate$every_hour |"$1)"; done`;
				fi;
		done;
	print_bench
}

#######################
#  GENERAL EXECUTION  #
#######################
if [ ! -n "$2" ]; then  #If arguments for unittype ($2 aka $exact_unit) not passed.
	printf "\n${bold}${lime_yellow}Maximum Comp RAM consumption (hourly) by Single URE session for the most heavy loaded SDP Clients (in Megabytes).${normal}\n";
	printf "${bold}${powder_blue}HINT:${normal} ${powder_blue}Average URE session should not consume more than 18Mb RAM.${normal}\n\n";
			gen_stat_get echo"($client_names)" "awk -F '|' '{print \$3}'|cut -c1-5|sort -n|tail -1|tr -d ' '|tr -d '\n'"

	printf "\n${bold}${lime_yellow}Total number of external SDP Clients connections by unittype (in sessions):${normal}\n";
			gen_stat_get echo"($client_names)" "wc -l |tr -d ' '|tr -d '\n'"
	
	printf "\n${bold}${lime_yellow}Summ of RAM consumption by all URE sessions from single SDP Client(in Megabytes). For top RAM consumenrs only.${normal}\n";
			gen_stat_get echo"($client_names)" "awk -F '|' '{total += \$3} END {print total}'|cut -c1-5|tr -d ' '"

	printf "\n${bold}${lime_yellow}Total memory consumption by internal SDP process (in Megabytes):${normal}\n";
			gen_stat_get echo"($local_processes)" "awk -F '|' '{total += \$3} END {print total}'|cut -c1-5|tr -d ' '" "_local"
else
	if [ ! -n "$exact_local_process" ]; then #If arguments for unittype ($2 aka $exact_unit) is passed.
		printf "\n${bold}${lime_yellow}Memory consumption for $exact_unit:${normal}\n"; 
        exact_unit_stat_get "awk -F '|' '{print \$3}'|cut -c1-5|sort -n|tail -1|tr -d ' '|tr -d '\n'" 

		printf "\n${bold}${lime_yellow}Total number of external SDP Clients connections for $exact_unit:${normal}\n";
		exact_unit_stat_get "wc -l |tr -d ' '|tr -d '\n'" 
	
		printf "\n${bold}${lime_yellow}Summ of RAM consumption by all URE sessions from $exact_unit (in Megabytes).${normal}\n";
		exact_unit_stat_get "awk -F '|' '{total += \$3} END {print total}'|cut -c1-5|tr -d ' '" 
	
	else
	#FOR UNIT LOCALHOST PROCESSES. TBD.
		printf "\n${bold}${lime_yellow}Memory consumption by $exact_local_process@localhost:${normal} DOESNT WORK :(\n"; 
		printf "${bold}${powder_blue}HINT: ${powder_blue}sdsagent /ure java tsp nsrexecd nsrmmdbd clstrmgr nmon topasrec arc gzip /DWH ${normal}\n\n";
		print_bench
	fi; 
fi;
#Removing temp files
yes | rm /tmp/megafile
yes | rm /tmp/megafile_local
#EOF