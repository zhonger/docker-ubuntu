#!/bin/sh

ssh-import-id gh:$GITHUB_NAME
sudo service ssh start
/bin/zsh