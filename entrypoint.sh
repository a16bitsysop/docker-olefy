#!/bin/sh
echo "\$OLEFY_BINDPORT= $OLEFY_BINDPORT"
echo "\$OLEFY_TMPDIR= $OLEFY_TMPDIR"
echo "\$OLEFY_LOGLVL= $OLEFY_LOGLVL"
echo "\$OLEFY_MINLENGTH= $OLEFY_MINLENGTH"
echo "\$OLEFY_DEL_TMP= $OLEFY_DEL_TMP"
echo "\$OLEFY_DEL_TMP_FAILED= $OLEFY_DEL_TMP_FAILED"
echo

NME=olefy
set-timezone.sh "$NME"

cp -a /home/"$NME"/profile /home/"$NME"/.profile
[ -n "$OLEFY_BINDPORT" ] && echo "export OLEFY_BINDPORT=$OLEFY_BINDPORT" >> /home/"$NME"/.profile
[ -n "$OLEFY_TMPDIR" ] && echo "export OLEFY_TMPDIR=$OLEFY_TMPDIR" >> /home/"$NME"/.profile
[ -n "$OLEFY_LOGLVL" ] && echo "export OLEFY_LOGLVL=$OLEFY_LOGLVL" >> /home/"$NME"/.profile
[ -n "$OLEFY_MINLENGTH" ] && echo "export OLEFY_MINLENGTH=$OLEFY_MINLENGTH" >> /home/"$NME"/.profile
[ -n "$OLEFY_DEL_TMP" ] && echo "export OLEFY_DEL_TMP=$OLEFY_DEL_TMP" >> /home/"$NME"/.profile
[ -n "$OLEFY_DEL_TMP_FAILED" ] && echo "export OLEFY_DEL_TMP_FAILED=$OLEFY_DEL_TMP_FAILED" >> /home/"$NME"/.profile

echo "Changing to user $NME"
su -c '/usr/local/bin/olefy.py' - "$NME"
