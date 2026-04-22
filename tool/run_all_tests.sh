#!/usr/bin/env bash
# Run `dart pub get && dart test` for every exNN-* lesson.
# Exit code: 0 if all pass, 1 if any fail.

set -u

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

pass=0
fail=0
failed_names=()

for dir in ex[0-9][0-9]-*/; do
  name="${dir%/}"
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
echo "  Passed: $pass lesson(s)"
echo "  Failed: $fail lesson(s)"
if [ $fail -gt 0 ]; then
  echo "  Failing lessons:"
  for n in "${failed_names[@]}"; do
    echo "    - $n"
  done
fi
echo "========================================"

[ $fail -eq 0 ]
