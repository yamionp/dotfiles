# completion
autoload -Uz compinit && compinit

# メモリに保存される履歴の件数
export HISTSIZE=100000

# 履歴ファイルに保存される履歴の件数
export SAVEHIST=1000000

# 重複を記録しない
setopt hist_ignore_dups

# 開始と終了を記録
setopt EXTENDED_HISTORY

# ヒストリを呼び出してから実行する間に一旦編集可能
setopt hist_verify

# ヒストリをタブ・ウィンドウ間で共有
setopt share_history

# ヒストリコマンドをヒストリに保存しない
setopt hist_no_store

# PATH
ZSHRC_EXTRA_PATH="$HOME/bin"
PATH="$ZSHENV_EXTRA_PATH:$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# alias

## clipboard direct
alias cjq="pbpaste | jq"
alias cb64="pbpaste | base64 --decode"

## clipboard history
alias chsave='pbpaste > ~/.cache/pbpaste/`date +"%Y%m%d_%H%M%S"`'
alias chls='ls -t ~/.cache/pbpaste/* | head -n 50'
alias chload='ls -t ~/.cache/pbpaste/* | head -n 1 | xargs cat'
alias chclean='rm ~/.cache/pbpaste/*'
alias chjq="chload | jq"
alias chb64="chload | base64 --decode"

# starship
eval "$(starship init zsh)"

PATH="$ZSHRC_EXTRA_PATH:$PATH"
