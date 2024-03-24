# CodeWhisperer pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.pre.zsh"

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

# Toolfor profiling zsh startup
zmodload zsh/zprof

# load z move
autoload -U zmv

___
#       /\_ \                     __
#  _____\//\ \    __  __     __  /\_\     ___      ____
# /\ '__`\\ \ \  /\ \/\ \  /'_ `\\/\ \  /' _ `\   /',__\
# \ \ \L\ \\_\ \_\ \ \_\ \/\ \L\ \\ \ \ /\ \/\ \ /\__, `\
#  \ \ ,__//\____\\ \____/\ \____ \\ \_\\ \_\ \_\\/\____/
#   \ \ \/ \/____/ \/___/  \/___L\ \\/_/ \/_/\/_/ \/___/
#    \ \_\                   /\____/
#     \/_/                   \_/__/
#
# Starship prompt
eval "$(starship init zsh)"

# Atuin magical shell history
eval "$(atuin init zsh)"

# Zoxide, a Rust replacement for z, which is a replacement for cd
eval "$(zoxide init zsh)"

# OMZ plugins
plugins=(aliases bun git gh colored-man-pages nvm sudo python golang pip brew jsontools)

# Lazy load nvm
zstyle ':omz:plugins:nvm' lazy yes
zstyle ':omz:plugins:nvm' lazy-cmd bun eslint prettier typescript
# if there is an .nvmrc file in the current directory,
# autoload that node version with nvm when a node-related command is run
zstyle ':omz:plugins:nvm' autoload yes
# we can do this silently as the node env is displayed nicely in starship prompt
zstyle ':omz:plugins:nvm' silent-autoload yes

# Initialize oh-my-zsh
source $ZSH/oh-my-zsh.sh

#Enable custom zsh plugins
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/forgit/forgit.plugin.zsh

#                                   /\_ \           /\ \__  __
#   ___     ___     ___ ___    _____\//\ \       __ \ \ ,_\/\_\     ___     ___      ____
#  /'___\  / __`\ /' __` __`\ /\ '__`\\ \ \    /'__`\\ \ \/\/\ \   / __`\ /' _ `\   /',__\
# /\ \__/ /\ \L\ \/\ \/\ \/\ \\ \ \L\ \\_\ \_ /\  __/ \ \ \_\ \ \ /\ \L\ \/\ \/\ \ /\__, `\
# \ \____\\ \____/\ \_\ \_\ \_\\ \ ,__//\____\\ \____\ \ \__\\ \_\\ \____/\ \_\ \_\\/\____/
#  \/____/ \/___/  \/_/\/_/\/_/ \ \ \/ \/____/ \/____/  \/__/ \/_/ \/___/  \/_/\/_/ \/___/
#                                \ \_\
#                                 \/_/
# Completions
# Load homebrew completions
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
# Load oh-my-zsh completions
FPATH="${ZSH_COMP}:${FPATH}"
# Initialize completions
autoload -Uz compinit && compinit

# CodeWhisperer post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh"
