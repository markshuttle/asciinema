#! /bin/sh

export LOCPATH=$SNAP_USER_DATA

LANG=en_US
ENC=UTF-8
LOC="$LANG.$ENC"

if [ ! -e $SNAP_USER_DATA/$LOC ]; then
  localedef --prefix=$SNAP_USER_DATA -f $ENC -i $LANG $SNAP_USER_DATA/$LOC
fi

export LC_ALL=$LOC
export LANG=$LOC
export LANGUAGE=${LANG%_*}

exec $SNAP/usr/bin/asciinema "$@"

