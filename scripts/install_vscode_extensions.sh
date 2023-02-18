#!/bin/bash

pkglist=($(cat extensions.txt))

for i in "${pkglist[@]}"; do
    code --install-extension "${i}"
done
