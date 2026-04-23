# Lesson 36 — Mini capstone: a library management domain

> This is the first of our **Track V capstones**. Up to now each
> lesson has taught one idea; this one asks you to glue several
> together — classes, invariants, collaboration between objects,
> dependency injection, and separation of concerns — into a small
> coherent system. It's longer than the earlier lessons on purpose.
> Read this whole document *before* you start writing code.

## 1. The domain we're modelling

We're building the guts of a tiny library system. In real life the
full problem is huge: fines, reservations, multiple copies, user
roles, and so on. We'll carve off a deliberately small slice that
still teaches every big idea:

- Books are the thing being circulated. Each book has a unique ISBN
  that identifies which *title* it is.
- Members are the people who borrow books. A member can only hold a
  small number of books at once.
- The library is where books live. It remembers which books it owns
  and which ones are currently lent out, and to whom.
- A library report is a thin, read-only view of the library's state
  that you can hand to any exporter (JSON, CSV, plain text). The
  report doesn't know or care how its output is rendered.

Four objects, four distinct jobs. The instinct — especially when
you're starting out — is to put everything on one `Library` class
with methods like `borrow`, `lend`, `exportAsJson`, `validate`, and
`logFine`. Resist that. Every time a `Library` changes shape,
unrelated code breaks. The lesson here is that a small, clear domain
is more valuable than a clever one.

## 2. Design thinking — why the split looks this way

### Why `Book` has no methods

A book is just data: a title, an author, an ISBN. It has no *behaviour*
of its own. Modelling it as a tiny immutable value keeps the system
honest — a library doesn't "do things" to books; it rearranges them.

### Why `Member` owns the borrow cap

The rule "a member may hold at most 3 books at a time" is a property
of the member, not the library. If we put the check on the library,
we'd have to duplicate it everywhere a book changed hands. Putting
the cap inside `Member.borrow` means the invariant is enforced
wherever the domain talks about borrowing — you can't accidentally
skip it.

### Why `Library` is thin

The library's job is the mapping between ISBNs and who holds them. It
delegates the "can I borrow one more?" decision to the member, and
the "what does this book look like?" question to the book. Every rule
lives where it belongs.

### Why the report takes an `Exporter` parameter instead of returning a `String`

If we hard-wire `toJson()` onto the report, then next week's feature
request ("also support CSV") means editing the report. Instead, the
report hands a neutral snapshot to an injected `Exporter` — JSON,
CSV, plain text, whatever. The report doesn't change when the output
format changes. This is dependency inversion in action (we did the
principle in lesson 35; here it is for real).

## 3. The data shapes

We lean hard on **Dart 3 named records** for read-only summaries. A
record like `({String isbn, String memberId})` is the same shape as
Ruby's `{ isbn: "…", member_id: "…" }` hash, but Dart type-checks
every field access for free. We use records, not classes, when the
shape is a pure value with no behaviour.

Classes carry behaviour. Records carry shape.

## 4. The contract (what the tests will check)

Here's everything the tests insist on:

**`Book`**

- `final String title, author, isbn` — three public fields, set by
  the constructor.
- No methods required. No mutation allowed.

**`Member`**

- `static const int maxBorrow = 3` — the cap, published as a constant
  so tests can reference it.
- `Member(this.id)` — constructor takes an opaque string ID.
- `final String id`.
- `List<Book> get borrowed` — a **read-only** view of the books this
  member holds. Callers must not be able to mutate it from outside.
- `void borrow(Book book)` — appends to the inner list. If the member
  is already at the cap, throw `StateError('borrow limit reached')`.
- `void returnBook(Book book)` — removes `book` from the list; silent
  no-op if the book isn't held.

**`Library`**

- `Library()` starts empty: zero books, nothing lent.
- `void addBook(Book book)` — registers a book with the library. A
  book's presence in the library is distinct from it being lent.
- `bool lend(String isbn, Member to)` — returns `true` on success,
  `false` if the ISBN is unknown or already lent. On success it (a)
  calls `to.borrow(book)` and (b) records the loan in the library's
  own bookkeeping.
- `bool returnBook(String isbn, Member from)` — returns `true` only
  if that ISBN is currently lent **to `from`**. Someone else's member
  can't return your book.
- `Map<String, String> lendingState()` — a read-only snapshot
  mapping ISBN → member ID, suitable for reports and debugging.

**`LibraryReport`**

- `LibraryReport(Library library, Exporter exporter)` — takes the
  library it will summarise and the exporter that will serialise.
- `String render()` — pulls a snapshot from the library and hands it
  to the exporter's `export` method.

**`Exporter`** (an abstract class you'll provide)

- One method: `String export(({int bookCount, int lentCount,
  Map<String, String> lendingState}) snapshot)`.
- Lesson ships two concrete exporters: `PlainTextExporter` (human
  readable) and `JsonLikeExporter` (JSON-ish — no external package
  needed).

## 5. How to approach the tests

The test file is split into two `group(...)` blocks — **basic** and
**advanced**. Make the basic block green first:

1. `Book` stores three fields.
2. `Member` accepts up to `maxBorrow` books.
3. `Member` throws when the cap is exceeded.
4. `Library.lend` succeeds once, then fails on a double-lend.
5. `Library.returnBook` only accepts the original borrower.

Then move on to the advanced block:

6. `Library.lendingState` returns the correct snapshot.
7. `LibraryReport` with `PlainTextExporter` produces the right text.
8. `LibraryReport` with `JsonLikeExporter` produces the right shape —
   the same report, different output, **zero changes inside
   `LibraryReport`**.

When you finish, you'll have proved to yourself that separating
data, invariants, coordination, and formatting really does make the
system easier to grow.

## 6. Run the tests

```bash
cd ex36-library-capstone
dart pub get
dart test
```
