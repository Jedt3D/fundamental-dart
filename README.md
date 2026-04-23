# Fundamental Dart — Learn Dart the Test-Driven Way

A hands-on, **Ruby-Monk-style** tour of the Dart programming language.
Each lesson is a small Dart package under `exNN-<topic>/`, and each one
ships with:

1. A **story** (`README.md`) that explains the idea, the design
   thinking, and what we expect before you pick up the keyboard.
2. A **stub library** (`lib/`) where you write the code. The doc
   comments in the stubs tell you what to build — they are the spec.
3. A **failing test suite** (`test/`) that tells you when you're done.

> **Red → Green → Refactor.** Run the tests, see red, make them green,
> then tidy up. That's the whole learning loop.

---

## 1. What you'll learn

The course is split into four tracks. Work through them in order, or
jump around once you've done track I.

### Track I — Language fundamentals (lessons 01–15)

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

### Track II — Dart-specific features (lessons 16–20)

| # | Lesson | Topic |
|---|---|---|
| 16 | `ex16-async` | `Future`, `async`/`await`, `Future.wait` |
| 17 | `ex17-streams` | `Stream`, `async*`, `StreamController` |
| 18 | `ex18-mixins-extensions` | `mixin`, `extension` methods |
| 19 | `ex19-generics` | Generics, bounds, `typedef` |
| 20 | `ex20-records-patterns` | Dart 3 records & pattern matching |

### Track III — Classic data structures (lessons 21–25)

| # | Lesson | Topic |
|---|---|---|
| 21 | `ex21-stack` | Generic `Stack<T>` (LIFO) |
| 22 | `ex22-queue` | Generic `Queue<T>` (FIFO) |
| 23 | `ex23-linked-list` | Singly linked list |
| 24 | `ex24-bst` | Binary search tree |
| 25 | `ex25-min-heap` | Min-heap / priority queue |

### Track IV — Design patterns & SOLID (lessons 26–35)

| # | Lesson | Topic |
|---|---|---|
| 26 | `ex26-singleton` | Singleton (factory constructor) |
| 27 | `ex27-factory` | Factory method |
| 28 | `ex28-observer` | Observer / pub-sub |
| 29 | `ex29-strategy` | Strategy |
| 30 | `ex30-decorator` | Decorator |
| 31 | `ex31-srp` | **S** — Single Responsibility |
| 32 | `ex32-ocp` | **O** — Open/Closed |
| 33 | `ex33-lsp` | **L** — Liskov Substitution |
| 34 | `ex34-isp` | **I** — Interface Segregation |
| 35 | `ex35-dip` | **D** — Dependency Inversion |

### Track V — Project capstones (lessons 36–39)

Longer, project-shaped lessons where you stitch together what you've
already learned. Each one has a more detailed README describing the
design before you implement.

| # | Lesson | Topic |
|---|---|---|
| 36 | `ex36-library-capstone` | Library domain (Book / Member / Library / Report) |
| 37 | `ex37-rock-paper-scissors` | RPS with injected `MoveSource` and match engine |
| 38 | `ex38-csv-pipeline` | CSV reader / writer / query service (`package:csv`) |
| 39 | `ex39-sqlite-store` | In-memory SQLite with prepared statements (`package:sqlite3`) |

### Track VI — Functional-style Dart (lessons 40–42)

Higher-order functions, composition, and accumulators — the same
patterns Ruby developers reach for, expressed with Dart's standard
library (`package:collection` for `zip` and `groupBy`).

| # | Lesson | Topic |
|---|---|---|
| 40 | `ex40-recursion-closures` | Recursion over nested data + closures with captured state |
| 41 | `ex41-functional-style` | `zip`, `map`, lambdas as values, function composition |
| 42 | `ex42-reduce-accumulators` | `fold`, `groupBy`, frequency and multi-field accumulators |

Across the 42 lessons there are **218 failing tests** waiting for you.

---

## 2. Prerequisites

Install the Dart SDK (3.3 or newer):

- https://dart.dev/get-dart

Verify:

```bash
dart --version
```

### Lesson 39 only: SQLite native library

Track V's lesson on SQLite uses `package:sqlite3`, which dynamically
loads the real `libsqlite3`. Most systems already have it:

- **macOS**: ships with the OS, nothing to install.
- **Linux**: `sudo apt install libsqlite3-0` (Debian/Ubuntu) or the
  equivalent.
- **Windows**: `libsqlite3` is **not** pre-installed. Download the
  pre-compiled DLL from [sqlite.org/download.html](https://sqlite.org/download.html)
  (`sqlite-dll-win-*.zip`) and place `sqlite3.dll` somewhere on your
  `PATH` — e.g. `C:\Windows\System32` or a folder you add to `PATH`.
  Alternatively, install it via `choco install sqlite` or
  `winget install SQLite.SQLite`.

The other 41 lessons have zero native dependencies.

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

If you're truly stuck, re-read the lesson's `README.md` — every lesson
spells out the design thinking before the mission — and the doc
comments next to each stub. The test names are the final contract.

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
├── README.md              ← story, design thinking, mission
├── analysis_options.yaml  ← lint rules
├── pubspec.yaml
├── lib/
│   └── ex07_functions.dart  (YOUR CODE GOES HERE — stubs + doc comments)
└── test/
    └── ex07_functions_test.dart  (keep these green)
```

`dart test` auto-discovers anything under `test/` that ends in
`_test.dart`. There is no `bin/` — we drive everything through the
test runner, which is how production Dart code is verified too.

---

## 7. Tips for TDD newcomers

- **Read the test name first.** It describes the behaviour you need.
- **Fix one test at a time.** Don't try to implement everything at once.
- **Watch the failure message.** Dart's matchers (`equals`, `throwsA`,
  `closeTo`) print what they expected vs. what they got.
- **Commit often.** Each green bar is a safe spot.

Have fun — this should feel like a puzzle, not homework.
