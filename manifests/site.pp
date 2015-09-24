node /^prod.erp/ {
  include roles::production
}

node /^qa.erp/ {
  include roles::qa
}

node /^dbbackup.erp/ {
  include roles::dbbackup
}
