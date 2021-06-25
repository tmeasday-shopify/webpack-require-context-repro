# webpack-require-context-repro

This project demonstrates that rebuild times suffer greatly when a `require.context()` is used that matches relatively few files in a project containing large number of files.

To reproduce:

```bash
yarn webpack serve
```

Uses a simple `require()` to include a single file, which itself has a single file dependency.

 - Build time: 350ms
 - Rebuild time: 10ms
 
```bash
USE_RC=1 yarn webpack serve
```

Uses a `require.context()` that only matches the same single file.

 - Build time: 6600ms
 - Rebuild time: 2700ms

The project contains 327703 empty JS files that do not match the glob.
