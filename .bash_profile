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

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f  ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi

umask 022

JAVA_HOME=/devtools/java/current
export JAVA_HOME

GRAILS_HOME=/devtools/grails/current
export GRAILS_HOME

ANDROID_HOME=/devtools/android/android-sdk-linux_86/tools
export ANDROID_HOME

GROOVY_HOME=/devtools/groovy/current
export GROOVY_HOME

GRADLE_HOME=/devtools/gradle/current
export GRADLE_HOME

LIQUIBASE_HOME=/devtools/liquibase/current
export LIQUIBASE_HOME

PATH=$HOME/bin:$HOME/bin/grails-git:$PATH:$JAVA_HOME/bin:$GRAILS_HOME/bin:$IDEA_HOME/bin:$ANDROID_HOME:$GROOVY_HOME/bin:$GRADLE_HOME/bin:$LIQUIBASE_HOME
export PATH

