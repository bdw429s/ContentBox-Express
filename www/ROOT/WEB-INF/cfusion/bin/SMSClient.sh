#!/bin/sh

CFUSION_HOME=
if [ "$CFUSION_HOME" = "" ]; then
    echo CFUSION_HOME not set.  Please set CFUSION_HOME to your CFMX root directory
	exit 1
fi

# Sets _JAVACMD
. $CFUSION_HOME/bin/findjava.sh

if test -f '/etc/SuSE-release'
then
	SUSEFLAG=`grep 'SuSE Linux 8.1' /etc/SuSE-release 2> /dev/null`
	if [ ! "$SUSEFLAG" ]; then
		LD_ASSUME_KERNEL=2.2.9
		export LD_ASSUME_KERNEL
	fi
fi

# Finally, call java class with the found settings
${_JAVACMD} -jar $CFUSION_HOME/lib/smpp.jar 
