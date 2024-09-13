brew install cowsay
brew install jq
brew install bat
brew install git-delta
brew install fzf
brew install --cask font-hack-nerd-font
brew install lsd
brew install neovim
brew install clojure
brew install borkdude/brew/babashka


touch ~/Library/LaunchAgents/com.local.KeyRemapping.plist
cat remap.plist >> ~/Library/LaunchAgents/com.local.KeyRemapping.plist
launchctl load ~/Library/LaunchAgents/com.local.KeyRemapping.plist
