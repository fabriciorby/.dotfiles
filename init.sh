# Install OH MY ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

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

brew install --cask obsidian

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
# remove mouse acceleration
defaults write .GlobalPreferences com.apple.mouse.scaling -1

bb init.clj
