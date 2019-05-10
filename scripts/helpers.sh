function standard-start() {
    # si c'est la première fois qu'on passe ici,
    # la variable TOPLEVEL est vide
    if [ -z "$TOPLEVEL" ]; then
        export TOPLEVEL=$(pwd)
        echo "first time, TOPLEVEL=$TOPLEVEL"
        FIRST_TIME=true
    else
        cd $TOPLEVEL
        echo "restarting from $TOPLEVEL"
        FIRST_TIME=""
    fi
}


function show-repo() { git log --oneline --graph "$@"; }


function show-diffs() {
    echo '---------- FILES <-> INDEX'
    git diff "$@"
    echo '---------- INDEX <-> HEAD'
    git diff --cached
}


