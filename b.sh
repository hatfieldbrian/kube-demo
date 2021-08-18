#!/bin/sh
set -x
set -- localhost/a /home/bdh/.minikube/cache/images
mkdir -p $2
rm $2/$1
podman save $1 -o $2/$1
minikube ssh docker image rm $1
minikube image load $1
