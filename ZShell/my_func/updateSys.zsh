function __check_success() {
  [ $? -eq 0 ] && echo "${1} updated successfully" || echo "${1} update failed"
}

function UpdateSys() {

  brew update && brew upgrade

  __check_success "Homebrew"

  ya pack -u

  __check_success "Yazi"

  rustup update

  __check_success "Rust"

  conda self-update
  
  __check_success "Micromamba"
}
