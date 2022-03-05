## Networks Fundamentals II Homework: In a Network Far, Far Away!

**Mission 1**

- Used **nslookup** to check the mail servers of `starwars.com`
  
  - `nslookup -type=mx starwars.com`
  
  ```bash
  starwars.com    MX preference = 10, mail exchanger = aspmx3.googlemail.com
  starwars.com    MX preference = 5, mail exchanger = alt1.aspx.l.google.com
  starwars.com    MX preference = 1, mail exchanger = aspmx.l.google.com
  starwars.com    MX preference = 5, mail exchanger = alt2.aspmx.l.google.com
  starwars.com    MX preference = 10, mail exchanger = aspmx2.googlemail.com
  ```
  
  - The Resistance isn't receiving mail because neither of the correct mail servers are listed
  
    - Corrected MX record:
    
    ```bash
    starwars.com    MX preference = 1, mail exchanger = asltx.l.google.com
    starwars.com    MX preference = 5, mail exchanger = asltx.2.google.com
    ```
    
    
**Mission 2**

- Used **nslookup** to check spf records for `theforce.net`

  - `nslookup -type=cname theforce.net`
  
  `v=spf1 a mx mx:smtp.secureserver.net include:aspmx.googlemail.com ip4:104.156.250.80 ip4:45.63.15.159 ip4:45.63.4.215`
  
  - Mail is being flagged as spam because the SPF record for `theforce.net` was not updated to the new IP of `45.23.176.21`
  
    - Corrected SPF record
    
    `v=spf1 ip4:45.23.176.21`


**Mission 3**

- Used **nslookup** to check CNAME records for `theforce.net`

  - `nslookup -type=cname theforce.net`
  
  ```bash
  theforce.net
      primary name server = WebPublish_Othe
      responsible mail addr = hostmaster
      serial  = 2017110901
      refresh = 900 (15 mins)
      retry   = 600 (10 mins)
      expire  = 86400 (1 day)
      default TTL = 3600 (1 hour)
  ```
  
  - `nslookup -type=cname resistance.theforce.net`
  
  `can't find resistance.theforce.net: Non-existent domain`
    
  - There is no DNS record for `resistance.theforce.net`
  
    - Corrected CNAME record:
    
    `resistance.theforce.net      canonical name = theforce.net`


**Mission 4**

- Used **nslookup** to check NS records for `princessleia.site`

  - `nslookup -type=ns princessleia.site`
  
  ```bash
  princessleia.site       nameserver = ns25.domaincontrol.com
  princessleia.site       nameserver = ns26.domaincontrol.com
  ```
  
  - The backup server `ns2.galaxybackup.com` is not in the NS records
  
    - Corrected NS record:
    
    ```bash
    princessleia.site       nameserver = ns25.domaincontrol.com
    princessleia.site       nameserver = ns26.domaincontrol.com
    princessleia.site       nameserver = ns2.galaxybackup.com
    ```


**Mission 5**

- OSPF path of Batuu to Jedha without planet N

  - `Batuu > D > C > E > F > J > I > L > Q > > T > V > Jedha`


**Mission 6**

- Used Aircrack-ng to find the key for `Darkside.pcap`

  - `aircrack-ng -w /usr/share/wordlists/rockyou.txt Darkside.pcap`

  `KEY FOUND! [ dictionary ]`
    
- Decrypted `Darkside.pcap` traffic in Wireshark

  - Key: `dictionary:linksys`
  
- IP and MAC Addresses of devices in `Darkside.pcap`
  
  - MAC: `00:0f:66:e3:e4:01` IP: `172.16.0.1`
  
  - MAC: `00:13:ce:55:98:ef` IP: `172.16.0.101`


**Mission 7**

- Used **nslookup** to check TXT record:s for `princessleia.site`

  - `nslookup -type=txt princessleia.site`
  
  `Run the following in a command line: telnet towel.blinkenlights.nl or as a backup access in a browser: www.asciimation.co.nz`
  
- Ran command from secret message

  - `telnet towel.blinkenlights.nl`
