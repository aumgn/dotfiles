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

# More completions
fpath=(~/.local/share/zsh/zsh-completions/src $fpath)

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
source ~/.local/share/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# History Substring search
source ~/.local/share/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Auto suggestions
source ~/.local/share/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Prompt
source ~/.config/zsh/prompt

# New commands
source ~/.local/share/shell/z/z.sh
source ~/.local/share/zsh/k/k.sh

# Aliases
source ~/.config/shell/aliases
alias l="k -h --no-vcs"
alias ll="k -Ah --no-vcs"

