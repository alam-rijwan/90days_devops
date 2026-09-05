# RUNBOOK for ssh service

### This runbook provides quick troubleshooting steps if the SSH service goes down.

## Environment basics

* Command : `uname -a`

  Output : `Linux linux 6.17.0-35-generic #35~24.04.1-Ubuntu SMP PREEMPT_DYNAMIC Tue May 26 19:30:42 UTC 2 x86_64 x86_64 x86_64 GNU/Linux`

  Observation : Kernel version and architecture confirmed.

* Command : `cat /etc/os-release`

  Output : `PRETTY_NAME="Ubuntu 24.04.4 LTS"
     `NAME="Ubuntu"`
     `VERSION_ID="24.04"`
     `VERSION="24.04.4 LTS (Noble Numbat)"`
     `VERSION_CODENAME=noble`
     `ID=ubuntu`
     `ID_LIKE=debian`

          
  Observation : Confirms distribution and release version.

## Filesystem sanity

* Command : `mkdir /tmp/runbook-demo`
  
  Observation : Directory created successfully.

* Command : `cp /etc/hosts /tmp/runbook-demo/hosts-copy && ls -l /tmp/runbook-demo`
  
  Observation : Copied the files from /etc/hosts. Filesystem is writable.

## CPU / Memory 

* Command : `ps -o pid,pcpu,pmem,comm -p $(pidof sshd)`

  Output : `PID %CPU %MEM COMMAND`
           `9448  0.0  0.0 sshd`
 

  Observation : Process running and CPU & Memory usage is negligible.

* Command : `free -h`

  Output : `Total: 30G, Used: 3.8G, Available: 27G`

  
  Observation : Sufficient memory available.
  
## Disk / IO 

* Command : `df -h`

  Output : `/dev/nvme0n1p2     468G   35G  410G   8% / `
  
  Observation : Root partition more than 90% available.

* Command : `iostat`
  
  Observation : avg-cpu:  %user   %nice %system %iowait  %steal   %idle
                         0.87      0.01   0.41   0.03     0.00    98.68


  
## Network

* Command : `sudo ss -tulpn | grep  sshd`

  Output : `tcp   LISTEN 0      4096         0.0.0.0:22         0.0.0.0:*    users:(("sshd",pid=9359,fd=3),("systemd",pid=1,fd=163))
`

  Observation : ssh is listening on port 22.

* Command : `nc -zv localhost 22`

  Output : `Connection to localhost (127.0.0.1) 22 port [tcp/ssh] succeeded!`
  
  Observation : Connection confirmed.
 
## Logs

* Command : `journalctl -u ssh -n 50`
  
  Observation : Last 50 lines shows normal authentication attempts no errors or warnings.

* Command :`tail -n 50 /var/log/auth.log `
  
  Observation : Recent login attempts record. No suspicious activity detected.
  

## Quick review
- ssh service running normally with low CPU usage
- Disk and logs size is healthy
- Network port 22 is open and serving connections.
- No errors in logs.

## If this worsens
- Check logs again 
- Check CPU usage/Disk usage
- Restart service
- Check if port is used by other service

