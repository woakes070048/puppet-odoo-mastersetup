node /^dev/ {
  include roles::dev
}

node /^vagrant-public/ {
  include roles::vagrant_public
}

node /^vagrant-private/ {
  include roles::vagrant_private
}
