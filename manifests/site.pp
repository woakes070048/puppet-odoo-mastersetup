node /^dev.erp/ {
  include roles::dev
}
node /^odoo.local/ {
  include roles::vagrant_public
}
