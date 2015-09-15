node /^prod/ {
  include roles::production
}

node /erp?.localmotors.com/ {
  include roles::production
}

node /odoo9.localmotors.com/ {
  include roles::odoo9
}

node /^qa/ {
  include roles::qa
}

node /^dbbackup/ {
  include roles::dbbackup
}
