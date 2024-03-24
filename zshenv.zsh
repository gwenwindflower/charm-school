source "$HOME/.cargo/env"
# Import personal aliases and functions
source "$HOME/.env"
source "$HOME/scripts/gh_copilot.sh"
source "$HOME/scripts/utils.sh"
source "$HOME/scripts/dbt_scaffolding.sh"

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
export ZSH_COMP="$HOME/.oh-my-zsh/completions"
# Set $SHELL because it gets overriden with Bash in Codespaces
export SHELL=/bin/zsh

# We got all the colors in kitty bb
export TERM=xterm-256color
# use extended glob patterning
setopt extendedglob

# Preferred editor for local and remote sessions
export EDITOR='nvim'
# example of how to set up a conditional EDITOR
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='nvim'

# # Figure out how to lazy load this
# export AWS_ACCESS_KEY_ID=$(aws configure get default.aws_access_key_id)
# export AWS_SECRET_ACCESS_KEY=$(aws configure get default.aws_secret_access_key)
