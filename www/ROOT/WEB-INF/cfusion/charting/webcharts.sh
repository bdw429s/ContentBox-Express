#!/bin/sh

# This requires at least a 1.4 JVM to run properly.

CFUSION_HOME=

# This sets JAVACMD
. $CFUSION_HOME/bin/findjava.sh

cd $CFUSION_HOME/charting

${_JAVACMD} -jar $CFUSION_HOME/lib/wc50.jar 










