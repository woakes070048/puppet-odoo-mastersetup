node /^prod(\d*).(erp|local)/ {
  include roles::erp
}

node /^qa.(erp|local)/ {
  include roles::qa
}

node /^dbbackup.(erp|local)/ {
  include roles::dbbackup
}

node /redirects/ {
  include roles::redirects
}

node /^zabbix/ {
  include roles::zabbixserver
}

node /^itassets/ {
  include roles::itassets
}
