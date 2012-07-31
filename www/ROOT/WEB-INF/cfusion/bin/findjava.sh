#!/bin/sh
# Look for a workable Java executable.

_JAVACMD=""

# first try standalone jre
if [ -x $CFUSION_HOME/runtime/jre/bin/java ]
then
	_JAVACMD=$CFUSION_HOME/runtime/jre/bin/java

# next try multi-server install in <jrun-root>/jre
elif [ -x $CFUSION_HOME/../../../../../../jre/bin/java ]
then
	_JAVACMD=$CFUSION_HOME/../../../../../../jre/bin/java

# standalone but CFUSION_HOME not defined and in scripts directory
elif [ -x ../runtime/jre/bin/java ]
then
	_JAVACMD=../runtime/jre/bin/java

# pointed to by JAVA_HOME
elif [ "$JAVA_HOME" != "" -a -x "$JAVA_HOME/bin/java" ]
then
	_JAVACMD=$JAVA_HOME/bin/java

# in the system path
else
	type java > /dev/null 2>&1 
	if [ $? -eq 0 ]
	then
		_JAVACMD=java
	fi
fi

if [ -z "${_JAVACMD}" ]
then
	echo ""
	echo "Unable to find java command. Please set the JAVA_HOME environment variable."
	echo ""
	exit 1
fi
