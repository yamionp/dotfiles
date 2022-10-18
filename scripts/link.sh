#!/bin/bash

DOTFILES_ON_HOME_DIR="$(cd "$(dirname "$0")/../home/" && pwd)"
echo "make link ${DOTFILES_ON_HOME_DIR} to ${HOME}"
for dotfile in "${DOTFILES_ON_HOME_DIR}"/.??* ; do
    echo $dotfile
    #ln -fnsv "${dotfile}" "${HOME}"
done

CONFIGFILES_ON_DOT_CONFIG_DIR="$(cd "$(dirname "$0")/../.config/" && pwd)"
DOT_CONFIG_DIR="${HOME}/.config"
mkdir -p $DOT_CONFIG_DIR
echo "make link ${CONFIGFILES_ON_DOT_CONFIG_DIR} to ${DOT_CONFIG_DIR}"
for configfile in "${CONFIGFILES_ON_DOT_CONFIG_DIR}"/??* ; do
    #echo $configfile
    ln -fnsv "${configfile}" "${DOT_CONFIG_DIR}"
done
