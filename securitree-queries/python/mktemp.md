---
name: use mkstemp instead of mktemp
severity: warning

---

> Use of this function may introduce a security hole in your program.
> By the time you get around to doing anything with the file name it
> returns, someone else may have beaten you to the punch.

<https://docs.python.org/3/library/tempfile.html#tempfile-mktemp-deprecated>
