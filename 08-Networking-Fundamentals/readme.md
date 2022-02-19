## Networking Fundamentals Homework: Rocking your Network!

**Phase 1**

- Used **fping** to check each Hollywood ip
  
  - `fping -c 4 15.199.95.91 15.199.94.91 11.199.158.91 167.172.144.11 11.199.141.91`

- IP `167.172.144.11` is responding to ping requests

  - RockStar Corp does not want servers responding to ping requests so this is a vulnerability
  
  - Recommend to restrict ICMP echo requests on `167.172.144.11` to prevent responses from ping requests

- This was found on the network layer as ping uses IP addresses from the network layer


**Phase 2**

- Used **Nmap** to find open ports on `167.172.144.11`

  - `sudo nmap -sS 167.172.144.11`

- Found that port 22 is open this is a potential vulnerability

  - Recommend to close or filter port 22 so that no unauthorized SSH connections can be made

- This was found on the transport layer as ports are assigned on the transport layer


**Phase 3**

- Used **SSH** with default credentials to access `167.172.144.11`

  - `ssh jimi@167.172.144.11 -p 22`

- Using default credentials is a vulnerability

  - Recommend RockStar Corp use non-default login credentials for their servers

- Accessed hosts file to diagnose unintended behavior of `rollingstone.com`

  - `more /etc/hosts`
  
    -Found hosts entry `98.137.246.8 rollingstone.com`
    
- Used **nslookup** to find domain of 98.137.246.8

   - `nslookup 98.137.246.8`
   
     - **nslookup** response `unknown.yahoo.com`

- This was found on the application layer as SSH runs on the application layer


**Phase 4**

- Used **SSH** to access `167.172.144.11`

  - `ssh jimi@167.172.144.11 -p 22`

- Navigated to find the packet capture file

  - `cd etc`
  
  - `ls`
  
  - `more packetcaptureinfo.txt`

    - `packetcaptureinfo.txt` contains link to `https://drive.google.com/file/d/1ic-CFFGrbruloYrWaw3PvT71elTkh3eF/view?usp=sharing`


- Analyzed ARP packets

  - IP `192.168.47.200` was found at two different Mac Addresses `00:0c:29:0f:71:a3` and `00:0c:29:1d:b3:b1`, this could be due to ARP poisoning
  
- ARP poisoning is a vulnerability

  - Recommend static ARP entries if viable for RockStar Corp
  
  - Recommend arp spoofing detection software

- ARP is on the data link layer

- Found HTTP traffic accessing `pixel.yola.com` and `www.gottheblues.yolasite.com`

  - The contact us form on `www.gottheblues.yolasite.com` was used to send the following message
  
    - "Hi Got The Blues Corp!  This is a hacker that works at Rock Star Corp.  Rock Star has left port 22, SSH open if you want to hack in.  For 1 Milliion Dollars I will provide you the user and password!"
    
- Potential vulnerability in hackers ability to access arbitrary and unauthorized websites

  - Recommend to either restrict or implement monitoring of connections to unapproved IP addresses

- This was found on the Network layer as packets are on the network layer


---