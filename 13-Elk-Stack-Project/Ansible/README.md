## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![diagram](https://github.com/Jerec-Huddleston/Bootcamp-Homework/blob/main/13-Elk-Stack-Project/Images/Unit%2013.drawio.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the `DVWA_pentest.yml` file may be used to install only certain pieces of it, such as Filebeat.

  - _DVWA_pentest.yml_

This document contains the following details:
- Description of the Topologu
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.


Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the filesystem and system metrics.

The configuration details of each machine may be found below.

| Name    | Function   | IP Address | Operating System |
|---------|------------|------------|------------------|
| JumpBox | Gateway    | 10.0.0.4   | Linux            |
| Web-1   | Web Server | 10.0.0.5   | Linux            |
| Web-2   | Web Server | 10.0.0.6   | Linux            |
| Web-3   | Web Server | 10.0.0.7   | Linux            |
| ElkVM   | Logs       | 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the JumpBox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP address: 107.2.222.142

Machines within the network can only be accessed by JumpBox.

A summary of the access policies in place can be found in the table below.

| Name    | Publicly Accessible | Allowed IP Addresses        |
|---------|---------------------|-----------------------------|
| JumpBox | Yes                 | 107.2.222.142               |
| Web-1   | No                  | 10.0.0.4                    |
| Web-2   | No                  | 10.0.0.4                    |
| Web-3   | No                  | 10.0.0.4                    |
| ElkVM   | Yes                 | 10.0.0.4 107.2.222.142:5601 |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because of the speed, efficiency, and repeatability in deploying software to multiple machines.

The playbook implements the following tasks:
- The playbook configures the ELK machine to use the required about on memory
- Python3 and docker are downloaded and installed on the machine as well as the docker python module
- The ELK docker container is downloaded and installed
- The Docker service is configured to be enabled on startup

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![docker](https://github.com/Jerec-Huddleston/Bootcamp-Homework/blob/main/13-Elk-Stack-Project/Images/docker%20ps.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines: 10.0.0.5, 10.0.0.6, and 10.0.0.7

We have installed the following Beats on these machines: Filebeat and Metricbeat

These Beats allow us to collect the following information from each machine:
Filebeat collects data about the file system, such as changes to files.
Metricbeat collects data about system metrics, including CPU usage and uptime.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the `DVWA_pentest.yml` file to `/etc/ansible/roles`.
- Update the hosts file to include a webservers group and an elk group
- Run the playbook, and navigate to `http://[your.ELK-VM.External.IP]:5601/app/kibana` to check that the installation worked as expected.
