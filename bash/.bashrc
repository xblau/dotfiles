#!/usr/bin/env bash

# run settings file, if exists
if [[ -f ~/.bash_settings ]]; then
    source ~/.bash_settings
fi

# read alias/function definitions
if [[ -f ~/.bash_aliases ]]; then
    source ~/.bash_aliases
fi


# history settings
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s histappend


# check window size after each command
shopt -s checkwinsize


# set prompt
PROMPT_COMMAND=__prompt_command

__prompt_command() {
    local ecode="$?"
    PS1=""

    CRESET='\[\e[0m\]'
    CBOLD='\[\e[1m\]'

    CRED='\[\e[31m\]'
    CGREEN='\[\e[32m\]'
    CLYELLOW='\[\e[93m\]'
    CLBLUE='\[\e[94m\]'

    TERMCOLOR=$CGREEN

    if [[ -n $SSH_CLIENT ]]; then
        TERMCOLOR=$CLYELLOW
    fi

    echo -ne "\033]0;${USER}@${HOSTNAME}\007"
    PS1+="${CRESET}${CBOLD}┌─[\A] $CGREEN\u@${TERMCOLOR}\h${CRESET}:${CLBLUE}\w\n${CRESET}└─${CBOLD}($ecode) \\$ ${CRESET}"
}


# add bin directories to PATH
[[ -d ~/bin    ]] && addpath ~/bin
[[ -d ~/go/bin ]] && addpath ~/go/bin


# set up ssh agent socket var
export SSH_AGENT_PID=""
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
