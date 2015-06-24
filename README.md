#puppetmaster_setup
Initial setup for a puppetmaster server
Tested on Ubuntu 14.04

##Initial Setup
* Install puppet tools
```shell
cd /usr/local/src
wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
dpkg -i puppetlabs-release-trusty.deb
apt-get update
apt-get install puppet puppetdb puppetdb-terminus puppetserver git -y
```
* install zack-r10k module
```shell
puppet module install zack-r10k
```
* clone repository
```shell
cd /tmp
git clone https://github.com/localmotors/puppet-odoo-mastersetup.git
cd puppet-odoo-mastersetup
```
* checkout the puppetmaster branch
```shell
git checkout puppetmaster
```
* apply r10k config
```shell
puppet apply configure_r10k.pp
```
* apply puppet config
```shell
puppet apply configure_puppet.pp
```
* run r10k
```shell
r10k deploy environment -pv
```
* restart puppet server
```shell
service puppetserver restart
```
* setup the ssl for puppetdb
```shell
puppetdb ssl-setup
```
* restart puppetdb
```shell
service puppetdb restart
```
* enable start on boot for puppetdb and puppetserver
```shell
update-rc.d puppetdb defaults
update-rc.d puppetserver defaults
```
