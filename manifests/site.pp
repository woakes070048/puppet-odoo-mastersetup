node /^odoo-dev/ {
  include roles::dev
}
node /^odoo-qa/ {
  include roles::qa
}

node /^vagrant-public/ {
  include roles::vagrant_public
}
node /^vagrant-private/ {
  include roles::vagrant_private
}
