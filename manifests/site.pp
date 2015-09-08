node /^prod/ {
  include roles::production
}

node /erp?.localmotors.com/ {
  include roles::production
}

node /^qa/ {
  include roles::qa
}

node /^dbbackup/ {
  include roles::dbbackup
}
