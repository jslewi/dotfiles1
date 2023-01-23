# History

HISTFILE=~/.cache/zsh/histfile 
HISTSIZE=5000
SAVEHIST=5000

setopt extendedhistory histignoredups histreduceblanks histfindnodups histreduceblanks
setopt sharehistory appendhistory incappendhistory histexpiredupsfirst



# Window title                  

autoload -Uz vcs_info
case $TERM in
  termite|*xterm*|rxvt-unicode|rxvt-unicode-256color|(dt|k|E)term)
    precmd () {
      vcs_info
      print -Pn "\e]0;[%n@%M][%~]%#\a"
    }
    preexec () { print -Pn "\e]0;[%n@%M][%~]%# ($1)\a" }
    ;;
  screen|screen-256color|tmux|tmux-256color)
    precmd () { 
      vcs_info
      print -Pn "\e]83;title \"$1\"\a" 
      print -Pn "\e]0;$TERM - (%L) [%n@%M]%# [%~]\a" 
    }
    preexec () { 
      print -Pn "\e]83;title \"$1\"\a" 
      print -Pn "\e]0;$TERM - (%L) [%n@%M]%# [%~] ($1)\a" 
    }
    ;; 
esac

setopt autocd beep extendedglob nomatch notify correctall
bindkey -v  # set vim bindings


zstyle :compinstall filename '/home/john/.zshrc'

# Completion                  

autoload -Uz compinit
compinit

zstyle ':completion:*' menu select

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ -n "$key[Up]"   ]] && bindkey -- "$key[Up]"   up-line-or-beginning-search
[[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search

COMPDUMPFILE=~/.cache/zsh/zcompdump

# dircolors                  
# eval "$(dircolors ~/.config/ls/dir_colors) &> /dev/null"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# prompt                  
fpath=(~/.config/zsh $fpath)
echo "Prompt init ..."
autoload -Uz promptinit
promptinit
prompt elite2 yellow

# Variables

export BROWSER="firefox"
export EDITOR="nvim"

# ShellFuncs

# -- coloured manuals
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

# Aliases 

alias ls='ls --color=always -F --group-directories-first'
alias la='ls --color=always -F --group-directories-first -aH1'
alias ll='ls --color=always -F --group-directories-first -lAH1'
alias xup='xrdb ~/.Xresources'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

