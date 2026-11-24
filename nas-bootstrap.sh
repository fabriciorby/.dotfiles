#!/usr/bin/env bash
# Recria o shell do NAS (UGOS): git, Homebrew, ferramentas, dotfiles, stow e exec zsh.
# Idempotente: pula o que já existe. Rodar como o usuário fabriciorby (NÃO como root):
#   ~/.dotfiles/nas-bootstrap.sh
# ou, numa máquina zerada:
#   bash <(curl -fsSL https://raw.githubusercontent.com/fabriciorby/.dotfiles/nas/nas-bootstrap.sh)
set -euo pipefail

BREW_PREFIX=/home/linuxbrew/.linuxbrew
DOTFILES="$HOME/.dotfiles"
REPO=https://github.com/fabriciorby/.dotfiles.git
BRANCH=nas
FORMULAS=(zsh starship fzf zoxide lsd bat git-delta ripgrep jq btop fastfetch stow tmux lazygit neovim zig cowsay cbonsai)

step() { printf '\n\033[1;34m==> %s\033[0m\n' "$*"; }

if [[ $EUID -eq 0 ]]; then
  echo "Rode como o seu usuário (o Homebrew não roda como root): su - fabriciorby" >&2
  exit 1
fi

# 1. git (fica no eMMC; some se um update do UGOS resetar o sistema)
if ! command -v git >/dev/null 2>&1; then
  step "Instalando git via apt (vai pedir sua senha do sudo)"
  sudo apt-get update
  # o apt do UGOS já veio com dependências quebradas (picom); confira antes:
  if sudo apt-get -s --fix-broken install | grep -q '^Remv'; then
    echo "O apt --fix-broken quer REMOVER pacotes. Parei. Rode 'apt-get -s --fix-broken install' e confira." >&2
    exit 1
  fi
  sudo apt-get --fix-broken install -y
  sudo apt-get install -y --no-install-recommends git
else
  step "git ok ($(git --version))"
fi

# 2. Homebrew (fica em /home, que no UGOS está no volume1)
if [[ ! -x $BREW_PREFIX/bin/brew ]]; then
  step "Instalando Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  step "Homebrew ok"
fi
eval "$($BREW_PREFIX/bin/brew shellenv)"

# 3. Ferramentas (brew pula as já instaladas)
missing=()
for f in "${FORMULAS[@]}"; do
  brew list --formula "$f" >/dev/null 2>&1 || missing+=("$f")
done
if ((${#missing[@]})); then
  step "brew install ${missing[*]}"
  brew install "${missing[@]}"
else
  step "Ferramentas ok"
fi

# 4. Dotfiles + zsh-defer
if [[ ! -d $DOTFILES/.git ]]; then
  step "Clonando dotfiles (branch $BRANCH)"
  git clone -b "$BRANCH" "$REPO" "$DOTFILES"
else
  step "Dotfiles ok ($(git -C "$DOTFILES" branch --show-current))"
fi
if [[ ! -d $DOTFILES/.scripts/zsh-defer ]]; then
  step "Clonando zsh-defer"
  git clone https://github.com/romkatv/zsh-defer.git "$DOTFILES/.scripts/zsh-defer"
fi

# 5. stow (sem folding: ~/.config fica pasta normal)
step "stow --no-folding"
(cd "$DOTFILES" && stow --no-folding -v .)

# 6. Login em bash -> exec zsh (se o zsh sumir, fica no bash)
MARK='# nas-bootstrap: zsh'
touch "$HOME/.bashrc"
if ! grep -qF 'brew shellenv' "$HOME/.bashrc"; then
  echo "eval \"\$($BREW_PREFIX/bin/brew shellenv bash)\"" >> "$HOME/.bashrc"
fi
if ! grep -qF "$MARK" "$HOME/.bashrc" && ! grep -qF 'exec /home/linuxbrew/.linuxbrew/bin/zsh' "$HOME/.bashrc"; then
  step "Adicionando exec zsh no ~/.bashrc"
  cat >> "$HOME/.bashrc" <<EOB

$MARK (se o zsh sumir, fica no bash)
case \$- in *i*) [ -x $BREW_PREFIX/bin/zsh ] && SHELL=$BREW_PREFIX/bin/zsh exec $BREW_PREFIX/bin/zsh -l ;; esac
EOB
fi
if [[ ! -f $HOME/.profile && ! -f $HOME/.bash_profile ]]; then
  echo '[ -f ~/.bashrc ] && . ~/.bashrc' > "$HOME/.profile"
fi

step "Pronto. Saia e entre de novo por SSH."
