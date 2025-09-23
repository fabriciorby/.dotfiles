git clone https://github.com/romkatv/zsh-defer.git .scripts/zsh-defer # Assuming you have git already

# Install HomeBrew manually and then
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
brew install --cask zed
brew install k9s
brew install jenv
brew install ripgrep
brew install tmux
brew install gitmux
brew install direnv
brew install starship

# Prepare Sketchybar
brew install --cask font-sketchybar-app-font
brew install --cask sf-symbols
brew install --cask font-sf-pro

brew tap FelixKratz/formulae
brew install sketchybar
brew services start sketchybar

# Spotify
brew install --cask spotify
brew install spicetify-cli

# Prepare Stow
brew install stow
rm ~/.zshrc
stow .

# Spicetify Marketplace
curl -fsSL https://raw.githubusercontent.com/spicetify/marketplace/main/resources/install.sh | sh
spicetify backup apply
spicetify apply

brew install openjdk@17
brew install openjdk@21
jenv add /opt/homebrew/opt/openjdk@17/
jenv add /opt/homebrew/opt/openjdk@21/
jenv global 21
brew install maven
jenv enable-plugin maven
jenv enable-plugin export
source ~/.zshrc

brew install --cask obsidian

# Install Fonts
cp .fonts/* ~/Library/Fonts/.

# Remap Esc to CapsLock
# Removed as it's now impossible to press Caps Lock with QMK
# Use Customize Modifier Keys menu instead
# touch ~/Library/LaunchAgents/com.local.KeyRemapping.plist
# cat remap.plist >> ~/Library/LaunchAgents/com.local.KeyRemapping.plist
# launchctl load ~/Library/LaunchAgents/com.local.KeyRemapping.plist

# iTerm2
# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.dotfiles/.config/iterm2"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# remove press and hold
defaults write -g ApplePressAndHoldEnabled -bool false
# remove mouse acceleration
defaults write .GlobalPreferences com.apple.mouse.scaling -1

# Aerospace Shenaningans
# defaults write com.apple.dock expose-group-apps -bool true && killall Dock
# defaults write com.apple.spaces spans-displays -bool true && killall SystemUIServer

defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.5


bb init.clj
