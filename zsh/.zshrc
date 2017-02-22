#########
# Zshrc #
#########

if [[ $TERM == "dumb" ]]; then
       unsetopt zle
       PS1='$ '
       return
fi

# Keybindings
bindkey -e
bindkey \^U backward-kill-line
bindkey ';5D' emacs-backward-word
bindkey ';5C' emacs-forward-word
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char

# Completion
autoload -U compinit
compinit
setopt completealiases
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${ZDOTDIR:-$HOME}/.zcompcache"

# History
setopt BANG_HIST
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILE=~/.zhistory

# Syntax Highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# History Substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Prompt
autoload promptinit
promptinit

function prompt_aumgn_setup {
  setopt LOCAL_OPTIONS
  unsetopt XTRACE KSH_ARRAYS
  prompt_opts=(cr percent subst)

  # Customizable parameters.
  local max_path_chars=30
  local success='%F{071}'
  local failure='%F{124}'
  local dir='%F{008}'

  # Define prompts.
  PROMPT="%(?.${success}.${failure})%(!.%m%B ❯❯❯%b.${SSH_TTY:+%m }%B❯%b)%f "
  RPROMPT="${dir}%~%f %(?.${success}✔.${failure}%? ✘)%f"
}

prompt_aumgn_setup

# Commands
source ~/.k/k.sh
alias l="k -Ah --no-vcs"
alias ll="k -h --no-vcs"
alias ec="emacs -nw"
