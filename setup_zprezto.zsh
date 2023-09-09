#!/bin/zsh

BASEDIR=$(cd $(dirname $0) && pwd)
cd $BASEDIR

# add submodule
git submodule update --init --recursive

# prezto
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# symlink dotfiles
ln -sf $BASEDIR/.zprezto ~/.zprezto
ln -sf $BASEDIR/zprezto/zshrc ~/.zshrc
ln -sf $BASEDIR/zprezto/zpreztorc ~/.zpreztorc

# add completion
curl -o $BASEDIR/.zprezto/modules/completion/external/src/_docker https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker

# change shell
chsh -s $(which zsh)

source ~/.zshrc
source ~/.zpreztorc
