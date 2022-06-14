# Blue Team: Summary of Operations

## Table of Contents
- Network Topology
- Description of Targets
- Monitoring the Targets
- Patterns of Traffic & Behavior

### Network Topology

The following machines were identified on the network:
- Target 1
  - **Operating System**: Debian GNU/Linux 8
  - **Purpose**: Wordpress server
  - **IP Address**: 192.168.110
- Target 2
  - **Operating System**: Debian GNU/Linux 8
  - **Purpose**: Wordpress server
  - **IP Address**: 192.168.1.115
- ELK
  - **Operating System**: Ubuntu 18.04.4 LTS
  - **Purpose**: ELK stack for log management
  - **IP Address**: 192.168.1.100
- Capstone
  - **Operating System**: Ubuntu 18.04.1 LTS
  - **Purpose**: Filebeat and Metricbeat sends logs to ELK
  - **IP Address**: 192.168.1.105
- Kali
  - **Operating System**: Kali Linux
  - **Purpose**: Machine for pen testing
  - **IP Address**: 192.168.1.90

### Description of Targets

The target of this attack was: `Target 1` (192.168.1.110).

Target 1 is an Apache web server and has SSH enabled, so ports 80 and 22 are possible ports of entry for attackers. As such, the following alerts have been implemented:

### Monitoring the Targets

Traffic to these services should be carefully monitored. To this end, we have implemented the alerts below:

#### Excessive HTTP Errors
Excessive HTTP Errors is implemented as follows:
  - **Metric**: http.response.status_code
  - **Threshold**: 400 of any http response code for the past 1 minute
  - **Vulnerability Mitigated**: Detects brute force attacks, as well as aggressive vulnerability and directory enumeration scanning
  - **Reliability**: Detected nmap-vuln script as well as gobuster directory scanning, but did not detect wpscan
  
#### HTTP Request Size Monitor
Request Size Monitor is implemented as follows:
  - **Metric**: http.request.bytes
  - **Threshold**: 3500 
  - **Vulnerability Mitigated**: This detected directory enumeration scripts, and nmap-vuln scans
  - **Reliability**: Low reliability due to false positives

#### CPU Usage Monitor
Alert 2 is implemented as follows:
  - **Metric**: system.process.cpu.total.pct
  - **Threshold**: 50% cpu utilization
  - **Vulnerability Mitigated**: DOS attacks
  - **Reliability**: Did not fire during penetration testing