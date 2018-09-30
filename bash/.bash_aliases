#!/usr/bin/env bash

alias ls='ls --color=auto --group-directories-first'
alias grep='grep --color=auto'
alias df='df --human-readable'
alias free='free --human'
alias mkdir='mkdir -pv'
alias ppath='echo -e ${PATH//:/\\n}'
alias cls='clear'

function addpath {
    case ":$PATH:" in
      *":$1:"*) :;;
      *) PATH="$1:$PATH";;
    esac
}

function cleanfile {
    sed -i 's/\t/    /g' $1
    sed -i 's/\s*$//'    $1
}
