#!/usr/bin/env bash
# `dart pub get` in every exNN-* folder.
set -eu
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
for dir in ex[0-9][0-9]-*/; do
  echo "── $dir ──"
  (cd "$dir" && dart pub get --suppress-analytics)
done
