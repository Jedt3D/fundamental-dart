/// Lesson 31 — Single Responsibility Principle.
///
/// *A class should have one, and only one, reason to change.*
///
/// Anti-pattern: a `Report` that knows about data, formatting, *and*
/// printing. If any of those change, the class changes.
///
/// Fix: split into three small classes, each owning one concern.

/// Just the data. No formatting, no I/O.
class Report {
  Report(this.title, this.rows);
  final String title;
  final List<String> rows;
}

/// One job: convert a Report into a string.
class ReportFormatter {
  String format(Report report) {
    throw UnimplementedError(
      "TODO: '<title>\\n- row1\\n- row2\\n...'",
    );
  }
}

/// One job: push a formatted report somewhere. We use a [sink] callback
/// so the test can intercept the output without any actual I/O.
class ReportPrinter {
  ReportPrinter(this.formatter, this.sink);
  final ReportFormatter formatter;
  final void Function(String) sink;

  void print(Report report) {
    throw UnimplementedError('TODO: sink(formatter.format(report))');
  }
}
