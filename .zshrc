# Add deno completions to search path
if [[ ":$FPATH:" != *":/Users/andreasrau/.zsh/completions:"* ]]; then export FPATH="/Users/andreasrau/.zsh/completions:$FPATH"; fi
# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# fnm
eval "$(fnm env --use-on-cd --shell zsh)"

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

# Define a function to install Node.js with package reinstall from current versions packages
nvm_install_with_reinstall_of_current_packages() {
  echo "installing node: $1 with reinstall of current packages"
  nvm install --reinstall-packages-from=current "$1"
}

alias bookmarks='
  echo "~/.nvm"
  echo "~/.dotfiles"
  echo "~/.code/MBio/OTB/trex"
  echo "~/.code/MBio/temp – temporary code projects/tests"
  '
# python pip3 path
export PATH="/Users/andreasrau/Library/Python/3.9/bin:$PATH"

# Mapbox tilesets
export MAPBOX_ACCESS_TOKEN="sk.eyJ1IjoiYW5keXdlbmR5IiwiYSI6ImNscXdtZWJ5YTA0dGcyanFrb3kzdnVqam0ifQ.OhyBZQ-e-Mg1J1hb_UvCeA"
. "/Users/andreasrau/.deno/env"
