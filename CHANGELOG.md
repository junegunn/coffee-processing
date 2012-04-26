0.0.2
=====
- Prevents accidental assignment of `processing` variable which breaks the sketch.

```coffee
# This used to break the whole sketch
processing = null

setup = -> # ...
```

