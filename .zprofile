# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# SSH settings
ssh-add -q --apple-use-keychain ~/.ssh/id_github
ssh-add -q --apple-use-keychain ~/.ssh/id_enterprise_github