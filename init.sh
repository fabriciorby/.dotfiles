brew install cowsay
brew install jq
brew install bat
brew install git-delta
brew install fzf
brew install lsd
brew install neovim
brew install clojure
brew install borkdude/brew/babashka
brew install zoxide
brew install lazygit
brew install --cask nikitabobko/tap/aerospace

# Install Fonts
cp .fonts/* ~/Library/Fonts/.

# Remap Esc to CapsLock
touch ~/Library/LaunchAgents/com.local.KeyRemapping.plist
cat remap.plist >> ~/Library/LaunchAgents/com.local.KeyRemapping.plist
launchctl load ~/Library/LaunchAgents/com.local.KeyRemapping.plist

# iTerm2
# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.dotfiles/.config/iterm2"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# remove press and hold
defaults write -g ApplePressAndHoldEnabled -bool false

bb init.clj
