function update_sys() {

  brew update && brew upgrade

  ya pack -u

  rustup update

  conda self-update
}
