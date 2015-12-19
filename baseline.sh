#!/bin/bash
set -ex

PLATFORM=`uname`

echo ${PLATFORM}

if [ "${PLATFORM}" == "Darwin" ] ; then
  brew install bash
  sudo bash -c 'echo $(brew --prefix)/bin/bash >> /etc/shells'
  chsh -s $(brew --prefix)/bin/bash

  brew install wget --with-iri
  brew install coreutils
  brew install moreutils
  brew install findutils
  brew install gnu-sed --with-default-names
  brew install gnu-tar --with-default-names
  brew install bash-completion
  brew install readline
  brew install openssl
  brew install socat
  brew install xz
  brew install gnupg2
  brew install gpg-agent
  brew install ssh-copy-id
  brew install pyenv
  brew install pyenv-virtualenv
  brew install ruby

  brew cleanup
fi
