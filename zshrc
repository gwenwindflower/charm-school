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

# function to time zsh startup
timezsh() {
	shell=${1-$SHELL}
	for i in $(seq 1 10); do
		/usr/bin/time $shell -i -c exit
	done
}

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

# we got all the colors in kitty bb
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
# so I alias it to `cat` in the aliases section
export BAT_THEME="Catppuccin-frappe"

# Color theme for `fzf` also Catppuccin Frappe
export FZF_DEFAULT_OPTS=" \
--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#e78284 \
--color=fg:#c6d0f5,header:#e78284,info:#ca9ee6,pointer:#f2d5cf \
--color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#e78284"

# use extended glob patterning
setopt extendedglob

# load homebrew zsh completions
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

# nvm is really slow so we lazy load it
# this means it will only load when you use a command that requires it
zstyle ':omz:plugins:nvm' lazy yes
zstyle ':omz:plugins:nvm' lazy-cmd eslint prettier typescript
# if there is an .nvmrc file in the current directory,
# autoload that node version with nvm when a node-related command is run
zstyle ':omz:plugins:nvm' autoload yes
# we can do this silently as the node env is displayed nicely in starship prompt
zstyle ':omz:plugins:nvm' silent-autoload yes
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
plugins=(aliases alias-finder git colored-man-pages nvm sudo 1password python golang pip brew jsontools web-search)
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
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias rr="z ~/dev/charm-school/ && vi zshrc"
alias ss="exec $SHELL"
alias oh="cd ~/.oh-my-zsh && vi"
alias bri="brew update && brew upgrade && brew install"
alias s="z"

# git tools
alias gdt="git dft"
alias gz="lazygit"
alias gho="gh repo view -w"
alias ghd="gh dash"

# dbt and data
alias dbtp="vi ~/.dbt/profiles.yml"
alias db="dbt build"
alias dbs="dbt build -s"
alias dt="dbt test"
alias dts="dbt test -s"
alias dr="dbt run"
alias drs="dbt run -s"
alias dp="dbt parse"
alias dmv="dbt parse && mf validate-configs"
alias dn="sunbeam xn"

# media and misc
alias c="clear"
alias cat="bat"
alias cc="cookiecutter"
alias kb="cd ~/qmk_firmware/keyboards/splitkb/kyria/keymaps/gwenwindflower && vi"
alias ddb="duckdb"
alias ki="kitty +kitten icat"
alias wthr="curl wttr.in/chicago"
alias moon="pyphoon"
alias moonl="pyphoon-lolcat"
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
alias vpi="venva && piup && pirr"
alias vpci="venva && piup && pc && pirr"
alias pyt="pytest"

# eza
alias l="eza -l"
alias ls="eza"
alias ll="eza -l"
alias la="eza -a"
alias lla="eza -la"
alias lg="eza -laG --git"

# frontend
alias nrd="pnpm dev"
alias nrb="pnpm build"
alias ni="pnpm i"
alias nu="pnpm up"

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

# Updates PATH for the Google Cloud SDK.
if [[ -f '/Users/winnie/google-cloud-sdk/path.zsh.inc' ]]; then . '/Users/winnie/google-cloud-sdk/path.zsh.inc'; fi

# Completions for gcloud.
if [[ -f '/Users/winnie/google-cloud-sdk/completion.zsh.inc' ]]; then . '/Users/winnie/google-cloud-sdk/completion.zsh.inc'; fi

# Enable forgit
[ -f $HOMEBREW_PREFIX/share/forgit/forgit.plugin.zsh ] && source $HOMEBREW_PREFIX/share/forgit/forgit.plugin.zsh

# remove duplicates from $PATH
typeset -U PATH

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc

# put go installed binaries on path
export PATH=$PATH:$(go env GOPATH)/bin

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

. "$HOME/.cargo/env"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
