# CodeWhisperer pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zprofile.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zprofile.pre.zsh"

# Homebrew environment setup
# I have one Mac Silicon and one Intel Mac so I have to check both places
if command -v brew >/dev/null 2>&1; then
	eval "$(brew shellenv)"
elif [[ -d "/opt/homebrew/bin" ]]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -d "/usr/local/homebrew/bin" ]]; then
	eval "$(/usr/local/homebrew/bin/brew shellenv)"
else
	echo "Brew doesn't seem to be installed"
fi

#                  __     __
#                 /\ \__ /\ \
#  _____      __  \ \ ,_\\ \ \___
# /\ '__`\  /'__`\ \ \ \/ \ \  _ `\
# \ \ \L\ \/\ \L\.\_\ \ \_ \ \ \ \ \
#  \ \ ,__/\ \__/.\_\\ \__\ \ \_\ \_\
#   \ \ \/  \/__/\/_/ \/__/  \/_/\/_/
#    \ \_\
#     \/_/
## Constructing PATH
# We use a case statement to check if the path is already in the PATH
# If it is, we don't add it again. This is to prevent duplicates,
# which can cause build up sometimes.
function check_path() {
	case ":$PATH:" in
	*":$1:"*) ;;
	*) export PATH="$1:$PATH" ;;
	esac
}
# Dedupe PATH function
function dedupe_path() {
	typeset -U PATH
}
# Poetry path
check_path "$HOME/.poetry/bin"
# Various things like Pipx
check_path "$HOME/.local/bin"
# Ruby Gems path
check_path "$HOME/.gem/ruby/2.6.0/bin"
# Rust and Cargo
export CARGO_HOME="$HOME/.cargo/"
check_path "$CARGO_HOME/bin"
source "$CARGO_HOME/env"
# Go path
export GO_HOME="$(go env GOPATH)"
check_path "$GO_HOME/bin"
## pnpm path
export PNPM_HOME="/Users/winnie/Library/pnpm"
check_path "$PNPM_HOME"
# bun path
export BUN_INSTALL="$HOME/.bun"
check_path "$BUN_INSTALL/bin"
# Snowflake CLI
check_path "/Applications/SnowSQL.app/Contents/MacOS"
# Postgres.app
check_path "/Applications/Postgres.app/Contents/Versions/latest/bin:"

# GCloud (it sets the PATH so we don't do it explicity)
if [[ -f "/Users/winnie/google-cloud-sdk/path.zsh.inc" ]]; then source "/Users/winnie/google-cloud-sdk/path.zsh.inc"; fi

dedupe_path() export PYENV_ROOT="${HOME}/.pyenv" # Set directory where pyenv stores its versions

# Set rm-improved (`rip`) graveyard to MacOS Trash
export GRAVEYARD=$HOME/.Trash

#   __     __
# /\ \__ /\ \
# \ \ ,_\\ \ \___       __     ___ ___       __     ____
#  \ \ \/ \ \  _ `\   /'__`\ /' __` __`\   /'__`\  /',__\
#   \ \ \_ \ \ \ \ \ /\  __/ /\ \/\ \/\ \ /\  __/ /\__, `\
#    \ \__\ \ \_\ \_\\ \____\\ \_\ \_\ \_\\ \____\\/\____/
#     \/__/  \/_/\/_/ \/____/ \/_/\/_/\/_/ \/____/ \/___/
# Theming for tools
# Color theme for `bat` which I always forget to use
# so I alias it to `cat` in the aliases section
export BAT_THEME="Catppuccin-frappe"

# Color theme for `fzf` also Catppuccin Frappe
export FZF_DEFAULT_OPTS=" \
--color=bg+:#414559,bg:#303446,spinner:#f2d5cf,hl:#f4b8e4	 \
--color=fg:#c6d0f5,header:#f4b8e4	,info:#ca9ee6,pointer:#f2d5cf \
--color=marker:#f2d5cf,fg+:#c6d0f5,prompt:#ca9ee6,hl+:#f4b8e4	"

# CodeWhisperer post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zprofile.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zprofile.post.zsh"
