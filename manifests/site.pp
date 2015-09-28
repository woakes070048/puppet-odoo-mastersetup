node /^dev.(erp|local)/ {
  include roles::dev
}
node /^odoo.local/ {
  include roles::vagrant_private
}
