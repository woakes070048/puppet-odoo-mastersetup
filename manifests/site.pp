node /^dev.(erp|local)/ {
  include roles::dev
}
node /^(erp|odoo).local/ {
  include roles::vagrant_private
}
