#!/usr/bin/env sh

set -o errexit

IDEA_JDK="/app/extra/idea-IU/jre64"
export IDEA_JDK
TMPDIR="${XDG_RUNTIME_DIR}/app/${FLATPAK_ID}"
export TMPDIR
PATH="${PATH}:${EXTRA_PATH}"
export PATH

exec env /app/extra/idea-IU/bin/idea.sh "$@"
