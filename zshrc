# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

#                                             WELCOME TO
#          ,,                                                                 ,,                           ,,
#        `7MM                                                               `7MM                         `7MM
#          MM                                                                 MM                           MM
#  ,p6"bo  MMpMMMb.   ,6"Yb.  `7Mb,od8 `7MMpMMMb.pMMMb.      ,pP"Ybd  ,p6"bo  MMpMMMb.  ,pW"Wq.   ,pW"Wq.  MM
# 6M'  OO  MM    MM  8)   MM    MM' "'   MM    MM    MM      8I   `" 6M'  OO  MM    MM 6W'   `Wb 6W'   `Wb MM
# 8M       MM    MM   ,pm9MM    MM       MM    MM    MM      `YMMMa. 8M       MM    MM 8M     M8 8M     M8 MM
# YM.    , MM    MM  8M   MM    MM       MM    MM    MM      L.   I8 YM.    , MM    MM YA.   ,A9 YA.   ,A9 MM
#  YMbmd'.JMML  JMML.`Moo9^Yo..JMML.   .JMML  JMML  JMML.    M9mmmP'  YMbmd'.JMML  JMML.`Ybmd9'   `Ybmd9'.JMML.

# *•.¸♡ *•.¸♡*•.¸♡*•.¸♡*•.¸♡*•.¸♡*•.¸♡ extra special zsh config ♡¸.•*♡¸.•*♡¸.•*♡¸.•*♡¸.•*♡¸.•*♡¸.•*♡¸.•*

# Module that lets you profile your shell and find slow processes
zmodload zsh/zprof

#  __  __     __     _ __   ____
# /\ \/\ \  /'__`\  /\`'__\/',__\
# \ \ \_/ |/\ \L\.\_\ \ \//\__, `\
#  \ \___/ \ \__/.\_\\ \_\\/\____/
#   \/__/   \/__/\/_/ \/_/ \/___/

# Path to oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
export ZSH_CUSTOM=~/.oh-my-zsh/custom
# Set $SHELL because it gets overriden with Bash in Codespaces
export SHELL=/bin/zsh
# Terminal color stuff I don't understand
# TODO: research terminal colors one day
export TERM=xterm-256color
export PYENV_ROOT="${HOME}/.pyenv"
# set rm-improved graveyard to trash
export GRAVEYARD=$HOME/.Trash
# Preferred editor for local and remote sessions
if [[ -n ${SSH_CONNECTION} ]]; then
    export EDITOR='nvim'
else
    export EDITOR='nvim'
fi
# Color theme for `bat` which I always forget to use
export BAT_THEME="Catppuccin-frappe"
# use extended glob patterning
setopt extendedglob

FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

#        ___
#       /\_ \                    __
#  _____\//\ \    __  __     __ /\_\    ___     ____
# /\ '__`\\ \ \  /\ \/\ \  /'_ `\/\ \ /' _ `\  /',__\
# \ \ \L\ \\_\ \_\ \ \_\ \/\ \L\ \ \ \/\ \/\ \/\__, `\
#  \ \ ,__//\____\\ \____/\ \____ \ \_\ \_\ \_\/\____/
#   \ \ \/ \/____/ \/___/  \/___L\ \/_/\/_/\/_/\/___/
#    \ \_\                   /\____/
#     \/_/                   \_/__/
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(alias-finder git colored-man-pages sudo python pip brew web-search)
source $ZSH/oh-my-zsh.sh

# load z move
autoload -U zmv

#    ___                         __
#  /'___\                       /\ \__  __
# /\ \__/  __  __    ___     ___\ \ ,_\/\_\    ___     ___     ____
# \ \ ,__\/\ \/\ \ /' _ `\  /'___\ \ \/\/\ \  / __`\ /' _ `\  /',__\
#  \ \ \_/\ \ \_\ \/\ \/\ \/\ \__/\ \ \_\ \ \/\ \L\ \/\ \/\ \/\__, `\
#   \ \_\  \ \____/\ \_\ \_\ \____\\ \__\\ \_\ \____/\ \_\ \_\/\____/
#    \/_/   \/___/  \/_/\/_/\/____/ \/__/ \/_/\/___/  \/_/\/_/\/___/
# make a subdirectory in a python project
function pydir() {
    mkdir $1 && touch $1/__init__.py
}

source ~/scripts/dbt_scaffolding.sh

