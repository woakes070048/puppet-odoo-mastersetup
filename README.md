# Puppet Master Setup
Initial setup for a puppetmaster server  
*Tested on Ubuntu 14.04*

* Setup the hostname
```shell
hostname puppet
echo "127.0.0.1 puppet.lmec2.net puppet" >> /etc/hosts
echo "puppet" > /etc/hostname
```
* Install puppet tools
```shell
cd /usr/local/src
wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
dpkg -i puppetlabs-release-trusty.deb
apt-get update
apt-get upgrade -y
apt-get install puppet puppetserver git crudini -y
```
* Configure initial settings
```shell
crudini --del /etc/puppet/puppet.conf main templatedir
crudini --set /etc/puppet/puppet.conf agent environment puppetmaster
if [[ -f /etc/default/puppet ]];then
  sed -i -r 's/START=no/START=yes/' /etc/default/puppet
fi
```
* startup puppetserver and create the certificates
```shell
service puppetserver restart
puppet agent --enable
puppet agent --test
```
* install zack-r10k module
```shell
puppet module install zack-r10k
```
* install puppetdb and terminus
```shell
apt-get install puppetdb puppetdb-terminus -y
```
* clone setup repository and apply the manifests
```shell
cd /tmp
git clone https://github.com/localmotors/puppet-odoo-mastersetup.git
cd puppet-odoo-mastersetup
git checkout puppetmaster
puppet apply configure_r10k.pp
puppet apply configure_puppet.pp
```
* run r10k and restart the puppetserver to load new settings
```shell
r10k deploy environment -pv
service puppetserver restart
```
* copy and setup the data directory for hiera
  - The hiera data should be put in /etc/puppet/data/
  - The permissions should look like root.puppet 750/640

* enable start on boot for puppetdb and puppetserver
```shell
update-rc.d puppetdb defaults
update-rc.d puppetserver defaults
```
* run puppet to configure the last items
```shell
puppet agent --onetime --no-daemonize --verbose
```
* one last restart to load the final settings
```shell
service puppetserver restart
```
