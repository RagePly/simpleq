# SimplEq

Render basic Tex math environment equations to PNG's in high resolution.

Just mean to fit my basic need of managing and rendering high resolution equations
in presentations.

## Usage

### `simpleq`

`simpleq` *simply* inserts an equation supplied from `stdin` into this latex document:

```tex
\documentclass{standalone}
\usepackage{amsmath}
\begin{document}
    \begin{equation*}
        [...]
    \end{equation*}
\end{document}
```

It then renders it to a PDF before cropping and rasterizing that document to a PNG, sending the
binary to `stdout`.

Thus, `simpleq` takes no arguments.

### `batcheq`

`batcheq` has the following usage:

```
batcheq outdir files...
```

It will run `simpleq` in parallel, rendering all `files` and writing the output to `outdir`
using the same *basename(s)* as the source(s), but with the `.png` prefix.

### `cleaneq`

Compiling Latex-documents produces a lot of artifacts, use this to clean up any temporary files, if you want.

