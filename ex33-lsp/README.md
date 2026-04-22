# Lesson 33 — Liskov Substitution Principle (LSP)

> *If `S` is a subtype of `T`, objects of type `T` in a program may be
> replaced with objects of type `S` without altering any desirable
> properties of the program.*

## The story

Classic violation: `class Penguin extends FlyingBird { @override fly()
{ throw UnsupportedError('lol'); } }`. Code that accepts a `FlyingBird`
breaks when given a `Penguin`.

Fix: split capabilities into role interfaces (`Flier`, `Swimmer`).
Now every subtype honours its interface's contract, and `Penguin`
simply isn't a `Flier`.

## Your mission

Finish `fly()` / `swim()` in `lib/ex33_lsp.dart` so each bird only
implements the roles it can actually perform.

## Run the tests

```bash
cd ex33-lsp && dart pub get && dart test
```
