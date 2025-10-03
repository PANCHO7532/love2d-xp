#!/bin/bash
## Only 64 bit prepackage for now
mkdir ship
cp build/love/*.dll ship/
cp build/love/*.exe ship/
cp build/bin/*.dll ship/
cp build/SDL2/*.dll ship/
cp build/mpg123/*.dll ship/
cp build/openal-soft/*.dll ship/
cp /usr/x86_64-w64-mingw32/bin/libgcc_s_seh-1.dll ship/
cp /usr/x86_64-w64-mingw32/bin/libstdc++-6.dll ship/
cp /usr/x86_64-w64-mingw32/bin/libwinpthread-1.dll ship/
zip -9 -r lovexp-build.zip ship/
