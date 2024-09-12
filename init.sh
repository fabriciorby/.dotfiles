brew install neovim
brew install clojure
brew install borkdude/brew/babashka
brew install bat
brew install git-delta

touch ~/Library/LaunchAgents/com.local.KeyRemapping.plist
cat remap.plist >> ~/Library/LaunchAgents/com.local.KeyRemapping.plist
launchctl load ~/Library/LaunchAgents/com.local.KeyRemapping.plist
