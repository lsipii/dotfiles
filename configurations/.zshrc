# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="jovial"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

ZSH_DISABLE_COMPFIX=true

# Check ifwre coming from ssh
SESSION_TYPE="local/sh"
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  SESSION_TYPE="remote/ssh"
else
  case $(ps -o comm= -p $PPID) in
    sshd|*/sshd) SESSION_TYPE="remote/ssh";;
  esac
fi

# Autostart tmux only locally and if non-attached
#if [ "$SESSION_TYPE" = "local/sh" ]; then 
#	if [ -z "$(tmux ls | grep attached)" ]; then
#    	ZSH_TMUX_AUTOSTART=true
#	fi
#fi

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions 
  zsh-syntax-highlighting
  urltools
  autojump
  tmux
  asdf
  pass
)

###
# zsh jovial theme
###

# Jovia theme and plugin
if [ ! -f ${HOME}/.oh-my-zsh/custom/themes/jovial.zsh-theme ]; then 
    echo "Installing zsh jovial theme.."
    curl -sSL -H 'Cache-Control: no-cache' https://github.com/zthxxx/jovial/raw/master/jovial.zsh-theme -o ${HOME}/.oh-my-zsh/custom/themes/jovial.zsh-theme
    curl -sSL -H 'Cache-Control: no-cache' https://github.com/zthxxx/jovial/raw/master/jovial.plugin.zsh -o ${HOME}/.oh-my-zsh/custom/plugins/jovial.plugin.zsh
fi

###
# Pre-init
###
if [ -f "${HOME}/.zshrc.local" ]; then 
    source "${HOME}/.zshrc.local"
fi

###
# Init actual
###
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# set colors for LS_COLORS
eval `dircolors ~/.dircolors`

###
# zsh jovial theme custom promt icons
###

# https://github.com/mintty/wsltty/issues/93#issuecomment-366135476
EMOJI=(🚀 🐧 🐳 💎 🍄 🐒 😻 🦄 🐪 🐢 🌷 🌍 🥘 🌈 🙉 🥇 🏆 🌞 🪐 🌙 🥃 🥂 🍻 🍺 🍸 🍩 🎂 🍜 🍣 🥡 🧂 🥙 🧆 🥪 🍕 🌭 🧀 🥞 🥖 🥐 🌶 🥑 🍆 🥔)
function zsh_random_emoji {
    echo -n "$EMOJI[$RANDOM%$#EMOJI+1]"
}

JOVIAL_SYMBOL[arrow]="➤ 🍀"
JOVIAL_SYMBOL[arrow.git-clean]="➤ $(zsh_random_emoji)"
JOVIAL_SYMBOL[arrow.git-dirty]="➤ $(zsh_random_emoji) ➤ 🔱"

###
## Local paths, preps
####
if [ -d ~/bin ]; then
    path+=~/bin
fi
if [ -d ~/.local/bin ]; then
    path+=~/.local/bin
fi
if [ -d ~/.yarn/bin ]; then
    path+=~/.yarn/bin
fi

# nodejs n-tool env
export N_PREFIX=$HOME/.local

# wtfutil environment
[[ -f ~/.config/wtf/.env ]] && source ~/.config/wtf/.env

# Witdev
if [ -f ${HOME}/Projects/witdev/shell-commands.sh ]; then
    source ${HOME}/Projects/witdev/shell-commands.sh
fi
# Install asdf
if [ ! -d ~/.asdf ]; then
    echo "Installing asdf.."
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf
fi
# Ensure gopath
[[ -d /usr/local/go/bin ]] && export PATH=$PATH:/usr/local/go/bin


###
# Aliases, funcs, etc.
###
if [ -f "${HOME}/.zshrc.aliases" ]; then 
    source "${HOME}/.zshrc.aliases"
fi

###
# Post-init
###

# Ensure home
cd

if [ -f "${HOME}/.zshrc.local-post-init" ]; then 
    source "${HOME}/.zshrc.local-post-init"
fi