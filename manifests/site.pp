node /^puppet/ {
  include roles::puppetmaster
}

node /^prod/ {
  include roles::production
}

node /^qa/ {
  include roles::qa
}

node /^dbbackup/ {
  include roles::dbbackup
}
