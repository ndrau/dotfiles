#!/usr/bin/env bash

# This file is based on https://github.com/kentcdodds/dotfiles/blob/main/.macos and https://mths.be/macos. Credits all go to them!
# Modified by Andreas Rau
# Run without downloading:
# curl https://raw.githubusercontent.com/kentcdodds/dotfiles/HEAD/.macos | bash

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# Andy's Customizations                                                       #
###############################################################################

echo "Hello $(whoami)! Let's get you set up."

echo "mkdir -p ${HOME}/code"
mkdir -p "${HOME}/code"

###############################################################################
# Homebrew                                                                    #
###############################################################################

echo "installing homebrew"
# install homebrew https://brew.sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Homebrew next steps
echo '# Set PATH, MANPATH, etc., for Homebrew.' >>  ${HOME}/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>  ${HOME}/.zprofile

# Set Homebrew Path for this session
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "installing brew apps"
brew install git tree mas \
zsh-syntax-highlighting zsh-history-substring-search \
romkatv/powerlevel10k/powerlevel10k

echo "installing brew casks"
brew install --cask google-chrome firefox brave-browser jdownloader \
visual-studio-code iterm2 dash polypane\
bettertouchtool divvy bartender itsycal workflowy suspicious-package \
qlcolorcode qlmarkdown qlstephen quicklook-json webpquicklook qlvideo \
vlc handbrake betterzip avibrazil-rdm \
spotify focus \

echo "installing apps from app store"
# use 'mas search xcode' to search for apps in the app store
mas install 497799835 # XCode
mas install 409183694 # Keynote
mas install 409203825 # Numbers
mas install 409201541 # Pages
mas install 441258766 # Magnet Window Manager
mas install 430255202 # Mactracker
mas install 1157491961 # PLIST Editor
mas install 402592703 # Time Out - Break Reminders

###############################################################################
# Dotfiles                                                                    #
###############################################################################

echo "cloning dotfiles"
git clone git@github.com:ndrau/dotfiles.git "${HOME}/.dotfiles"
ln -s "${HOME}/.dotfiles/.zshrc" "${HOME}/.zshrc"
# ln -s "${HOME}/.dotfiles/.p10k.zsh" "${HOME}/.p10k.zsh"
ln -s "${HOME}/.dotfiles/.zprofile" "${HOME}/.zprofile"
# ln -s "${HOME}/.dotfiles/.gitignore_global" "${HOME}/.gitignore_global"
ln -s "${HOME}/.dotfiles/.gitconfig" "${HOME}/.gitconfig"
# ln -s "${HOME}/.dotfiles/.my_bin" "${HOME}/.my_bin"
# ln -s "${HOME}/.dotfiles/.vimrc" "${HOME}/.vimrc"
# ln -s "${HOME}/.dotfiles/.vimrc-parts" "${HOME}/.vimrc-parts"
# ln -s "${HOME}/.dotfiles/.ripgreprc" "${HOME}/.ripgreprc"
ln -s "${HOME}/.dotfiles/.eslintrc.cjs" "${HOME}/.eslintrc.cjs"
ln -s "${HOME}/.dotfiles/.prettierrc" "${HOME}/.prettierrc"

echo "making system modifications:"


###############################################################################
# Install pnpm                                                                #
###############################################################################
echo "installing pnpm"
curl -fsSL https://get.pnpm.io/install.sh | sh -

###############################################################################
# Setting Node global version to lts                                          #
###############################################################################
echo "installing long term support version of node globally"
pnpm env use -g lts

echo "node --version: $(node --version)"
echo "npm --version: $(npm --version)"

###############################################################################
# Node                                                                        #
###############################################################################

echo "installing a few global npm packages"
npm install --global \
    vite\
    typescript\
    ts-node


###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Activity Monitor" \
  "Address Book" \
  "Calendar" \
  "cfprefsd" \
  "Contacts" \
  "Dock" \
  "iTerm2" \
  "Finder" \
  "Mail" \
  "Messages" \
  "Photos" \
  "Safari" \
  "SystemUIServer" \
  "iCal"; do
  killall "${app}" &> /dev/null
done
echo "Done. Note that some of these changes require a logout/restart to take effect."

printf "TODO:\n\
Download Logitech MX Master driver
Check Chrome sync
Check if all VSCode extensions are enabled

Check Dash Docsets: \n
- TypeScript
- Javascript
- HTML
- CSS
- Sass
- Bash
- Man PAges
- Apple API References
- Applescript
- Arduino
- Docker
- Markdown
- Python 3
- ionic-team/stencil-site
- Vue.js Composition API
- Vue.js Options API
include google calendar in outlook
login to literally everything \n\
"