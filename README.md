# my_first_puppet
Puppet_project
<h4>Define pre config on puppet nodes</h4><br>
at nameserver config set:<br>
/etc/hosts <br> 
10.0.15.10      master.rscorp.com<br>
10.0.15.11      agent.rscorp.com<br>
<h4>Install NTP as prereq</h4><br>
yum -y install ntp ntpdate<br>
sudo ntpdate 0.centos.pool.ntp.org<br>
sudo systemctl start ntpd<br>
sudo systemctl enable ntpd<br>
<h4>Disable SELINUX</h4><br>
vim /etc/sysconfig/selinux > SELINUX=disabled<br>
<h4>install Puppet</h4><br>
rpm -Uvh https://yum.puppetlabs.com/puppet5/puppet5-release-el-7.noarch.rpm<br>
sudo yum -y install puppetserver<br>
<h5> define puppet server config</h5><br>
vim /etc/sysconfig/puppetserver<br>
vim /etc/puppetlabs/puppet/puppet.conf<br>
[master]<br>
dns_alt_names=master.rscorp.com<br>
[main]<br>
certname =  master.rscorp.com<br>
server =  master.rscorp.com<br>
environment = production<br>
runinterval = 10m<br>
<h5>start and enable config</h5><br>
systemctl start puppetserver<br>
systemctl enable puppetserver <br>
<h5>Disable Firewall</h5><br>
firewall-cmd --add-port=8140/tcp --permanent<br>
firewall-cmd --reload<br>
