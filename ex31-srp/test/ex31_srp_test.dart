import 'package:ex31_srp/ex31_srp.dart';
import 'package:test/test.dart';

void main() {
  group('Lesson 31 — SRP', () {
    test('Report only holds data', () {
      final r = Report('Sales', ['Jan: 10', 'Feb: 20']);
      expect(r.title, equals('Sales'));
      expect(r.rows, equals(['Jan: 10', 'Feb: 20']));
    });

    test('ReportFormatter formats but does not print', () {
      final r = Report('Sales', ['Jan: 10', 'Feb: 20']);
      final formatted = ReportFormatter().format(r);
      expect(formatted, equals('Sales\n- Jan: 10\n- Feb: 20'));
    });

    test('ReportPrinter delegates formatting and sends to sink', () {
      final captured = <String>[];
      final printer = ReportPrinter(ReportFormatter(), captured.add);
      printer.print(Report('Sales', ['Jan: 10']));
      expect(captured, equals(['Sales\n- Jan: 10']));
    });
  });
}
