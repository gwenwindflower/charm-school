#!/bin/bash

FILE=~/dev/charm-school/extensions.txt
pkglist=($(cat "${FILE}"))

for i in "${pkglist[@]}"; do
    code --install-extension "${i}"
done
