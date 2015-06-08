######         ######
##  Configure R10k ##
######         ######

##  This manifest requires the zack/R10k module and will attempt to
##  configure R10k according to my blog post on directory environments.
##  Beware! (and good luck!)

class { 'r10k':
  version => '1.3.2',
  sources => {
    'puppet' => {
      'remote'  => 'https://github.com/localmotors/puppet-odoo-mastersetup.git',
      'basedir' => "${::settings::confdir}/environments",
      'prefix'  => false,
    }
  },
}
