export LANG="de_DE.UTF-8"
export LANGUAGE="de"
export LC_CTYPE="de_DE.UTF-8"
export LC_ALL="de_DE.UTF-8"

export HISTCONTROL="ignoreboth"
export HISTSIZE=10000
export SAVEHIST=10000
export HISTFILESIZE=10000

export CDPATH=~:~/dev
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

export NODE_PATH=/usr/local/lib/node:/usr/local/lib/node_modules

if [ ! -z "$DISPLAY" ]; then
    export EDITOR=/usr/local/bin/mvim # make mvim the default editor if we're on a local terminal
    alias vim=/usr/local/bin/mvim # ... and even remap vim to mvim
    export VISUAL="/usr/local/bin/mvim -f"
else
    export EDITOR=/usr/bin/vim
    export VISUAL=$EDITOR
fi

export PAGER=/usr/bin/less
export LESS="-iqrx4"

# some convenience commands:
alias mysqlstart='mysqld_safe --datadir=/usr/local/var/mysql &'
alias mysqlstop='mysqladmin -u root -p shutdown'

alias mongodbstart='mongod run --config /usr/local/Cellar/mongodb/2.0.2-x86_64/mongod.conf'

alias postgresstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias postgresstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

alias redisstart='redis-server /usr/local/etc/redis.conf'

alias pdfjoin='"/System/Library/Automator/Combine PDF Pages.action/Contents/Resources/join.py"'

alias l='ls $LS_OPTIONS -lA'
alias ll='ls $LS_OPTIONS -l'
alias ls='ls $LS_OPTIONS'

alias gitx='gitx --all'

alias mkpasswd="NUMCHARS=${1:-"8"} && LC_ALL=C && cat /dev/urandom | tr -dc [:alnum:] | head -c$NUMCHARS && echo"

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

function ssh {
    term_save=$TERM
    TERM=xterm-color
    /usr/bin/ssh "$@"
    TERM=$term_save
}
