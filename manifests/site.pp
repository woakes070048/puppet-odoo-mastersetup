node /^odoo-dev/ {
  include roles::dev
}
node /^odoo-qa/ {
  include roles::qa
}

node /^vagrant(-|_)public/ {
  include roles::vagrant_public
}
node /^vagrant(-|_)private/ {
  include roles::vagrant_private
}
