#!/bin/bash

FAILED=()

echoStderr()
{
    echo "$@" 1>&2
}

curljq() {
    curl -fs "$1" | jq -M -r "$2"
}


check() {
    LABEL=$1
    shift
    echo -e "\n🧪 Testing $LABEL"
    if "$@"; then 
        echo "✅  Passed!"
        return 0
    else
        echoStderr "❌ $LABEL check failed."
        FAILED+=("$LABEL")
        return 1
    fi
}

reportResults() {
    echo -e "\n----------"
    if [ ${#FAILED[@]} -ne 0 ]; then
        echoStderr -e "💥  Failed tests: ${FAILED[@]}\n"
        exit 1
    else 
        echo -e "💯  All passed!\n"
        exit 0
    fi
}
