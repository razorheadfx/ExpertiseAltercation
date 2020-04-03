#!/bin/sh

docker run --rm -it --user $(id -u):$(id -g) -v $PWD/input:/input -v $PWD/output:/output expertisealtercation "$@"