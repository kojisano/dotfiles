#!/bin/bash

setup_ubuntu() {
    if [[ ! -f /etc/os-release ]]; then
        return 0
    fi

    sudo sed -i.bak -e "s%https?://[^ ]\+%https://ftp.udx.icscoe.jp/Linux/ubuntu/%g" /etc/apt/sources.list
    sudo apt-get update
}

#setup_ubuntu

formulas=(
    gcc
    wget
    # curl
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
    # libxml2
    # libxslt
    # libiconv
    # heroku
    # awscli
    # redis
    jq
    tmux
    nvm
    htop
    direnv
)

echo "start apt-get install apps..."
for formula in "${formulas[@]}"; do
  sudo apt-get -y install $formula
done

exit 0
