#!/usr/bin/env sh

set -o errexit

install --directory --mode=0755 idea-IU/
tar --directory=idea-IU/ --extract --file=ideaIU.tar.gz --gunzip --strip-components=1
rm --force ideaIU.tar.gz
