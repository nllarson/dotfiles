# /etc/profile: system-wide .profile file for the Bourne shell (sh(1))
# and Bourne compatible shells (bash(1), ksh(1), ash(1), ...).

if [ -d /etc/profile.d ]; then
  for i in /etc/profile.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi

if [ "$PS1" ]; then
  if [ "$BASH" ]; then
    PS1='\u@\h:\w\$ '
    if [ -f /etc/bash.bashrc ]; then
	. /etc/bash.bashrc
    fi
  else
    if [ "`id -u`" -eq 0 ]; then
      PS1='# '
    else
      PS1='$ '
    fi
  fi
fi

umask 022

JAVA_HOME=/usr/local/devtools/java/current
export JAVA_HOME

GRAILS_HOME=/usr/local/devtools/grails/current
export GRAILS_HOME

IDEA_HOME=/usr/local/devtools/intellij/current
export IDEA_HOME

JDK_HOME=$JAVA_HOME
IDEA_JDK=$JAVA_HOME
export JDK_HOME IDEA_JDK

ANDROID_HOME=/usr/local/devtools/android/android-sdk-linux_86/tools
export ANDROID_HOME

GROOVY_HOME=/usr/local/devtools/groovy/current
export GROOVY_HOME

GRADLE_HOME=/usr/local/devtools/gradle/current
export GRADLE_HOME

LIQUIBASE_HOME=/usr/local/devtools/liquibase/current
export LIQUIBASE_HOME

PATH=$HOME/bin:$HOME/bin/grails-git:$PATH:$JAVA_HOME/bin:$GRAILS_HOME/bin:$IDEA_HOME/bin:$ANDROID_HOME:$GROOVY_HOME/bin:$GRADLE_HOME/bin:$LIQUIBASE_HOME
export PATH

