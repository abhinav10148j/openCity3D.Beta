#!/bin/sh
set -e
DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
DIST="$DIR/.gradle-dist"
JAR="$DIST/gradle-wrapper.jar"
if [ ! -f "$JAR" ]; then
  mkdir -p "$DIST"
  curl -L -o "$DIST/gradle.zip" https://services.gradle.org/distributions/gradle-8.7-bin.zip
  unzip -q "$DIST/gradle.zip" -d "$DIST"
fi
exec "$DIST/gradle-8.7/bin/gradle" "$@"
