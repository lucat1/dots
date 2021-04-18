core=/var/db/kiss/repo
luca=/var/db/kiss/luca
community=/var/db/kiss/community

export KISS_PATH=$core/core
KISS_PATH=$KISS_PATH:$core/extra
KISS_PATH=$KISS_PATH:$core/xorg
KISS_PATH=$KISS_PATH:$luca
KISS_PATH=$KISS_PATH:$community/community
