# ███████╗████████╗ █████╗ ██████╗     ███████╗██╗     ███████╗    ███████╗██╗     ███████╗███████╗████████╗
# ██╔════╝╚══██╔══╝██╔══██╗██╔══██╗    ██╔════╝██║     ██╔════╝    ██╔════╝██║     ██╔════╝██╔════╝╚══██╔══╝
# ███████╗   ██║   ███████║██████╔╝    █████╗  ██║     █████╗      █████╗  ██║     █████╗  █████╗     ██║
# ╚════██║   ██║   ██╔══██║██╔══██╗    ██╔══╝  ██║     ██╔══╝      ██╔══╝  ██║     ██╔══╝  ██╔══╝     ██║
# ███████║   ██║   ██║  ██║██║  ██║    ███████╗███████╗██║         ██║     ███████╗███████╗███████╗   ██║
# ╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝    ╚══════╝╚══════╝╚═╝         ╚═╝     ╚══════╝╚══════╝╚══════╝   ╚═╝
# *•.¸♡ *•.¸♡*•.¸♡*•.¸♡*•.¸♡*•.¸♡*•.¸♡ extra special zsh config ♡¸.•*♡¸.•*♡¸.•*♡¸.•*♡¸.•*♡¸.•*♡¸.•*♡¸.•*





# The next line enables Fig autocomplete, has a corresponding post hook at the bottom.
# Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

# Module that lets you profile your shell and find slow processes
zmodload zsh/zprof





#  __  __     __     _ __   ____
# /\ \/\ \  /'__`\  /\`'__\/',__\
# \ \ \_/ |/\ \L\.\_\ \ \//\__, `\
#  \ \___/ \ \__/.\_\\ \_\\/\____/
#   \/__/   \/__/\/_/ \/_/ \/___/

# Path to oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
# Changes OMZ
export ZSH_CUSTOM=~/.dotfiles/oh-my-zsh
# Set $SHELL because it gets overriden with Bash in Codespaces
export SHELL=zsh
# Terminal color stuff I don't understand
# TODO: research terminal colors one day
export TERM=xterm-256color
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nvim'
else
    export EDITOR='code'
fi
# Color theme for `bat` which I always forget to use
export BAT_THEME="ansi-dark"
# use extended glob patterning
setopt extendedglob





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
plugins=(git colored-man-pages sudo python pip brew zsh-autosuggestions)
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
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

# functions that scaffold out a dbt project with codegen
source dbt-scaffolding.sh






#         ___
#        /\_ \    __
#    __  \//\ \  /\_\     __      ____     __    ____
#  /'__`\  \ \ \ \/\ \  /'__`\   /',__\  /'__`\ /',__\
# /\ \L\.\_ \_\ \_\ \ \/\ \L\.\_/\__, `\/\  __//\__, `\
# \ \__/.\_\/\____\\ \_\ \__/.\_\/\____/\ \____\/\____/
#  \/__/\/_/\/____/ \/_/\/__/\/_/\/___/  \/____/\/___/

alias vi="nvim"
alias vim="nvim"
alias zc="code ~/.dotfiles/zshrc"
alias zr="exec $SHELL"
alias ohmyzsh="cd ~/.oh-my-zsh && code ."
alias vimconfig="code ~/.vim-config"
alias dbtprof="code ~/.dbt/profiles.yml"
alias dbtdoc="dbt docs generate && dbt docs serve"
alias sc="sc-im"
alias wthr="curl wttr.in/chicago"
alias dotz="cd ~/.dotfiles && code ."
alias cl="gcalcli"
alias cla="gcalcli agenda"
alias gch="omz plugin info git"
alias pu="cmus-remote --pause"
alias kb="cd /Users/grant/qmk_firmware/keyboards/splitkb/kyria/keymaps/gwenwindflower && vi"
alias spotify="spotifyd --config-path /Users/grant/.config/spotifyd/spotify.conf && spt"
alias notes="cd ~/dev/star-elf-guide && code ."
alias va="source .venv/bin/activate"
alias pyr="python -m pip install -r requirements.txt"
alias pypi="python -m pip"
alias bv="PYTHONPATH=~/dev/buenavista python3 ~/dev/buenavista/examples/duckdb_server.py ../jaffle-shop-guides/jaffle_shop_database.duckdb"
alias pipu="pip install --upgrade pip"
alias ll="ls -l"
alias la="ls -a"







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

# z
. /usr/local/etc/profile.d/z.sh

# Not currently doing much JS work and nvm is very slow -- look into lazy loading if you need to add it back -> https://blog.mattclemente.com/2020/06/26/oh-my-zsh-slow-to-load/
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/grant/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/grant/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/grant/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/grant/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"

# The next line updates PATH for Postgres.app CLI
PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

# crazy haskell stuff for tidalcycles
[ -f "/Users/grant/.ghcup/env" ] && source "/Users/grant/.ghcup/env" # ghcup-env

# no need for pyenv in codespaces
if ! $CODESPACES || [[ -v $CODESPACES ]]; then
    # initialize pyenv autocomplete, rehashes shims, and installs pyenv as a shell function
    eval "$(pyenv init -)";
fi

# enable starship prompt
eval "$(starship init zsh)"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/"