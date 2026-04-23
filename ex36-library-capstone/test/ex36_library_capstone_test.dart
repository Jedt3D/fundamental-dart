import 'package:ex36_library_capstone/ex36_library_capstone.dart';
import 'package:test/test.dart';

void main() {
  // -----------------------------------------------------------------------
  // BASIC — finish these first.
  // -----------------------------------------------------------------------
  group('Lesson 36 — basic: domain modelling', () {
    test('Book stores three immutable fields', () {
      const b = Book(
        title: 'Moby-Dick',
        author: 'Melville',
        isbn: '9780000000001',
      );
      expect(b.title, equals('Moby-Dick'));
      expect(b.author, equals('Melville'));
      expect(b.isbn, equals('9780000000001'));
    });

    test('Member enforces the borrow cap via StateError', () {
      final m = Member('alice');
      for (var i = 0; i < Member.maxBorrow; i++) {
        m.borrow(Book(title: 'B$i', author: 'A', isbn: '$i'));
      }
      expect(m.borrowed.length, equals(Member.maxBorrow));

      expect(
        () => m.borrow(const Book(title: 'extra', author: 'A', isbn: 'x')),
        throwsA(
          isA<StateError>().having((e) => e.message, 'message',
              equals('borrow limit reached')),
        ),
      );
    });

    test('Member.borrowed cannot be mutated from outside', () {
      final m = Member('alice')
        ..borrow(const Book(title: 'A', author: 'A', isbn: '1'));
      expect(
        () => m.borrowed
            .add(const Book(title: 'sneaky', author: 'A', isbn: '2')),
        throwsA(isA<UnsupportedError>()),
      );
    });

    test('Library.lend/returnBook round-trip', () {
      final book = const Book(title: 'A', author: 'A', isbn: '1');
      final alice = Member('alice');
      final lib = Library()..addBook(book);

      expect(lib.lend('1', alice), isTrue);
      expect(alice.borrowed, equals([book]));

      // Already lent: second attempt fails.
      expect(lib.lend('1', Member('bob')), isFalse);

      expect(lib.returnBook('1', alice), isTrue);
      expect(alice.borrowed, isEmpty);

      // Unknown ISBN: always false.
      expect(lib.lend('does-not-exist', alice), isFalse);
    });

    test('only the original borrower can return the book', () {
      final book = const Book(title: 'A', author: 'A', isbn: '1');
      final alice = Member('alice');
      final bob = Member('bob');
      final lib = Library()..addBook(book);

      lib.lend('1', alice);
      expect(lib.returnBook('1', bob), isFalse); // bob isn't holding it
      expect(lib.returnBook('1', alice), isTrue);
    });
  });

  // -----------------------------------------------------------------------
  // ADVANCED — reporting + the exporter abstraction.
  // -----------------------------------------------------------------------
  group('Lesson 36 — advanced: reporting via an Exporter', () {
    late Library lib;
    late Member alice;

    setUp(() {
      alice = Member('alice');
      lib = Library()
        ..addBook(const Book(title: 'A', author: 'A', isbn: '1'))
        ..addBook(const Book(title: 'B', author: 'B', isbn: '2'))
        ..addBook(const Book(title: 'C', author: 'C', isbn: '3'))
        ..lend('1', alice);
    });

    test('Library.lendingState is an unmodifiable ISBN->memberId snapshot', () {
      final state = lib.lendingState();
      expect(state, equals({'1': 'alice'}));
      expect(() => state['sneaky'] = 'x', throwsA(isA<UnsupportedError>()));
    });

    test('PlainTextExporter renders a 3-line human-readable report', () {
      final report = LibraryReport(lib, PlainTextExporter()).render();
      expect(
        report,
        equals(
          'books: 3\n'
          'lent: 1\n'
          'loans: 1=alice',
        ),
      );
    });

    test('JsonLikeExporter renders the same data as JSON-ish text', () {
      final report = LibraryReport(lib, JsonLikeExporter()).render();
      expect(
        report,
        equals(
          '{"bookCount":3,"lentCount":1,"lendingState":{"1":"alice"}}',
        ),
      );
    });
  });
}
