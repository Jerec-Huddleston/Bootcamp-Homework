## Week 16 Homework Submission File: Penetration Testing 1

#### Step 1: Google Dorking


- Using Google, can you identify who the Chief Executive Officer of Altoro Mutual is:
  - Karl Fitzgerald

- How can this information be helpful to an attacker:
  - This information can be used to attack Altoro Mutual through means such as phising and social engineering attacks.

#### Step 2: DNS and Domain Discovery

Enter the IP address for `demo.testfire.net` into Domain Dossier and answer the following questions based on the results:

  1. Where is the company located:
      - Sunnyvale, CA 94085 US
    
  2. What is the NetRange IP address:
      - `65.61.137.64 - 65.61.137.127`

  3. What is the company they use to store their infrastructure:
      - Rackspace Backbone Engineering
  
  4. What is the IP address of the DNS server:
      - `23.211.61.64`

#### Step 3: Shodan

- What open ports and running services did Shodan find:
  - Port 80: Apache Tomcat/Coyote JSP engine1.1
  - Port 443: Apache Tomcat/Coyote JSP engine1.1
  - Port 8080: Apache Tomcat/Coyote JSP engine1.1

#### Step 4: Recon-ng

- Install the Recon module `xssed`. 
- Set the source to `demo.testfire.net`. 
- Run the module. 

Is Altoro Mutual vulnerable to XSS:
  - Yes

### Step 5: Zenmap

Your client has asked that you help identify any vulnerabilities with their file-sharing server. Using the Metasploitable machine to act as your client's server, complete the following:

- Command for Zenmap to run a service scan against the Metasploitable machine:
  - `nmap -sV 192.168.0.10`
 
- Bonus command to output results into a new text file named `zenmapscan.txt`:
  - `nmap -sV -oN zenmapscan.txt 192.168.0.10`

- Zenmap vulnerability script command:
  - `nmap --script samba-vuln-cve-2012-1182 192.168.0.10`

- Once you have identified this vulnerability, answer the following questions for your client:
  1. What is the vulnerability:
    - https://www.cvedetails.com/cve/CVE-2012-1182/
    - https://nmap.org/nsedoc/scripts/samba-vuln-cve-2012-1182.html

  2. Why is it dangerous:
    - Samba versions 3.6.3 and all versions previous to this are affected by a vulnerability that allows remote code execution as the "root" user from an anonymous connection.

  3. What mitigation strategies can you recommendations for the client to protect their server:
  
  This exploit has the maximum CVVS score of 10.0 as it allows an attacker to fully compromise and control a target system. The exploit is not difficult to pull of and bypasses the need for authentication.
  
  First I reccomend to immediately assess both if the server is exposed to the internet or only accessible from within the network, as well as if any sensitive data is stored on the server. If the server is exposed or contains sensitive data it would be strongly reccomended that the Samba service be disabled until it is patched as the risk of this vulnerability is so high. However if the file-sharing service must remain online it would be prudent to put measures in place to block outside access to the server until it can be patched to a non-vulnerable version.
  
  In any case Samba should be updated to 3.6.4 or any later version as soon as possible to avoid further risk. Even if there is no sensitive data on the server if an attacker were to gain access, they could still use the Metasploitable server as a starting point to move around the network or deploy malware. As such I cannot reccomend leaving the server unpatched for any reason.

---
© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.  
