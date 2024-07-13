# set some variables and defaults:
export EDITOR=/usr/bin/vim
export VISUAL=$EDITOR
export PAGER=/usr/bin/less
export LESS="-iqRx2"

# cd config:
setopt auto_cd
cdpath=($HOME $HOME/dev)

# history config:
HISTSIZE=50000
SAVEHIST=10000
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt inc_append_history
setopt share_history

# completion config:
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi
autoload -Uz compinit && compinit

# prompt config:
autoload -Uz promptinit && promptinit && prompt walters
setopt prompt_subst
setopt prompt_sp
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
RPS1='%F{green}%~${vcs_info_msg_0_}%f'
zstyle ':vcs_info:git:*' formats ' (%b)'
zstyle ':vcs_info:*' enable git

# execute additional local config:
if [[ -x ~/.zshrc_local ]]; then
  source ~/.zshrc_local
fi

# make zle use emacs mode:
bindkey -e
