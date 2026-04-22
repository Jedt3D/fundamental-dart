# Fundamental Dart — Learn Dart the Test-Driven Way

A hands-on, **Ruby-Monk-style** tour of the Dart programming language.
Each lesson is a small Dart package under `exNN-<topic>/`, and each one
ships with:

1. A short **story** (`README.md`) that explains the idea.
2. A **stub library** (`lib/`) where you write the code.
3. A **failing test suite** (`test/`) that tells you when you're done.
4. A **reference solution** (`bin/challenge.dart`) you can peek at
   if you get stuck.

> **Red → Green → Refactor.** Run the tests, see red, make them green,
> then tidy up. That's the whole learning loop.

---

## 1. What you'll learn

| # | Lesson | Topic |
|---|---|---|
| 01 | `ex01-hello` | Hello world, entry points, `main` |
| 02 | `ex02-basic` | Variables: `var`, `final`, `const`, `double` |
| 03 | `ex03-types-ops` | Numeric types and operators |
| 04 | `ex04-strings` | Strings and interpolation |
| 05 | `ex05-control-flow` | `if`/`else`, `switch`, ternary |
| 06 | `ex06-loops` | `for`, `while`, `for-in`, `break` |
| 07 | `ex07-functions` | Positional, named, optional, closures |
| 08 | `ex08-classes` | Classes, getters/setters, inheritance |
| 09 | `ex09-constructors` | Default, named, factory constructors |
| 10 | `ex10-static-members` | `static` members and utility classes |
| 11 | `ex11-nullability` | `?`, `??`, `?.`, `!` |
| 12 | `ex12-lists` | Lists, `map`, `where`, `fold` |
| 13 | `ex13-sets` | Sets, `union`, `intersection` |
| 14 | `ex14-maps` | Maps and map iteration |
| 15 | `ex15-iterables` | Custom `Iterable` and `Iterator` |

Across the 15 lessons there are **57 failing tests** waiting for you.

---

## 2. Prerequisites

Install the Dart SDK (3.3 or newer):

- https://dart.dev/get-dart

Verify:

```bash
dart --version
```

---

## 3. The TDD loop (per lesson)

From the repository root, pick a lesson and run its tests:

```bash
cd ex01-hello
dart pub get
dart test
```

You will see red — that's expected. Open `lib/ex01_hello.dart`, read the
doc comments, make each test pass one at a time, then move on.

```text
┌───────────────────┐
│  1. dart test     │  ← see a red failure
├───────────────────┤
│  2. edit lib/...  │  ← write just enough code
├───────────────────┤
│  3. dart test     │  ← green
├───────────────────┤
│  4. refactor      │  ← clean the code, keep tests green
└───────────────────┘
```

If you're truly stuck, open `bin/challenge.dart` in the same lesson —
it contains a worked example of the same ideas.

---

## 4. Running every lesson at once

### Linux / macOS

```bash
./tool/run_all_tests.sh
```

### Windows (cmd / PowerShell)

```cmd
tool\run_all_tests.bat
```

These scripts walk every `exNN-*` folder, run `dart pub get`, then
`dart test`, and report a summary at the end.

---

## 5. Using an IDE

### VS Code

1. Install the **Dart** extension (Dart-Code.dart-code).
2. Open the repository root as a workspace.
3. `.vscode/launch.json` already defines:
   - `Run current file` — runs the active `main()`.
   - `Test current package` — runs tests for the folder owning the
     currently-open file.
4. Click the little **Run | Debug** code lenses that appear above each
   `test(...)` block, or press `F5`.

### IntelliJ IDEA / Android Studio

1. Install the **Dart** plugin (Preferences → Plugins → Dart).
2. Point **Preferences → Languages & Frameworks → Dart** at your Dart
   SDK.
3. Open the repo — IntelliJ will detect each `exNN-*` as a separate
   Dart package.
4. Right-click any `test/xxx_test.dart` → **Run 'tests in …'**,
   or use the gutter icons next to individual `test()` calls.

> The included `.idea/` module already excludes the `.dart_tool/` and
> `build/` directories, so indexing stays fast.

---

## 6. Anatomy of a lesson

```
ex07-functions/
├── README.md              ← story + challenge
├── analysis_options.yaml  ← lint rules
├── pubspec.yaml
├── bin/
│   ├── ex07_functions.dart  (runnable demo)
│   └── challenge.dart       (reference solution — peek if stuck)
├── lib/
│   └── ex07_functions.dart  (YOUR CODE GOES HERE)
└── test/
    └── ex07_functions_test.dart  (keep these green)
```

`dart test` auto-discovers anything under `test/` that ends in
`_test.dart`.

---

## 7. Tips for TDD newcomers

- **Read the test name first.** It describes the behaviour you need.
- **Fix one test at a time.** Don't try to implement everything at once.
- **Watch the failure message.** Dart's matchers (`equals`, `throwsA`,
  `closeTo`) print what they expected vs. what they got.
- **Commit often.** Each green bar is a safe spot.

Have fun — this should feel like a puzzle, not homework.
