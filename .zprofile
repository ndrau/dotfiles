# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# SSH settings
ssh-add -q --apple-use-keychain ~/.ssh/id_github
ssh-add -q --apple-use-keychain ~/.ssh/id_enterprise_github

# python pip3 path
export PATH="/Users/andreasrau/Library/Python/3.9/bin:$PATH"
