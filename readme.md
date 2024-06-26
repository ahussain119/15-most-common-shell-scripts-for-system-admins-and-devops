# 15 commonly used shell scripts by system admins and DevOps
In this repository I have written 15 commonly used scripts by system admins and devops engineers

1. `cpuHealth` will show you current health of the system.
![cpuHealth](./photos/cpuHealth.png)

2. `useradd.sh` will create a new using initial of the username in the format y0z0xxx if name is yhaya zia and xxx are random letters, with a random password that user will reset on first login.
![useradd.sh](./photos/useradd.png)

3. `delUser.sh` will delete with the initials matching the first four letters to the argument.
![delUser.sh](./photos/delUser.png)

4. `makearchive.sh` will create backup of directory selected in '~/backups'.
![makearchive.sh](./photos/makearchive.png)

5. `netReport.sh` will show current IP address, Default gatewaya and DNS server.
![netReport.sh](./photos/netReport.png)

6. `rsync.sh` will take two directory paths as arguments and synchronizes the contents of two directories.
![rsync.sh](./photos/rsync.png)

7. `count.sh` will take directory path as argument and count the number of files in it.
![count.sh](./photos/count.png)

8. `MonitorSystem.sh` will monitor the system resources and notify in the commandline if thresholds are hit.
![MonitorSystem.sh](./photos/MonitorSystem.png)

9. `password.sh` will store and retrieve passwords using openssl, WARNING: NOT RECOMMENDED TO USE.
![password.sh](./photos/password.png)

10. `analysisLog.sh` will analyze the apache2 Logs for errors and warnings in real-time.
![analysisLog.sh](./photos/analysisLog.png)

11. `installservice.sh` will install a service and start it.
![installservice.sh](./photos/installservice.png)

12. `ServiceStatus.sh` will check the status of the services and restart if not active.
![ServiceStatus.sh](./photos/ServiceStatus.png)

13. `storageCleanup.png` will clean up the system logs and temporary files.
![storageCleanup.sh](./photos/storageCleanup.png)

14. `app2multiserver.sh` will deploy an application to multiple servers.

15. `dbbackups.sh` will create backups of mysql databases.
