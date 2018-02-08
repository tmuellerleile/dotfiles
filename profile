export LC_ALL="de_DE.UTF-8"

export HISTIGNORE="&:[ ]*:ls*:bg:fg:history:git cherry-pick*:git show [a-f0-9]*"
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILESIZE=10000
shopt -s histappend

export CDPATH=".:~:~/dev"
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH

export NODE_PATH=/usr/local/lib/node:/usr/local/share/npm/lib/node_modules

if [[ $SSH_CONNECTION ]]; then
    export EDITOR=/usr/bin/vim
    export VISUAL=$EDITOR
    eval `/usr/bin/ssh-agent -s` > /dev/null
else
    export EDITOR=/usr/local/bin/mvim # make mvim the default editor if we're on a local terminal
    alias vim=/usr/local/bin/mvim # ... and even remap vim to mvim
    export VISUAL="/usr/local/bin/mvim -f"
fi

export PAGER=/usr/bin/less
export LESS="-iqRx2"

alias pdfjoin='"/System/Library/Automator/Combine PDF Pages.action/Contents/Resources/join.py"'

alias l='ls $LS_OPTIONS -lA'
alias ll='ls $LS_OPTIONS -l'
alias ls='ls $LS_OPTIONS'

alias rgrep='grep -r'
alias top='top -u'

alias jslint='jslint --vars --sloppy --node --color --white --plusplus'

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

function ssh {
    term_save=$TERM
    TERM=xterm-color
    /usr/bin/ssh "$@"
    TERM=$term_save
}

prompt_git() {
    git branch &>/dev/null || return 1
    HEAD="$(git symbolic-ref HEAD 2>/dev/null)"
    BRANCH="${HEAD##*/}"
    status="$(git status -s 2>/dev/null)"
    # borrowed from github.com/cowboy/dotfiles:
    flags="$(
    echo "$status" | awk 'BEGIN {s="";d="";m="";u=""} \
      /^M/    {s="+"}\
      /^D/    {d="-"}\
      /^.M/   {m="!"}\
      /^\?\?/ {u="?"}\
      END {print s d m u}'
    )"
    printf '(%s)' "${BRANCH:-unknown}${flags}"
}

COLOR_USER='\[\e[1;36m\]'
COLOR_HOSTNAME='\[\e[1;33m\]'
COLOR_WD='\[\e[0;36m\]'
COLOR_RESET='\[\e[0m\]'

prompt_on() {
    PS1='['${COLOR_USER}'\u'${COLOR_RESET}'@'${COLOR_HOSTNAME}'\h'${COLOR_RESET}':'${COLOR_WD}'\W'${COLOR_RESET}']$(prompt_git) \$ '
}
prompt_on

prompt_off() {
    PS1='$ '
}

if [ -x ~/.profile_local ]; then
  source ~/.profile_local
fi
