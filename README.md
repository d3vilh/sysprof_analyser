SYSPROF Analyser
=================
Analyze SYSPROF V1.1 & V1.3 files and provides computational RAM usage statistics which can be exported to exel for building graphs.


  USAGE FOR GENERAL STATISTICS:
  -----------------------------

  Usage: `./sysprof_anal.sh "filename"`
```
  Example: ./sysprof_anal.sh sysprof_unitel_sdp_7a.log.sdp1_170730.sysprof
```
  FOR EXACT UNIT OR UNITTYPE:
  ---------------------------

  Usage: `./sysprof_anal.sh "filename" "SDP client"`
```
  Example: ./sysprof_anal.sh sysprof_unitel_sdp_7a.log.sdp1_170730.sysprof osa32
  Example: ./sysprof_anal.sh sysprof_unitel_sdp_7a.log.sdp1_170730.sysprof osa
```
  FOR UNIT LOCALHOST PROCESSES:
  -----------------------------

  Usage: `./sysprof_anal.sh "filename" "localhost" "local SDP process name"`
```
  Example: ./sysprof_anal.sh sysprof_unitel_sdp_7a.log.sdp1_170730.sysprof localhost sdsagent
```

```
MacBook-Pro-Philipp:Sysprof_analyse philipp$ ./sysprof_anal_func.sh SYSPROF.sdp1_190904.sysprof notif

Running for Sysprof version: 1.1

Memory consumption for notif:
HOSTNAME |0000 |0100 |0200 |0300 |0400 |0550 |0650 |0750 |0850 |0950 |1050 |1150 |1250 |1350 |1450 |     |     |     |     |     |     |     |     |
notif101 |12.8 |12.8 |12.8 |12.8 |12.8 |12.8 |12.8 |13.0 |13.0 |13.0 |13.0 |13.1 |13.1 |13.1 |13.1 |     |     |     |     |     |     |     |     |
notif102 |12.8 |12.8 |12.8 |12.8 |12.8 |12.9 |12.4 |12.4 |12.4 |12.4 |12.4 |12.4 |13.0 |13.0 |13.0 |     |     |     |     |     |     |     |     |
notif1   |12.4 |12.4 |12.4 |12.4 |12.4 |13.0 |13.0 |13.0 |13.0 |13.0 |13.0 |13.0 |13.0 |13.0 |13.0 |     |     |     |     |     |     |     |     |
notif2   |11.3 |11.3 |11.3 |11.3 |11.3 |11.7 |11.7 |11.7 |11.7 |11.7 |11.7 |11.7 |11.7 |11.7 |11.7 |     |     |     |     |     |     |     |     |
notif3   |11.7 |11.7 |11.7 |11.7 |11.7 |11.8 |11.8 |11.8 |11.8 |11.8 |11.8 |11.8 |11.8 |11.8 |11.8 |     |     |     |     |     |     |     |     |
notif4   |11.7 |11.7 |11.7 |11.7 |11.7 |11.8 |11.8 |11.8 |11.8 |11.8 |12.0 |12.0 |12.0 |12.0 |12.0 |     |     |     |     |     |     |     |     |
notif5   |11.8 |11.8 |11.8 |11.8 |11.8 |11.7 |11.7 |11.7 |11.7 |11.8 |11.8 |11.8 |11.8 |11.8 |11.8 |     |     |     |     |     |     |     |     |
notif6   |11.8 |11.8 |11.8 |11.8 |11.8 |11.8 |11.8 |11.8 |11.8 |11.8 |11.8 |11.8 |11.8 |11.8 |11.8 |     |     |     |     |     |     |     |     |
Execution time: 46 seconds

Total number of external SDP Clients connections for notif:
HOSTNAME |0000 |0100 |0200 |0300 |0400 |0550 |0650 |0750 |0850 |0950 |1050 |1150 |1250 |1350 |1450 |     |     |     |     |     |     |     |     |
notif101 |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |     |     |     |     |     |     |     |     |
notif102 |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |     |     |     |     |     |     |     |     |
notif1   |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |     |     |     |     |     |     |     |     |
notif2   |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |     |     |     |     |     |     |     |     |
notif3   |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |     |     |     |     |     |     |     |     |
notif4   |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |     |     |     |     |     |     |     |     |
notif5   |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |     |     |     |     |     |     |     |     |
notif6   |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |7    |     |     |     |     |     |     |     |     |
Execution time: 82 seconds

Summ of RAM consumption by all URE sessions from notif (in Megabytes).
HOSTNAME |0000 |0100 |0200 |0300 |0400 |0550 |0650 |0750 |0850 |0950 |1050 |1150 |1250 |1350 |1450 |     |     |     |     |     |     |     |     |
notif101 |83.9 |83.9 |83.9 |83.7 |83.7 |85.3 |85.3 |85.7 |85.8 |86.9 |86.9 |87   |87   |87   |87   |     |     |     |     |     |     |     |     |
notif102 |82.8 |82.8 |82.8 |82.8 |82.8 |83.6 |83.1 |83.1 |83.1 |83.3 |83.3 |83.3 |84.3 |84.3 |84.3 |     |     |     |     |     |     |     |     |
notif1   |78.9 |78.9 |78.9 |78.9 |78.9 |83.5 |83.5 |83.5 |83.5 |83.5 |83.5 |83.5 |83.5 |83.5 |83.5 |     |     |     |     |     |     |     |     |
notif2   |74   |74   |74   |74   |74   |81.9 |81.9 |81.9 |81.9 |81.9 |81.9 |81.9 |81.9 |81.9 |81.9 |     |     |     |     |     |     |     |     |
notif3   |79.7 |79.7 |79.7 |79.7 |79.7 |82   |82   |82.3 |82.3 |82.3 |82.3 |82.3 |82.3 |82.3 |82.3 |     |     |     |     |     |     |     |     |
notif4   |79.6 |79.6 |79.6 |79.6 |79.6 |82   |82   |82   |82   |82   |82.5 |82.5 |82.5 |82.5 |82.5 |     |     |     |     |     |     |     |     |
notif5   |80.2 |80.2 |80.2 |80.2 |80.2 |81.9 |81.9 |81.9 |81.9 |82.3 |82.3 |82.3 |82.3 |82.3 |82.3 |     |     |     |     |     |     |     |     |
notif6   |79.8 |79.8 |79.8 |79.8 |79.8 |82   |82   |82   |82   |82   |82.3 |82.3 |82.3 |82.3 |82.3 |     |     |     |     |     |     |     |     |
Execution time: 119 seconds
MacBook-Pro-Philipp:Sysprof_analyse philipp$
```

























