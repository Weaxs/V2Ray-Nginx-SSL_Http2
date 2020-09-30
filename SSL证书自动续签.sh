https://www.cloudsigma.com/how-to-automate-letsencrypt-ssl-certificate-renewals-for-nginx/

# 0. 安装前环境
sudo yum -y install yum-utils

sudo yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

sudo yum-config-manager --enable rhui-REGION-rhel-server-extras rhui-REGION-rhel-server-optional


# 1 安装Certbot
# CentOS7 / RHEL7
yum install certbot
 
# Fedora 23 or &gt;
dnf install certbot
 
# Debian 8
apt-get install certbot -t jessie-backports
 
# Ubuntu 14.04/16.04
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install certbot

# 2 续费证书
# stop NginX
systemctl stop nginx
# renew certificates
certbot -d example.tld -d www.example.tld -d downloads.example.tld -d mail.example.tld
# OR
certbot -d someother.tld -d www.someother.tld -d webmail.someother.tld
# OR
certbot certonly
# start NginX
systemctl start nginx

# 3 添加定时任务
crontab -e
@monthly /usr/local/sbin/letsencrypt-renew
@weekly /usr/local/sbin/letsencrypt-renew

# ** 注意 **
# 需要注意的是nginx里设置的证书位置必须和certbot自动续费的证书位置一样
