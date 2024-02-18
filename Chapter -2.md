## Create EC2 instance and configure aws in cli

EC2 -> Key Pairs -> Create Key Pair -> Name: B30, Choose .ppk -> Finish

EC2 -> Launch Instance -> Name: my-inst 
    -> Image: ami-0e731c8a588258d0d (al2023-ami-2023.3.20240205.2-kernel-6.1-x86_64

![Minion](https://github.com/postgrestraining/B30-Evng/blob/main/images/EC2-us-east-1.png)

    -> Choose rest of the details -> Launch instance

## Login to the instance and do the following

    1. Set up AWSCLI
    2. Install Oracle Client
    3. Install PostgreSQL
    4. Setup postgres user environment variables
    5. Login as oracle user and create hr schema in AWS Oracle RDS instance

In Putty -> 
username : ec2-user@ec2-3-88-113-43.compute-1.amazonaws.com  
Credentials :  browse ppk

    



### Install AWSCLI

```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
/usr/local/bin/aws --version
```
Upon successful installation

```
[root@ip-10-1-1-250 ~]# /usr/local/bin/aws --version
aws-cli/2.15.21 Python/3.11.6 Linux/6.1.75-99.163.amzn2023.x86_64 exe/x86_64.amzn.2023 prompt/off
[root@ip-10-1-1-250 ~]#
```

### Configure oracle client

```
wget https://yum.oracle.com/RPM-GPG-KEY-oracle-ol8 -O /etc/pki/rpm-gpg/RPM-GPG-KEY-oracle
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-oracle

dnf install https://download.oracle.com/otn_software/linux/instantclient/1919000/oracle-instantclient19.19-basic-19.19.0.0.0-1.el9.x86_64.rpm

dnf install https://download.oracle.com/otn_software/linux/instantclient/1919000/oracle-instantclient19.19-sqlplus-19.19.0.0.0-1.el9.x86_64.rpm

useradd oracle
su - oracle

sqlplus admin/oracle123@(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=orcl.cijxwe4ckz1m.us-east-1.rds.amazonaws.com)(PORT=1521)))(CONNECT_DATA=(SID=ORCL)))
```
Upon successful installation you should login to RDS instance

```
[oracle@ip-10-1-1-250 ~]$ sqlplus admin/oracle123@(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=orcl.cijxwe4ckz1m.us-east-1.rds.amazonaws.com)(PORT=1521)))(CONNECT_DATA=(SID=ORCL)))

SQL*Plus: Release 19.0.0.0.0 - Production on Sun Feb 18 17:12:44 2024
Version 19.19.0.0.0

Copyright (c) 1982, 2022, Oracle.  All rights reserved.


Connected to:
Oracle Database 19c Standard Edition 2 Release 19.0.0.0.0 - Production
Version 19.18.0.0.0

```












[postgres@lab01 aws]$ aws configure
AWS Access Key ID [****************X6HF]: AKIA3TW7NMA
AWS Secret Access Key [****************KpaT]: x4Fon9VH6kGGViCxIqP
Default region name [us-east-1]:
Default output format [None]:
[postgres@lab01 aws]$

yum install jq
