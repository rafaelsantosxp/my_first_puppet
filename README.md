# my_first_puppet
Puppet_project
<h3>Define pre config on puppet nodes</h3><br>
at nameserver config set:<br>
/etc/hosts <br> 
10.0.15.10      master.rscorp.com<br>
10.0.15.11      agent.rscorp.com<br>
<h3>Install NTP as prereq</h3><br>
yum -y install ntp ntpdate<br>
sudo ntpdate 0.centos.pool.ntp.org<br>
sudo systemctl start ntpd<br>
sudo systemctl enable ntpd<br>
<h3>Disable SELINUX</h3><br>
vim /etc/sysconfig/selinux > SELINUX=disabled

<h3>install Puppet</h3><br>
rpm -Uvh https://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm<br>
sudo yum -y install puppetserver<br>
vim /etc/sysconfig/puppetserver<br>
vim /etc/puppetlabs/puppet/puppet.conf<br>
