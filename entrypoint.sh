#!/usr/bin/env sh

set -o errexit

IDEA_JDK="/app/extra/idea-IU/jre64"
export IDEA_JDK
TMPDIR="${XDG_CACHE_HOME}/tmp"
export TMPDIR
PATH="${PATH}:${EXTRA_PATH}"
export PATH

# https://plugins.jetbrains.com/plugin/10233-discord-integration
for i in {0..9}; do
    test -S $XDG_RUNTIME_DIR/discord-ipc-$i || ln -sf {app/com.discordapp.Discord,$XDG_RUNTIME_DIR}/discord-ipc-$i;
done

exec env /app/extra/idea-IU/bin/idea.sh "$@"
