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

if [ -d "/usr/local/lib/node" ]; then
   export NODE_PATH="/usr/local/lib/node"
fi

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

alias mongodbstart='mongod run --config /usr/local/Cellar/mongodb/1.8.2-x86_64/mongod.conf'

alias postgresstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias postgresstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

alias redisstart='redis-server /usr/local/etc/redis.conf'

alias pdfjoin='"/System/Library/Automator/Combine PDF Pages.action/Contents/Resources/join.py"'

alias l='ls $LS_OPTIONS -lA'
alias ll='ls $LS_OPTIONS -l'
alias ls='ls $LS_OPTIONS'

alias gitx='gitx --all'

if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi
