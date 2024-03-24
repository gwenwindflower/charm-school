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
alias ss="z ~/dev/charm-school/ && nvim zshrc"
alias oo="z ~/.oh-my-zsh/ && nvim"
alias rr="exec $SHELL"
alias e="clear"
alias er="clear && exec $SHELL"
alias s="z"

# git tools
alias gdt="git dft"
alias gz="lazygit"
alias gho="gh repo view -w"
alias ghd="gh dash"
alias gdc="gd --cached"
alias gcmm="meteor"

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
alias af="als"
alias bri="brew update && brew upgrade && brew install"
alias bu="brew update && brew upgrade"
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
alias t="task"

# python
alias p="python3"
alias python="python3"
alias venv="uv venv .venv"
alias va="source .venv/bin/activate"
alias da="deactivate"
alias venva="venv && va"
alias pi="uv pip"
alias pir="uv pip install -r"
alias pirr="uv pip install -r requirements.txt"
alias pc="uv pip compile requirements.in -o requirements.txt"
alias psy="uv pip sync requirements.txt"
alias pcy="pc && pirr && psy"
alias piup="uv pip install --upgrade pip"
alias vpi="venva && piup && pirr"
alias vpci="venva && piup && pc && pirr"
alias pyt="pytest"
alias pd="uv pip install -e ."

# go
alias gorm="go run main.go"
alias gord="go run ."
alias gotv="go test -v"

# eza
alias l="eza -l"
alias ls="eza"
alias ll="eza -l"
alias la="eza -a"
alias lla="eza -la"
alias lg="eza -laG --git"

# frontend
alias ni="pnpm i"
alias nu="pnpm up"
alias nd="pnpm dev"
alias nb="pnpm build"
alias bi="bun install"
alias bd="bun dev"
alias ad="astro dev"

#    ___                         __
#  /'___\                       /\ \__  __
# /\ \__/  __  __    ___     ___\ \ ,_\/\_\    ___     ___     ____
# \ \ ,__\/\ \/\ \ /' _ `\  /'___\ \ \/\/\ \  / __`\ /' _ `\  /',__\
#  \ \ \_/\ \ \_\ \/\ \/\ \/\ \__/\ \ \_\ \ \/\ \L\ \/\ \/\ \/\__, `\
#   \ \_\  \ \____/\ \_\ \_\ \____\\ \__\\ \_\ \____/\ \_\ \_\/\____/
#    \/_/   \/___/  \/_/\/_/\/____/ \/__/ \/_/\/___/  \/_/\/_/\/___/

# function to make a directory in a python package project with __init__.py
function pd() {
	mkdir $1 && touch $1/__init__.py
}

# functions for wrapping dbt codegen
source ~/scripts/dbt_scaffolding.sh

# functions for wrapping gh CLI copilot commands
source ~/scripts/gh_copilot.sh

# open yazi and exit to directory navigated to
function ff() {
	tmp="$(mktemp -t "yazi-cwd.XXXXX")"
	yazi --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# function to get code suggestions from Gemma
function mc() {
	local file_name=$1
	mods -m gemma "How would you improve the code in this file?" <$file_name | glow
}

# function to get a code explanation from Gemma
function mp() {
	mods -m gemma "Can you explain this code?" <<<"$(pbpaste)" | glow
}

# function to copy a enviornment variable to the clipboard
function cpenv() {
	printenv $1 | pbcopy
}

# function to time zsh startup
function timezsh() {
	shell=${1-$SHELL}
	for i in $(seq 1 10); do
		/usr/bin/time $shell -i -c exit
	done
}
