## tools, notes and .dot files

### OS X

First start by installing [Homebrew](http://brew.sh/) using (yes, yes, it's a curl-snatch *sigh*)

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Then run the script that is below to provision our environment

Note -- this is not part of the stored scripts as I want to make sure the steps are purposeful as some of these may overwrite config files that have been tweaked later.

### Post Install Items

Copy files from our secure backup:
- ~/.pypirc
- ~/.gnupg
- ~/.ssh -- config and our ssh keys
- ~/bin/credentials

### Provisioning script
```
#!/bin/bash
set -ex

PLATFORM=`uname`

cd ~
mkdir bin
mkdir temp

if [ "${PLATFORM}" == "Darwin" ] ; then
  brew install git
fi

cd ~/temp
git clone https://github.com/bear/bear

cd ~/temp/bear
cp colours ~/bin/
cp prompt.sh ~/bin/

cat <<EOF > ~/.gnupg/gpg-agent.conf
use-standard-socket
default-cache-ttl 600
max-cache-ttl 7200
pinentry-program /usr/local/MacGPG2/libexec/pinentry-mac.app/Contents/MacOS/pinentry-mac
EOF

cat <<EOF > ~/.gitconfig
[user]
  name = bear (Mike Taylor)
  email = bear@bear.im
[core]
  excludesfile = ~/.gitignore
  whitespace = space-before-tab,-indent-with-non-tab,trailing-space
[apply]
  # detect whitespace errors
  whitespace = fix
[push]
  default = simple
  followTags = true
EOF

cat <<EOF > ~/.bash_profile
PATH=${HOME}/bin:$(brew --prefix coreutils)/libexec/gnubin:$(brew --prefix gnu-tar)/libexec/gnubin:${PATH}
export PATH
export PYENV_ROOT=/usr/local/var/pyenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

for f in ~/bin/{colours,prompt,aliases,credentials} ; do
  [ -r "${f}" ] && [ -f "${f}" ] && source "${f}"
done

export PYTHONIOENCODING="UTF-8"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export MANPAGER="less -X"

EOF

if [ "${PLATFORM}" == "Darwin" ] ; then
  cp p ~/bin/
  cp flushdns.sh ~/bin/
  cp sane_osx_settings.sh ~/bin/

  ~/bin/sane_osx_settings.sh
fi

~/temp/bear/baseline.sh
~/temp/bear/ops-tools.sh
cd ~
echo "Done!"
```

## Credits

Many sources of inspiration for this, some I have carried with me for aeons and have long forgotten who I got them from...

* [Marcel Bischoff _Awesome OSX Command Line](https://github.com/herrbischoff/awesome-osx-command-line)
* [Mathias Bynens](https://mathiasbynens.be/)
