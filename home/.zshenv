autoload -Uz compinit # 保管機能を有効にする
compinit # 実行する

# homebrew
HOMEBREW_INSTALL="/opt/homebrew"
export HOMEBREW_CACHE="/opt/homebrew/cache"
ZSHENV_EXTRA_PATH=".:$HOMEBREW_INSTALL/bin"
eval "$(/opt/homebrew/bin/brew shellenv)"

# rye
source "$HOME/.rye/env"

# asdf
. "$HOME/.asdf/asdf.sh"
fpath=(${ASDF_DIR}/completions $fpath)

### Google Cloud SDK
GOOGLE_CLOUD_SDK=$HOME/.google-cloud-sdk
export GOOGLE_CLOUD_SDK

if [ -d "$HOME/.cargo" ]; then
    source $HOME/.cargo/env
    ZSHENV_EXTRA_PATH="$HOME/.cargo/bin:$ZSHENV_EXTRA_PATH"
fi
if [ -d "$GOOGLE_CLOUD_SDK" ]; then
    ZSHENV_EXTRA_PATH="$GOOGLE_CLOUD_SDK/bin:$ZSHENV_EXTRA_PATH"
    source $GOOGLE_CLOUD_SDK/completion.zsh.inc
fi

export ZSHENV_EXTRA_PATH
