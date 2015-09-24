node /^dev.erp/ {
  include roles::dev
}
node /^odoo_public/ {
  include roles::vagrant_public
}
node /^odoo_private/ {
  include roles::vagrant_private
}
