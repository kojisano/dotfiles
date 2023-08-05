#!/usr/bin/env bash

# 未定義な変数があったら途中で終了する
set -u

# 今のディレクトリ
# dotfilesディレクトリに移動する
BASEDIR=$(dirname $0)
cd $BASEDIR

./utils.sh
os_info=$(get_os_info)

e_newline
case ${os_info[0]} in
    ubuntu)
        e_header "Setup Ubuntu"
        ./setup_ubuntu.sh
        ;;
    debian)
        e_header "Setup Debian"
        ./setup_ubuntu.sh
        ;;
    macos)
        e_header "Setup Homebrew packages"
        ./setup_homebrew.sh
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
ln -sf ./tmux/.tmux.conf ~/.tmux.conf
ln -sf ./git/.gitconfig ~/.gitconfig
ln -sf ./git/.gitignore_global ~/.gitignore_global

e_newline
e_header "Setup zprezto"
./setup_zprezto.zsh