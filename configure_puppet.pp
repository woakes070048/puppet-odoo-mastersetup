# used to setup puppet 3.8 on ubuntu 14.04

# Configure puppet.conf
ini_setting { 'Configure environmentpath':
  ensure  => 'present',
  path    => "${::settings::confdir}/puppet.conf",
  section => 'main',
  setting => 'environmentpath',
  value   => '$confdir/environments',
}
ini_setting { 'Configure basemodulepath':
  ensure  => 'present',
  path    => "${::settings::confdir}/puppet.conf",
  section => 'main',
  setting => 'basemodulepath',
  value   => '$confdir/modules:/opt/puppet/share/puppet/modules',
}
ini_setting { 'Configure environment timeout':
  ensure  => 'present',
  path    => "${::settings::confdir}/puppet.conf",
  section => 'main',
  setting => 'environment_timeout',
  value   => '0', # change to unlimited on production for better performance
}
ini_setting { 'Configure storeconfigs':
  ensure  => 'present',
  path    => "${::settings::confdir}/puppet.conf",
  section => 'master',
  setting => 'storeconfigs',
  value   => true,
}
ini_setting { 'Configure storeconfigs_backend':
  ensure  => 'present',
  path    => "${::settings::confdir}/puppet.conf",
  section => 'master',
  setting => 'storeconfigs_backend',
  value   => 'puppetdb',
}
ini_setting { 'Remove depricated templatedir':
  ensure  => 'absent',
  path    => "${::settings::confdir}/puppet.conf",
  section => 'main',
  setting => 'templatedir',
}


# configure puppetdb.conf
file { "${::settings::confdir}/puppetdb.conf" :
  ensure => present,
  mode   => '0644',
  owner  => 'puppet',
  group  => 'puppet',
}
ini_setting { 'Configure puppetdb server':
  ensure  => present,
  path    => "${::settings::confdir}/puppetdb.conf",
  section => 'main',
  setting => 'server',
  value   => $::fqdn,
  require => File["${::settings::confdir}/puppetdb.conf"],
}
ini_setting { 'Configure puppetdb port':
  ensure  => present,
  path    => "${::settings::confdir}/puppetdb.conf",
  section => 'main',
  setting => 'port',
  value   => '8081',
  require => File["${::settings::confdir}/puppetdb.conf"],
}

# configure routes.yaml
file { "${::settings::confdir}/routes.yaml":
  ensure  => present,
  owner   => 'puppet',
  group   => 'puppet',
  content => "---\nmaster:\n  facts:\n    terminus: puppetdb\n    cache: yaml",
  replace => false,
}
exec { 'install hiera-file gem':
  command => '/usr/bin/puppetserver gem install hiera-file',
  unless  => '/usr/bin/puppetserver gem list|/bin/grep hiera-file',
}

package { 'python-pip':
  ensure => 'installed'
}
package { 'awscli':
  ensure => 'installed',
  provider => 'pip'
  require => Package['python-pip'],
}

# setup hiera
file { "${::settings::confdir}/hiera.yaml":
  ensure  => present,
  mode    => '0640',
  owner   => 'puppet',
  group   => 'puppet',
  require => Exec['install hiera-file gem'],
  content => "---
:backends:
  - yaml
  - file
:yaml:
  :datadir: \"/etc/puppet/data\"
:hierarchy:
  - techusers
  - supportusers
  - \"%{environment}\"
  - \"%{environment}/%{certname}\"
  - common
:file:
  :datadir: \"/etc/puppet/data\"",
}
file { "${::settings::confdir}/data":
  ensure => 'directory',
  owner  => 'puppet',
  group  => 'puppet',
  mode   => '0755',
}