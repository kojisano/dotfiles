#!/usr/bin/env bash

# 未定義な変数があったら途中で終了する
set -u

# 今のディレクトリ
# dotfilesディレクトリに移動する
BASEDIR=$(cd $(dirname $0) && pwd)
cd $BASEDIR

source ./utils.sh
get_os_info
os_info=$(get_os_info)
e_newline
case ${os_info[0]} in
    *'ubuntu'*)
        e_header "Setup Ubuntu"
        ./setup_ubuntu.sh
        ;;
    *'debian'*)
        e_header "Setup Debian"
        ./setup_ubuntu.sh
        ;;
    *'macos'*)
        e_header "Setup MacOS packages"
        ./setup_homebrew.sh
        ./setup_macos.sh
        ;;
    *)
        e_error "このOSでは使えません"
        exit 1
        ;;
esac

# dotfilesディレクトリにある、ドットから始まり2文字以上の名前のファイルに対して
# for f in .??*; do
#     [ "$f" = ".git" ] && continue
#     [ "$f" = ".gitconfig.local.template" ] && continue
#     [ "$f" = ".gitmodules" ] && continue

#     # シンボリックリンクを貼る
#     ln -snfv ${PWD}/"$f" ~/
# done

e_newline
e_header "Setup dotfiles"
echo $BASEDIR
ln -sf $BASEDIR/tmux/.tmux.conf ~/.tmux.conf
ln -sf $BASEDIR/git/.gitconfig ~/.gitconfig
ln -sf $BASEDIR/git/.gitignore_global ~/.gitignore_global

e_newline
e_header "Setup zprezto"
$BASEDIR/setup_zprezto.zsh
