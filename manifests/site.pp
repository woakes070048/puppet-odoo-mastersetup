node /^prod/ {
  include roles::production
}

node /erp?.localmotors.com/ {
  include roles::production
}

node /^odoo9/ {
  include roles::odoo9
}

node /^rdstest/ {
  include roles::rdstest
}

node /^qa/ {
  include roles::qa
}

node /^dbbackup/ {
  include roles::dbbackup
}

# new structure
node /^erp-prod/ {
  include roles::production
}

