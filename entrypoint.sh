#!/usr/bin/env sh

set -o errexit

JAVA_TOOL_OPTIONS=-Djava.io.tmpdir="${XDG_CACHE_HOME}"/tmp/
export JAVA_TOOL_OPTIONS
TMPDIR="${XDG_CACHE_HOME}"/tmp/
export TMPDIR
PATH="${PATH}":"${EXTRA_PATH}"
export PATH

exec env /app/extra/idea-IU/bin/idea.sh "$@"
