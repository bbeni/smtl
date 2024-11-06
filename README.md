# Show Me The Letter

SMTL is i command line utility for inspecting font files and generating glyph-tables as png. (Not finished)

## Quickstart Linux

### Install Freetype 2.13.3

```console
wget https://download.savannah.gnu.org/releases/freetype/freetype-2.13.3.tar.xz
tar -xvf freetype-2.13.3.tar.xz -C thirdparty/freetype
(cd ./thirdparty/freetype/freetype-2.13.3 && ./configure --prefix=$PWD/../linux && make -j15 && make install)
```

### Build

```console
odin build .
```

