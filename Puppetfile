forge "http://forge.puppetlabs.com"

# Modules from the puppet forge
mod 'jfryman/nginx', '0.2.6'
mod 'puppetlabs/postgresql', '4.3.0'
mod 'puppetlabs/nodejs', '0.8.0'
mod 'puppetlabs/ntp'
mod 'puppetlabs/vcsrepo'
mod 'puppetlabs/git'

# dependencies of modules above. r10k does not yet fetch dependencies.
mod 'puppetlabs/stdlib'
mod 'puppetlabs/concat'
mod 'puppetlabs/apt'


# custom modules from github
mod 'odoo',
  :git     => 'https://github.com/localmotors/puppet-odoo.git',
  :branch  => 'master'
mod 'profiles',
  :git     => 'https://github.com/localmotors/puppet-odoo-profiles.git',
  :branch  => 'master'
mod 'useraccounts',
  :git     => 'https://github.com/localmotors/puppet-useraccounts.git',
  :branch  => 'master'
mod 'roles',
  :git     => 'https://github.com/localmotors/puppet-odoo-roles.git',
  :branch  => 'master'
mod 'scripts',
  :git     => 'https://github.com/localmotors/puppet-odoo-scripts.git',
  :branch  => 'master'