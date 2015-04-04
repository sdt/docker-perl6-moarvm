#!/bin/bash

IMAGE_NAME=sdt4docker/perl6-moarvm
CONTAINER_NAME=perl6

run() {
    docker rm -f $CONTAINER_NAME > /dev/null 2>/dev/null
    docker run -ti --name $CONTAINER_NAME $IMAGE_NAME "$@"
}

case $1 in

    build)
        docker build -t $IMAGE_NAME .
        ;;

    run)
        shift
        run "$@"
        ;;

    *)
        echo "usage: $0 [build|run|make]"
        exit 1

        ;;

esac

