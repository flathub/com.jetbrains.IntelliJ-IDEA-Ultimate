#!/usr/bin/env sh

set -o errexit

IDEA_JDK="/app/extra/idea-IU/jre64"
export IDEA_JDK
JAVA_TOOL_OPTIONS="-Djava.io.tmpdir=${XDG_CACHE_HOME}/tmp"
export JAVA_TOOL_OPTIONS
TMPDIR="${XDG_CACHE_HOME}/tmp"
export TMPDIR
PATH="${PATH}:${EXTRA_PATH}"
export PATH

exec env /app/extra/idea-IU/bin/idea.sh "$@"
