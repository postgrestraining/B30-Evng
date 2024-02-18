## Create EC2 instance and configure aws in cli

https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

[postgres@lab01 aws]$ aws configure
AWS Access Key ID [****************X6HF]: AKIA3TW7NMA
AWS Secret Access Key [****************KpaT]: x4Fon9VH6kGGViCxIqP
Default region name [us-east-1]:
Default output format [None]:
[postgres@lab01 aws]$

yum install jq