Usage: 
------
``` shell
aix_load "hostname" _(based on your /etc/hosts)_
```

Example for single server:

``` shell
aix_load sdp7a
```

Example for multiple servers: 
``` shell
aix_load sdp
```

Legend:
-------

 * **HOST** - Server hostname
 * **EXEC TIME** - Server local time, when performance information was requested
 * **HW TYPE** - Server hardware type
 * **THREADS** - Number of virtual processors (CPU threads). Used for max IOWAIT and RUNQ cacluation
 * **RUNQ** - Shows the number of tasks executing and waiting for CPU resources. When this number exceeds the number of THREADS on the server - a CPU bottleneck exists
 * **BLKQ** - Shows the number of tasks blocked to execution. If this value is higher then 2 and RUNQ is high - you probably have problems
 * **CPU IDLE** - Server CPU idle cycles (Higher is better)
 * **CPU USER** - Server CPU users cycles (Lower is better)
 * **CPU SYSTEM** - Server CPU system cycles (Lower is better)
 * **COMP RAM** - Percentage of Server computational RAM (MAX alloved - 90)
 * **IOWAIT** - Percentage of time the CPU is idle AND there is, at least, one I/O in progress. Depends from performance of server's storage. Iowait more 25 - system is probably IO bound
 * **IS DISK LOAD** - Indicates current Server disks load status (Should be NO)
 * **LOADED DISKS** - Server most loaded discs. Shows diskname and tm_act percentage. Percent of time the device was active (we can see if disk load is balanced correctly or not, 1 used heavily others - not. 100 means disks always was busy when requested statistics. On some SDPs it can reach 260, bue to mirriring configuration.)

 Sample output:
 ---------------
``` shell
CELCO:[root@upm1 scripts]# aix_load sdp
HOST |EXEC TIME|HW TYPE|THREADS|RUNQ|BLKQ|CPU IDLE|CPU USER|CPU SYSTEM|COMP RAM|IOWAIT|IS DISK LOAD|LOADED DISKS                  
sdp1 |17:18:28 |POWER5 |16     |8   |1   |43      |41      |13        |74.8    |2.5   |NO          |NO LOADED DISKS               
sdp2 |17:18:31 |POWER7 |32     |5   |1   |49      |34      |12        |72.3    |1.8   |NO          |NO LOADED DISKS               
sdp3 |17:18:33 |POWER7 |32     |8   |1   |42      |40      |15        |75.0    |3.1   |NO          |NO LOADED DISKS               
sdp4 |17:18:35 |POWER5 |16     |5   |1   |30      |54      |14        |59.2    |1.0   |NO          |NO LOADED DISKS               
sdp5 |17:18:37 |POWER5 |16     |7   |1   |60      |28      |7         |71.4    |3.5   |NO          |NO LOADED DISKS               
sdp6 |17:18:41 |POWER5 |16     |7   |1   |47      |38      |13        |62.1    |2.8   |DISKS LOAD  |hdisk28 100.0,hdisk29 95.0,hdisk73 94.7,hdisk72 100.0,
sdp7 |17:18:43 |POWER5 |16     |7   |1   |55      |32      |7         |72.6    |4.9   |NO          |NO LOADED DISKS               
sdp8 |17:18:47 |POWER7 |32     |6   |1   |60      |27      |8         |72.8    |1.7   |NO          |NO LOADED DISKS 
CELCO:[root@upm1 scripts]# 
```