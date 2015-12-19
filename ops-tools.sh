#!/bin/bash
set -e

PLATFORM=`uname`

if [ "${PLATFORM}" == "Darwin" ] ; then
  brew install runit
  brew install jq
  brew install awscli
  brew install docker
  brew install docker-compose
  brew install packer
  brew install terraform
fi
