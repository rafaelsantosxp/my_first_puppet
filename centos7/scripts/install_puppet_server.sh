#!/bin/bash
echo Instaling prerequesites
yum -y install ntp ntpdate
ntpdate 0.centos.pool.ntp.org
systemctl start ntpd
systemctl enable ntpd
echo Set SELINUX Disable
sed -i 's/SELINUX=enforcing/SELINUX=disable/g' /etc/sysconfig/selinux
echo Instaling Puppet Server
rpm -Uvh https://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm
sudo yum -y install puppetserver
echo Configuring Puppet Server
cp .config/puppet.conf /etc/puppetlabs/puppet/puppet.conf
servername=$(printf "$HOSTNAME") && printf $servername && sed -i 's/servername/'$servername'/g' /etc/puppetlabs/puppet/puppet.conf


