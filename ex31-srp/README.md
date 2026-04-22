# Lesson 31 — Single Responsibility Principle (SRP)

> *A class should have one, and only one, reason to change.* — Robert
> C. Martin.

## The story

A `Report` that holds data, formats itself, and prints itself changes
when the schema changes, **and** when the format changes, **and** when
the output destination changes — three axes, one class.

Splitting into `Report` (data), `ReportFormatter` (presentation), and
`ReportPrinter` (I/O) gives each class a single axis of change.

## Your mission

Make the three small classes in `lib/ex31_srp.dart` pull their
weight — one responsibility each.

## Run the tests

```bash
cd ex31-srp && dart pub get && dart test
```
