0.0.5
=====
- Experimental image/font preloading.

0.0.4
=====
- Correctly adjusts line number in parse error message

0.0.3
=====
- Constants (e.g. `P3D`, `RGB`) are now directly accessible without `processing` variable or shortcut methods.
- The same holds true for `ArrayList`, `HashMap`, `PVector`, `ObjectIterator` and `PConstants`

0.0.2
=====
- Prevents accidental assignment of `processing` variable which breaks the sketch.

```coffee
# This used to break the whole sketch
processing = null

setup = -> # ...
```

