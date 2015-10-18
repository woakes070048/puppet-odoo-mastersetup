node /^dev.(erp|local)/ {
  include roles::dev
}
node /^erp.local/ {
  include roles::vagrant_private
}
