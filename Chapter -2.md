## Create EC2 instance and configure aws in cli

EC2 -> Key Pairs -> Create Key Pair -> Name: B30, Choose .ppk -> Finish

EC2 -> Launch Instance -> Name: my-inst 
    -> Image: ami-0e731c8a588258d0d (al2023-ami-2023.3.20240205.2-kernel-6.1-x86_64

![Minion](https://github.com/postgrestraining/B30-Evng/blob/main/images/EC2-us-east-1.png)

    -> Choose rest of the details -> Launch instance




```
https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
```













[postgres@lab01 aws]$ aws configure
AWS Access Key ID [****************X6HF]: AKIA3TW7NMA
AWS Secret Access Key [****************KpaT]: x4Fon9VH6kGGViCxIqP
Default region name [us-east-1]:
Default output format [None]:
[postgres@lab01 aws]$

yum install jq
