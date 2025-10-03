#!/bin/zsh

git clone https://github.com/romkatv/zsh-defer.git .scripts/zsh-defer # Assuming you have git already

# Install HomeBrew manually and then
brew install cowsay
brew install cbonsai
brew install ripgrep
brew install jq
brew install bat
brew install git-delta
brew install fzf
brew install lsd
brew install neovim
brew install luarocks
brew install rust
brew install clojure
brew install borkdude/brew/babashka
brew install zoxide
brew install lazygit
brew install kubectl
brew install k9s
brew install jenv
brew install ripgrep
brew install tmux
brew install gitmux
brew install tmuxinator
brew install direnv
brew install starship
brew install fastfetch
brew install btop

# Prepare Stow
brew install stow
rm ~/.zshrc
stow .

brew install openjdk@17
brew install openjdk@21
jenv add /opt/homebrew/opt/openjdk@17/
jenv add /opt/homebrew/opt/openjdk@21/
jenv global 21
brew install maven
jenv enable-plugin maven
jenv enable-plugin export
source ~/.zshrc
