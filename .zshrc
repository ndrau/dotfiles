# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# alias to list all globally installed npm packages
alias npmls="npm list -g --depth 0"

# alias to list all globally installed brew packages
alias brewls="brew leaves --installed-on-request"

# alias to list all globally installed vs code packages
alias vscodels="code --list-extensions"

# alias to restart current shell
alias reloadShell="source ~/.zshrc"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias bookmarks='
  echo "~/.nvm"
  echo "~/.dotfiles"
  echo "~/.code/MBio/OTB/trex"
  echo "~/.code/MBio/temp – temporary code projects/tests"
  '