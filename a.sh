#!/bin/sh
set -x
if ! command -v podman; then
	. /etc/os-release
	echo 'deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_'${VERSION_ID}'/ /' | sudo tee /etc/apt/sources.list.d/podman.list >/dev/null
	curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/Release.key | sudo apt-key add -
	#sudo apt-get update
	sudo apt-get -y install podman
	podman --version
fi
if ! command -v minikube; then
	curl -LR https://storage.googleapis.com/minikube/releases/v1.18.1/minikube-linux-amd64 -o /tmp/minikube
	chmod +x /tmp/minikube
	sudo mv /tmp/minikube /usr/bin
fi
time minikube start --driver podman
