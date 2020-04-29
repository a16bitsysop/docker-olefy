#!/bin/sh
echo '$TIMEZONE=' $TIMEZONE
echo

NME=olefy

if [ -n "$TIMEZONE" ]
then
  apk add --no-cache tzdata
  if [ -f /usr/share/zoneinfo/"$TIMEZONE" ]
  then
    echo "Setting timezone to $TIMEZONE"
    cp /usr/share/zoneinfo/"$TIMEZONE" /etc/localtime
    echo "$TIMEZONE" > /etc/timezone
  else
    echo "$TIMEZONE does not exist"
  fi
  apk del tzdata
fi

echo "Starting olefy at $(date +'%x %X')"
echo "Changing to user $NME"
su -c '/usr/local/bin/olefy.py' - "$NME"
