#!/bin/bash

BASEDIR=$(dirname $0)
cd $BASEDIR

echo "installing homebrew..."
which brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "run brew doctor..."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update..."
which brew >/dev/null 2>&1 && brew update

echo "ok. run brew upgrade..."

which brew >/dev/null 2>&1 && brew upgrade

formulas=(
    git
    wget
    curl
    # tree
    # openssl
    # colordiff
    zsh
    zsh-completions
    # "--with-cocoa --srgb emacs"
    # cask
    # peco
    # hub
    # tig
    # mysql
    # postgresql
    # sqlite
    # yarn
    # nodebrew
    python3
    # lua
    # "vim --with-lua"
    # rbenv
    # ruby-build
    # rbenv-gem-rehash
    # rbenv-default-gems
    # ricty
    # markdown
    # ctags
    ssh-copy-id
    # diff-so-fancy
    # memcached
    # imagemagick@6
    # gcc
    # libxml2
    # libxslt
    # libiconv
    # heroku
    # awscli
    # redis
)

# "brew tap..."
# brew tap sanemat/font
# brew tap heroku/brew

echo "start brew install apps..."
# for formula in "${formulas[@]}"; do
#     brew install $formula || brew upgrade $formula
# done
brew bundle -v --file=./Brewfile

brew cleanup

cat << END

**************************************************
HOMEBREW INSTALLED! bye.
**************************************************

END