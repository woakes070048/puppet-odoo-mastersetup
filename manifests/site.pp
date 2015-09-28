node /^prod?.(erp|local)/ {
  include roles::production
}

node /^qa.(erp|local)/ {
  include roles::qa
}

node /^dbbackup.(erp|local)/ {
  include roles::dbbackup
}
