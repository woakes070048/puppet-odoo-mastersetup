forge "http://forge.puppetlabs.com"

# Modules from the puppet forge
mod 'puppetlabs/postgresql', '4.3.0'
mod 'puppetlabs/ntp'


# dependencies of modules above. r10k does not yet fetch dependencies.
mod 'puppetlabs/stdlib'
mod 'puppetlabs/concat'
mod 'puppetlabs/apt'

# custom modules from github
mod 'profiles',
  :git     => 'https://github.com/bhaymore/odoo_profiles.git',
  :branch  => 'master'
mod 'useraccounts',
  :git     => 'https://github.com/bhaymore/useraccounts.git',
  :branch  => 'master'
mod 'roles',
  :git     => 'https://github.com/bhaymore/odoo_roles.git',
  :branch  => 'master'