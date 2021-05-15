# If not running interactively, don't do anything
[[ $- == *i* ]] || return

if [ -f /etc/profile ]; then
    . /etc/profile
fi

################################################################################
#
################################################################################


export HISTSIZE=5000
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups:erasedups
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"
export HISTTIMEFORMAT="%d/%m/%y %T "

export EDITOR=vim
export SVN_EDITOR=vim
export PAGER=less
export MANPAGER="less -X"

export LB_OS_NAME=$(uname -s | tr '[:upper:]' '[:lower:]')
export LB_WORK_HOME=${HOME}/work

export LB_SFW_HOME=${HOME}/.local/opt/sfw
export LB_SFW_LANG_HOME=${LB_SFW_HOME}/lang
export LB_SFW_TOOLS_HOME=${LB_SFW_HOME}/tools

################################################################################
#
################################################################################

shopt -s nocaseglob
shopt -s histappend
shopt -s cdspell

for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null
done

export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

################################################################################
#
################################################################################

pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="$1:$PATH"
        export PATH
    fi
}

manpathadd() {
    if [ -d "$1" ] && [[ ":$MANPATH:" != *":$1:"* ]]; then
        MANPATH="$1:$MANPATH"
    fi
}

infopathadd() {
    if [ -d "$1" ] && [[ ":$INFOPATH:" != *":$1:"* ]]; then
        INFOPATH="$1:$INFOPATH"
    fi
}

ldpathadd() {
    if [ -d "$1" ] && [[ ":$LD_LIBRARY_PATH:" != *":$1:"* ]]; then
        LD_LIBRARY_PATH="$1:$LD_LIBRARY_PATH"
        export LD_LIBRARY_PATH
    fi
}

pathadd "${HOME}/.local/bin"
pathadd "${HOME}/bin"

PS1='[\u@\h \W] $ '

################################################################################
#
################################################################################

for F in ${HOME}/.bashrc.d/*;
do
    if [ -f ${F} ]; then
        echo "${F}"
        . "${F}"
    fi
done

for F in $(ls $HOME/.bash_completion.d);
do
    if [ ${LB_OS_NAME} != "darwin" ]; then
        . $HOME/.bash_completion.d/$F
    else
        if hash brew 2> /dev/null; then
            if [ ! -e "$(brew --prefix)"/etc/bash_completion.d/$F ]; then
                . $HOME/.bash_completion.d/$F
            fi
        fi
    fi
done

