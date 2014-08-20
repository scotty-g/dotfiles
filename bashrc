# assuming that bash_completions is installed via brew (brew install bash-completion)
if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

## git functions and config
# ssh autocomplete support from .ssh/config and .ssh/known_hosts
_complete_ssh_hosts ()
{
        COMPREPLY=()
        cur="${COMP_WORDS[COMP_CWORD]}"
        comp_ssh_hosts=`cat ~/.ssh/known_hosts | \
                        cut -f 1 -d ' ' | \
                        sed -e s/,.*//g | \
                        grep -v ^# | \
                        uniq | \
                        grep -v "\[" ;
                cat ~/.ssh/config | \
                        grep "^Host " | \
                        awk '{print $2}'
                `
        COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
        return 0
}
complete -F _complete_ssh_hosts ssh
     
# setting this variable to true will add an asterisk to your command prompt
# if your branch has unstaged changes
GIT_PS1_SHOWDIRTYSTATE=true     

# PS1. includes git context
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[36m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '



## Path control
# use brew bins first
PATH=/usr/local/bin:$PATH
export PATH

# use coreutils
export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"

#colors
export CLICOLOR=1

export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# keep markup-convert unit tests from stealing window focus
export JAVA_TOOL_OPTIONS="-Djava.awt.headless=true"

# swap versions in a pom recursively
swapVersions() {
    if [ $# -ne 2 ]
    then
        echo "Usage: swapVersions <oldVersion> <newVersion>"
    else
        find . -name pom.xml -exec sed -i .orig "s/$1/$2/g" {} \;
    fi
}

# switch java versions
case "$OSTYPE" in
  darwin*)
    alias j6='JAVA_HOME=`/usr/libexec/java_home -v "1.6"`'; export JAVA_HOME
    alias j7='JAVA_HOME=`/usr/libexec/java_home -v "1.7"`'; export JAVA_HOME
    ;;
  *)
    echo "***Did not understand OSTYPE varible***"
    ;;
esac
