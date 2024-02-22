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

# set directory where pyenv stores its versions
export PYENV_ROOT="${HOME}/.pyenv"

# set rm-improved (`rip`) graveyard to trash
export GRAVEYARD=$HOME/.Trash

# Preferred editor locally
export EDITOR='nvim'
# if you want to set a different editor for remote sessions, you can do so here
if [[ -n ${SSH_CONNECTION} ]]; then
	export EDITOR='nvim'
fi

# set AWS env vars, you'll need to authenticate through awscli for this to work
export AWS_ACCESS_KEY_ID=$(aws configure get default.aws_access_key_id)
export AWS_SECRET_ACCESS_KEY=$(aws configure get default.aws_secret_access_key)

# Color theme for `bat` which I always forget to use
export BAT_THEME="Catppuccin-frappe"

# use extended glob patterning
setopt extendedglob

# load homebrew zsh completions
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

# nvm is slow, we use zsh-nvm to wrap it and allow lazy loading
export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true

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
# Add more plugins wisely, as too many plugins slow down shell startup
plugins=(alias-finder git colored-man-pages zsh-nvm sudo python golang pip brew jsontools web-search)
# you can get custom web search plugins with the following config
ZSH_WEB_SEARCH_ENGINES=(perplexity "https://www.perplexity.ai/search?q=")

# initialize oh-my-zsh
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

# make a subdirectory in a python package project
# these often require an __init__.py file to be recognized as a package
function pydir() {
	mkdir $1 && touch $1/__init__.py
}

# functions for wrapping dbt codegen
source ~/scripts/dbt_scaffolding.sh

# open yazi and exit to directory navigated to
function ff() {
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

# shell and editor
alias vi="nvim"
alias vim="nvim"
alias zc="z ~/dev/charm-school/ && vi zshrc"
alias zr="exec $SHELL"
alias ohmyzsh="cd ~/.oh-my-zsh && vi"
alias vc="z ~/.config/nvim && vi"
alias dot="z ~/dev/charm-school && vi"
alias bri="brew update && brew upgrade && brew install"

# git
alias gch="omz plugin info git"
alias gho="gh repo view -w"

# dbt and data
alias dbtprof="cd ~/.dbt && vi profiles.yml"
alias dbtdoc="dbt docs generate && dbt docs serve"
alias mfv="dbt parse && mf validate-configs"
alias ddb="duckdb"
alias hq="harlequin"
alias js="cd ~/dev/jaffle-shop && vi"

# media and misc
alias kb="cd ~/qmk_firmware/keyboards/splitkb/kyria/keymaps/gwenwindflower && vi"
alias sc="sc-im"
alias ki="kitty +kitten icat"
alias wthr="curl wttr.in/chicago"
alias pu="cmus-remote --pause"
alias spotify="spotify_player"
alias pg="pgcli"
alias yt="youtube"
alias ytdl="youtube-dl"
alias gdl="gallery-dl"
alias ppl="web_search perplexity"

# python
alias python="python3"
alias venv="uv venv .venv"
alias va="source .venv/bin/activate"
alias venva="venv && va"
alias pi="uv pip"
alias pir="uv pip install -r"
alias pirr="uv pip install -r requirements.txt"
alias pc="uv pip compile requirements.in -o requirements.txt"
alias piup="uv pip install --upgrade pip"
alias vpi="venva && piup && pc && pirr"

# eza
alias ls="eza"
alias ll="eza -l"
alias la="eza -a"
alias lla="eza -la"
alias lg="eza -alG --git"

# frontend
alias nrd="pnpm dev"
alias nrb="pnpm build"
alias ni="pnpm i"

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

# Add ruby gems to PATH
export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"

# Add cargo to PATH
export PATH="$HOME/.cargo/bin:$PATH"

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

# set private env vars
source ~/.env

# pnpm
export PNPM_HOME="/Users/winnie/Library/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# bun completions
[ -s "/Users/winnie/.oh-my-zsh/completions/_bun" ] && source "/Users/winnie/.oh-my-zsh/completions/_bun"
[ -s "/Users/winnie/.bun/_bun" ] && source "/Users/winnie/.bun/_bun"

#atuin
eval "$(atuin init zsh)"

#enable custom zsh plugins
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
. "$HOME/.cargo/env"
