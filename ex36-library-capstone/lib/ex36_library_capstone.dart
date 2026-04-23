/// Lesson 36 — Mini capstone: a library management domain.
///
/// Read `README.md` first. It explains *why* the domain is split the
/// way it is. The doc comments in this file are the contract the
/// tests check, grouped by class.
library;

// ---------------------------------------------------------------------------
// Book — pure data.
//
// A book is an immutable value: once created, its fields don't change.
// It has no methods of its own. The library rearranges books; it doesn't
// mutate them.
// ---------------------------------------------------------------------------

/// An immutable book record.
///
/// Usage:
///   const b = Book(title: 'Moby-Dick', author: 'Melville', isbn: '9780000000001');
///
/// No methods required.
class Book {
  // TODO: final String title, author, isbn.
  // TODO: a const constructor taking these as named, required parameters.
  //
  // Delete the placeholders below once you've wired up the real thing.
  final String title;
  final String author;
  final String isbn;

  const Book({
    required this.title,
    required this.author,
    required this.isbn,
  });
}

// ---------------------------------------------------------------------------
// Member — the "can I take another?" rule lives here.
// ---------------------------------------------------------------------------

/// A library member. Owns the "no more than [maxBorrow] books at
/// once" invariant — putting the rule on the member means nobody
/// can accidentally skip it.
class Member {
  /// Hard-coded cap so tests can reference it as `Member.maxBorrow`.
  static const int maxBorrow = 3;

  Member(this.id);

  final String id;

  // Private mutable list — nobody outside the class can append to it.
  final List<Book> _borrowed = [];

  /// Read-only view of the books this member currently holds.
  ///
  /// IMPORTANT: return something the caller **cannot mutate**. Hint:
  /// `List.unmodifiable(...)`.
  List<Book> get borrowed {
    throw UnimplementedError('TODO: return an unmodifiable view of _borrowed');
  }

  /// Append [book] to the held list.
  ///
  /// Throws [StateError] with message `'borrow limit reached'` if the
  /// member is already holding [maxBorrow] books.
  void borrow(Book book) {
    throw UnimplementedError('TODO: enforce the cap, then add the book');
  }

  /// Remove [book] from the held list. Silent no-op if the member
  /// doesn't currently hold it.
  void returnBook(Book book) {
    throw UnimplementedError('TODO: _borrowed.remove(book)');
  }
}

// ---------------------------------------------------------------------------
// Library — thin coordinator: knows who has what.
// ---------------------------------------------------------------------------

/// The library itself. Keeps the authoritative mapping of ISBN → holder.
/// Delegates the "can this member borrow?" decision to [Member].
class Library {
  // All books the library owns, keyed by ISBN for O(1) lookup.
  final Map<String, Book> _books = {};

  // Which member currently holds each ISBN. Absent key = book is on the
  // shelf (or the library doesn't own that ISBN at all).
  final Map<String, Member> _lent = {};

  /// Register a book with the library.
  void addBook(Book book) {
    throw UnimplementedError('TODO: _books[book.isbn] = book');
  }

  /// Try to lend the book with [isbn] to [to].
  ///
  /// Returns `false` (and leaves state unchanged) when:
  ///   * the ISBN isn't in the catalogue, OR
  ///   * the book is already lent out.
  ///
  /// Returns `true` on success, after:
  ///   * calling `to.borrow(book)` (which will throw if the member is
  ///     at their personal cap — that error should propagate), and
  ///   * recording the loan in [_lent].
  bool lend(String isbn, Member to) {
    throw UnimplementedError('TODO: look up, check not already lent, delegate '
        'to member.borrow, then record the loan');
  }

  /// Try to return the book with [isbn] from [from].
  ///
  /// Returns `true` only when [from] is the member currently holding
  /// [isbn]. A different member trying to return the book fails — this
  /// is the invariant "only the borrower can return it".
  bool returnBook(String isbn, Member from) {
    throw UnimplementedError('TODO: verify _lent[isbn] == from, then undo '
        'the loan');
  }

  /// Read-only snapshot: ISBN → member id for every lent book.
  ///
  /// Callers must not be able to mutate this from outside. Use
  /// `Map.unmodifiable(...)`.
  Map<String, String> lendingState() {
    throw UnimplementedError('TODO');
  }
}

// ---------------------------------------------------------------------------
// Reporting — separated from the library so formatting can change
// independently. The report takes an [Exporter] and hands it a neutral
// snapshot; exporters decide how to render it.
// ---------------------------------------------------------------------------

/// Plug-in interface for formatting the library snapshot.
abstract class Exporter {
  /// Render the given snapshot to a String.
  ///
  /// The snapshot is a **named record** — the Dart 3 answer to Ruby's
  /// symbol-keyed hashes. Fields: total number of books owned, number
  /// currently lent out, and the full ISBN→memberId mapping.
  String export(
    ({int bookCount, int lentCount, Map<String, String> lendingState}) snapshot,
  );
}

/// Renders the snapshot as three lines of plain text. See the tests
/// for the exact format.
class PlainTextExporter implements Exporter {
  @override
  String export(
    ({int bookCount, int lentCount, Map<String, String> lendingState}) snapshot,
  ) {
    throw UnimplementedError('TODO — see the test for exact format');
  }
}

/// Renders the snapshot as a tiny JSON-like string (no external
/// package). See the tests for the exact format.
class JsonLikeExporter implements Exporter {
  @override
  String export(
    ({int bookCount, int lentCount, Map<String, String> lendingState}) snapshot,
  ) {
    throw UnimplementedError('TODO — see the test for exact format');
  }
}

/// Glue. Pulls a snapshot from the library and hands it to the
/// exporter. Crucially, **this class has no branching on format** —
/// adding a new format means writing a new Exporter, not editing
/// this file.
class LibraryReport {
  LibraryReport(this._library, this._exporter);

  final Library _library;
  final Exporter _exporter;

  /// Build a snapshot of the library and hand it to the exporter.
  String render() {
    throw UnimplementedError('TODO: build the record, call _exporter.export');
  }
}
