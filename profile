export LANG="de_DE.UTF-8"
export LANGUAGE="de"
export LC_CTYPE="de_DE.UTF-8"
export LC_ALL="de_DE.UTF-8"

export HISTCONTROL="ignoreboth"
export HISTIGNORE="ls:bg:fg:history"
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILESIZE=10000
shopt -s histappend

export CDPATH=".:~:~/dev"
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/share/npm/bin:$PATH

export NODE_PATH=/usr/local/lib/node:/usr/local/share/npm/lib/node_modules
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

if [[ $SSH_CONNECTION ]]; then
    export EDITOR=/usr/bin/vim
    export VISUAL=$EDITOR
else
    export EDITOR=/usr/local/bin/mvim # make mvim the default editor if we're on a local terminal
    alias vim=/usr/local/bin/mvim # ... and even remap vim to mvim
    export VISUAL="/usr/local/bin/mvim -f"
fi

export PAGER=/usr/bin/less
export LESS="-iqrx4"

# some convenience commands:
alias mysqlstart='mysqld_safe --datadir=/usr/local/var/mysql &'
alias mysqlstop='mysqladmin -u root -p shutdown'

alias mongodbstart='mongod run --config /usr/local/etc/mongod.conf'

alias postgresstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias postgresstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

alias redisstart='redis-server /usr/local/etc/redis.conf'

alias pdfjoin='"/System/Library/Automator/Combine PDF Pages.action/Contents/Resources/join.py"'

alias l='ls $LS_OPTIONS -lA'
alias ll='ls $LS_OPTIONS -l'
alias ls='ls $LS_OPTIONS'

alias rgrep='grep -r'

alias gitx='gitx --all'

alias jslint='jslint --vars --sloppy --node --color --white --plusplus'

mkpasswd() {
    NUMCHARS=${1:-"8"} && LC_ALL=C && cat /dev/urandom | tr -dc [:alnum:] | head -c$NUMCHARS && echo
}

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
    [[ -n "$(git status 2>/dev/null | grep -F 'working directory clean')" ]] || STATUS='!'
    printf '(%s)' "${BRANCH:-unknown}${STATUS}"
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