function ya() {
	tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

#         ___
#        /\_ \    __
#    __  \//\ \  /\_\     __      ____     __    ____
#  /'__`\  \ \ \ \/\ \  /'__`\   /',__\  /'__`\ /',__\
# /\ \L\.\_ \_\ \_\ \ \/\ \L\.\_/\__, `\/\  __//\__, `\
# \ \__/.\_\/\____\\ \_\ \__/.\_\/\____/\ \____\/\____/
#  \/__/\/_/\/____/ \/_/\/__/\/_/\/___/  \/____/\/___/

alias python="python3"
alias vi="nvim"
alias vim="nvim"
alias zc="cd ~/dev/charm-school/ && vi zshrc"
alias zr="exec $SHELL"
alias ohmyzsh="cd ~/.oh-my-zsh && vi"
alias vimconfig="cd ~/.config/nvim && vi"
alias dbtprof="cd ~/.dbt && vi profiles.yml"
alias dbtdoc="dbt docs generate && dbt docs serve"
alias mfv="dbt parse && mf validate-configs"
alias sc="sc-im"
alias wthr="curl wttr.in/chicago"
alias dotz="cd ~/charm-school && vi"
alias cl="gcalcli"
alias cla="gcalcli agenda"
alias gch="omz plugin info git"
alias pu="cmus-remote --pause"
alias kb="cd ~/qmk_firmware/keyboards/splitkb/kyria/keymaps/gwenwindflower && vi"
alias spotify="spotify_player"
alias venv="python -m venv .venv"
alias va="source .venv/bin/activate"
alias venva="venv && va"
alias pir="python -m pip install -r requirements.txt"
alias pi="python -m pip"
alias piu="python -m pip install --upgrade"
alias piup="python -m pip install --upgrade pip"
alias vpi="venva && piup && pir"
alias bv="PYTHONPATH=~/dev/buenavista python3 ~/dev/buenavista/examples/duckdb_server.py ../jaffle-shop-guides/jaffle_shop_database.duckdb"
alias ls="exa"
alias ll="exa -l"
alias la="exa -a"
alias lla="exa -la"
alias lg="exa -alG --git"
alias ki="kitty +kitten icat"
alias fr="joshuto"
alias ddb="duckdb"
alias bri="brew update && brew upgrade && brew install"
alias pg="pgcli"
alias js="cd ~/dev/jaffle-shop && vi"

#  __                   ___
# /\ \__               /\_ \    __
# \ \ ,_\   ___     ___\//\ \  /\_\    ___      __
#  \ \ \/  / __`\  / __`\\ \ \ \/\ \ /' _ `\  /'_ `\
#   \ \ \_/\ \L\ \/\ \L\ \\_\ \_\ \ \/\ \/\ \/\ \L\ \
#    \ \__\ \____/\ \____//\____\\ \_\ \_\ \_\ \____ \
#     \/__/\/___/  \/___/ \/____/ \/_/\/_/\/_/\/___L\ \
#                                               /\____/
#                                               \_/__/
# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[[ -s "$NVM_DIR/nvm.sh" ]] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[[ -s "$NVM_DIR/bash_completion" ]] && \. "$NVM_DIR/bash_completion" # This loads completions

export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"

# The next line updates PATH for Postgres.app CLI
PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# crazy haskell stuff for tidalcycles
[ -f "/Users/winnie/.ghcup/env" ] && source "/Users/winnie/.ghcup/env" # ghcup-env

# no need for pyenv in codespaces
if [[ -z ${CODESPACES} ]]; then
    # initialize pyenv autocomplete, rehashes shims, and installs pyenv as a shell function
    eval "$(pyenv init -)"
fi

# enable zoxide, a Rust replacement for z
eval "$(zoxide init zsh)"

# enable starship prompt
eval "$(starship init zsh)"

# The next line updates PATH for the Google Cloud SDK.
if [[ -f '/Users/winnie/google-cloud-sdk/path.zsh.inc' ]]; then . '/Users/winnie/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [[ -f '/Users/winnie/google-cloud-sdk/completion.zsh.inc' ]]; then . '/Users/winnie/google-cloud-sdk/completion.zsh.inc'; fi

# remove duplicates from $PATH
typeset -U PATH

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc

# put go installed binaries on path
export PATH=$PATH:$(go env GOPATH)/bin

# set env vars for pop email cli
export POP_FROM=winnie@gwenwindflower.com

source ~/.env

# pnpm
export PNPM_HOME="/Users/winnie/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "/Users/winnie/.oh-my-zsh/completions/_bun" ] && source "/Users/winnie/.oh-my-zsh/completions/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

#zsh syntax highlighting and autosuggestions
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"


