#!/bin/bash

CONFIG_DIR="$(cd "$(dirname "$0")/../config/" && pwd)"

for dotfile in "${CONFIG_DIR}"/.??* ; do
    ln -fnsv "${dotfile}" "${HOME}"
done
