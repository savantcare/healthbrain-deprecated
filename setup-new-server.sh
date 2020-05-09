#!/bin/bash

//assume ubuntu 20.04 LTS

apt update
apt upgrade

apt install emacs fish tmux

mkdir /gt/sc-prog-repos

cd /gt/sc-prog-repos/

git clone https://github.com/savantcare/healthbrain.git

apt install npm
cd node-server
npm install
npm start:auth
