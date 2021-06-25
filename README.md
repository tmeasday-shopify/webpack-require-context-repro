# webpack-require-context-repro

This project demonstrates that rebuild times suffer greatly when a `require.context()` is used that matches relatively few files in a project containing large number of files.

To reproduce:

```bash
yarn webpack serve
```

Uses a simple `require()` to include a single file, which itself has a single file dependency.

- Build time: 350ms
- Rebuild time: 10ms (`touch ./src/folder-0/folder-0/folder-0/file.js`)

```bash
USE_RC=1 yarn webpack serve
```

Uses a `require.context()` that only matches the same single file.

- Build time: 9500ms
- Rebuild time: 7000ms (`touch ./src/folder-0/folder-0/folder-0/file.js`)

```bash
USE_DYNAMIC=1 yarn webpack serve
```

Uses a `require(<pattern>)` that only matches the same single file.

- Build time: 9000ms
- Rebuild time: 8000ms (`touch ./src/folder-0/folder-0/folder-0/file.js`)

Numbers are just indicative.

The project contains ~300,000 empty JS files that do not match the glob.

Times above are for webpack 5, but times in webpack 4 are similar.
