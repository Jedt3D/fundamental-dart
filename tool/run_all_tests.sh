#!/usr/bin/env bash
# Run `dart pub get && dart test` for every exNN-* lesson.
# Exit code: 0 if all pass, 1 if any fail.
#
# Lesson 39 (sqlite store) depends on the native `libsqlite3` library
# being on the host. If it isn't, the lesson is reported as SKIPPED
# rather than FAILED, so a learner on a fresh Windows machine can
# still run the rest of the course.

set -u

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

pass=0
fail=0
skipped=0
failed_names=()
skipped_names=()

# Cheap, portable probe: do we have a usable libsqlite3 on the PATH?
probe_sqlite3() {
  if command -v ldconfig >/dev/null 2>&1 && \
     ldconfig -p 2>/dev/null | grep -q libsqlite3; then
    return 0
  fi
  for path in \
    /usr/lib/libsqlite3.so* \
    /usr/lib/*/libsqlite3.so* \
    /usr/local/lib/libsqlite3.so* \
    /opt/homebrew/lib/libsqlite3.dylib \
    /usr/lib/libsqlite3.dylib \
    /System/Library/Frameworks/SQLite*.framework; do
    # shellcheck disable=SC2086
    if compgen -G "$path" >/dev/null 2>&1; then
      return 0
    fi
  done
  return 1
}

for dir in ex[0-9][0-9]-*/; do
  name="${dir%/}"

  # Special case: ex39 needs libsqlite3. Skip cleanly when absent.
  if [ "$name" = "ex39-sqlite-store" ] && ! probe_sqlite3; then
    echo
    echo "──────── $name (SKIPPED) ────────"
    echo "  libsqlite3 not detected on this host."
    echo "  See ex39-sqlite-store/README.md for install instructions."
    skipped=$((skipped + 1))
    skipped_names+=("$name")
    continue
  fi

  echo
  echo "──────── $name ────────"
  (
    cd "$dir" || exit 1
    dart pub get --suppress-analytics >/dev/null 2>&1 || {
      echo "  pub get failed"; exit 1;
    }
    dart test
  )
  if [ $? -eq 0 ]; then
    pass=$((pass + 1))
  else
    fail=$((fail + 1))
    failed_names+=("$name")
  fi
done

echo
echo "========================================"
echo "  Passed:  $pass lesson(s)"
echo "  Failed:  $fail lesson(s)"
echo "  Skipped: $skipped lesson(s)"
if [ $fail -gt 0 ]; then
  echo "  Failing lessons:"
  for n in "${failed_names[@]}"; do
    echo "    - $n"
  done
fi
if [ $skipped -gt 0 ]; then
  echo "  Skipped lessons (missing native deps):"
  for n in "${skipped_names[@]}"; do
    echo "    - $n"
  done
fi
echo "========================================"

[ $fail -eq 0 ]
