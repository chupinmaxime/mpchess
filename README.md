# MPchess

This package allows you to draw chess boards and positions. The appearance of
the drawings is modern and largely inspired by what is offered by the excellent
web site [Lichess.org](lichess.org). Relying on METAPOST probably
allows more graphic flexibility than the excellent LaTeX packages.

_This package is in beta version, do not hesitate to report bugs, as well as
requests for improvement_.

## Github

To allow for easier feedback and bug reporting, this repository has a mirror
repository on github:
[https://github.com/chupinmaxime/mpchess](https://github.com/chupinmaxime/mpchess) 

## Installation

MPchess is on the [ctan](ctan.org) and can be installed via the package manager of your
distribution [https://www.ctan.org/pkg/mpchess](https://www.ctan.org/pkg/mpchess).

### With TeX live under Linux or MacOS

To install MPchess with TeX live, you will have to create the directory texmf
directory in your home. 
```bash
user $> mkdir ~/texmf
```

Then, you will have to place the .mp files in the
`~/texmf/tex/metapost/mpchess/`.

MPchess consists of 7 files METAPOST :
* `mpchess.mp`;
* `mpchess-chessboard.mp`;
* `mpchess-pgn.mp`;
* `mpchess-fen.mp`;
* `mpchess-cburnett.mp`;
* `mpchess-pieces.mp`;
* `mpchess-skak.mp`.

MPchess comes with a very basic chess font `mpchess font.ttf` that includes only
13 glyphs.   

Once this is done, MPchess will be loaded with the classic
```metapost
input mpchess
```

### With MikTEX and Windows

These two systems are unknown to the author of MPchess, so we refer to their
documentation to add local packages:
[http://docs.miktex.org/manual/localadditions.html](http://docs.miktex.org/manual/localadditions.html)

## Dependencies

MPchess depends on the packages METAPOST: `hatching` and, if MPchess is not
used with LuaLaTeX and luamplib, `latexmp`.

## Documentation

* [English documentation](doc/mpchess-doc-en.pdf)
* [Documentation en français](doc/mpchess-doc-fr.pdf)

### Piece Set

A piece set has been designed for this package. It has also be added to
[lichess.org](https://lichess.org) under the name of `mpchess`.

A dedicated git repository is available:
[https://plmlab.math.cnrs.fr/mchupin/mpchess-pieces](https://plmlab.math.cnrs.fr/mchupin/mpchess-pieces)
and
[https://github.com/chupinmaxime/mpchess-pieces](https://github.com/chupinmaxime/mpchess-pieces).

A TrueType font is available.  
## Contact

Maxime Chupin, `notezik(at)gmail.com`

## Licenses

This projet is under LATEX Project Public License 1.3c but the file
`mpchess-cburnett` is under GPLv2+ as asked by the author. 