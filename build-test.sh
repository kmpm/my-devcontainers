#!/bin/bash
TEMPLATE_ID=$1
TASK=$2

if [ ! -d src/${TEMPLATE_ID} ]; then
    echo "Error! src/${TEMPLATE_ID} cannot be found"
    exit 1
fi

set -e

SRC_DIR="/tmp/${TEMPLATE_ID}"
PROJECT_LABEL="com.docker.compose.project=${TEMPLATE_ID}_devcontainer"

run_build() {
    echo "Building"
    ./.github/actions/smoke-test/build.sh ${TEMPLATE_ID}
}

run_test() {
    echo "Testing"
    ./.github/actions/smoke-test/test.sh ${TEMPLATE_ID}
}

run_clean() {
    echo "Cleaning"
    
    CONTAINERS=$(docker container ls -f "LABEL=${PROJECT_LABEL}" -q)
    if [ -n "$CONTAINERS" ]; then
        docker rm -f $CONTAINERS
    else
        echo "No containers to clean"
    fi
    rm -rf "${SRC_DIR}"
}

run_clean_images() {
    echo "Cleaning images"
    IMAGES=$(docker images -f "label=${PROJECT_LABEL}" -q)
    if [ -n "$IMAGES" ]; then
        docker rmi $IMAGES
    else
        echo "No images to clean"
    fi
}

if [ -z "$TASK" ]; then
    run_build
    run_test
    run_clean
else
    case $TASK in
        build)
            run_build
            ;;
        test)
            run_test
            ;;
        clean)
            run_clean
            ;;
        clean_all)
            run_clean
            run_clean_images
            ;;
        *)
            echo "Invalid task! Use one of: build, test, clean"
            exit 1
            ;;
    esac
fi

echo "Done"
