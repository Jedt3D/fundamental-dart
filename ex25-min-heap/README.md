# Lesson 25 — Min-heap

> The root of a min-heap is always the smallest element. It's the
> backing structure of every priority queue you'll ever write.

## The story

An implicit binary tree stored in a `List<T>`. For index `i`:
- parent = `(i - 1) ~/ 2`
- left   = `2*i + 1`
- right  = `2*i + 2`

**Push (sift-up):** add at end, swap with parent while smaller.
**Pop (sift-down):** take root, move last to root, swap with smaller
child while heap property is violated.

## Your mission

Finish `lib/ex25_min_heap.dart`:

1. `push(v)` — add + sift-up.
2. `peek()` — root.
3. `pop()` — root + sift-down.
4. `length` / `isEmpty`.
5. Both `pop()` and `peek()` must throw `StateError` when empty.

## Run the tests

```bash
cd ex25-min-heap && dart pub get && dart test
```
