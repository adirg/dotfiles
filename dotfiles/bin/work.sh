#!/bin/bash

function work() {
    if [ -z "${WORKSPACE+x}" ]; then
        WORKSPACE=$HOME/workspace
    fi

    PROJECT=$1
    PROJECT_PATH=$WORKSPACE/$PROJECT
    OLD_PATH=`pwd`

    export CSCOPE_DB=$PROJECT_PATH/cscope.out
    export BUILD_TYPE=${BUILD_TYPE:=dev}
    export GOPATH=$WORKSPACE_TOP/go

    cd $WORKSPACE
    source ./env
    cd $PROJECT_PATH
    export OLDPWD=$OLD_PATH
    export PATH=$HOME/bin:$PATH
}

function _work_complete() {
    local cur projects
    cur="${COMP_WORDS[COMP_CWORD]}"
    projects=`cd $HOME/workspace && repo list -n`

    COMPREPLY=( $(compgen -W "${projects}" ${cur}) )
    return 0
}

complete -F _work_complete work
