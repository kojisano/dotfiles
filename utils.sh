#! /bin/env bash

e_newline() {
    printf "\n"
}

e_header() {
    printf "\033[37;1m%s\033[m\n" "$*"
}

e_error() {
    printf "\033[31m%s\033[m\n" "✖ $*" 1>&2
}

e_warning() {
    printf "\033[31m%s\033[m\n" "$*"
}

# Copyright (c) 2016 Kohei Arao
# https://github.com/koara-local/dotfiles/edit/master/bin/get_os_info
# Released under the Unlicense
# http://unlicense.org/

# Get OS bit
# 32bit : i686
# 64bit : x86_64
get_os_bit() {
    echo $(uname -m);
}

# Get Linux distribution name
get_os_distribution() {
    case "$(uname)" in
        *'Darwin'*)
            distri_name="macos"
            ;;
        *'Linux'*)
            if   [ -e /etc/debian_version ] ||
                [ -e /etc/debian_release ]; then
                # Check Ubuntu or Debian
                if [ -e /etc/lsb-release ]; then
                    # Ubuntu
                    distri_name="ubuntu"
                else
                    # Debian
                    distri_name="debian"
                fi
            elif [ -e /etc/fedora-release ]; then
                # Fedra
                distri_name="fedora"
            elif [ -e /etc/redhat-release ]; then
                if [ -e /etc/oracle-release ]; then
                    # Oracle Linux
                    distri_name="oracle"
                else
                    # Red Hat Enterprise Linux
                    distri_name="redhat"
                fi
            elif [ -e /etc/arch-release ]; then
                # Arch Linux
                distri_name="arch"
            elif [ -e /etc/turbolinux-release ]; then
                # Turbolinux
                distri_name="turbol"
            elif [ -e /etc/SuSE-release ]; then
                # SuSE Linux
                distri_name="suse"
            elif [ -e /etc/mandriva-release ]; then
                # Mandriva Linux
                distri_name="mandriva"
            elif [ -e /etc/vine-release ]; then
                # Vine Linux
                distri_name="vine"
            elif [ -e /etc/gentoo-release ]; then
                # Gentoo Linux
                distri_name="gentoo"
            else
                # Other
                distri_name="unkown"
            fi
            ;;
        *)
            e_error "Unsupported OS"
            exit 1
            ;;
    esac

    echo ${distri_name}
}

# Get distribution and bit
get_os_info() {
   echo $(get_os_distribution) $(get_os_bit)
}