# LOVE2D for Windows XP
Because it's fun to see if it's possible

> [!IMPORTANT]  
> The source code shown in this repository is exclusively intended to use under Windows **XP**
>
> Issues and support for other operating systems will not be covered or discussed.

> [!NOTE]
> Everything is wired to work exclusively via cross-compilation with MinGW on Linux.
>
> Support for other compilers are not covered and I don't guarantee you that it compiles on anything else that's not MinGW

## Compile instructions
You need a linux distribution. Period.
No Windows (unironically), no MSYS (probably), just Linux!

> Installing MinGW

The instructions vary according the linux distribution, the general gist for Ubuntu is running:

`sudo apt install build-essential gcc g++ cmake make g++-mingw-w64-x86-64 gcc-mingw-w64-x86-64`

> Preparing the build

Spin up a terminal on this directory and write `cmake -B build -DCMAKE_TOOLCHAIN_FILE="${CMAKE_SOURCE_DIR}/mingw32.cmake"`

If you want to prepare the build for 64-bit, change the command part where it says `mingw32` to `mingw64`

> Building

Execute `cmake --build build --target love --config Release` and pray

> Running

By default, binaries are seemengly not moved properly in one-folder, you need to grab `love.dll` (`libliblove.dll` in some cases) and `love.exe` from `build/love` and put it on a clean directory, then grab the compiled luajit in `bin` directory, libmpg123, OpenAL32.dll, SDL2.dll from their respective directories on `build` directory, and finally, `libgcc*.dll`, `libstdc++6.dll` and `libwinpthread-1.dll` from `/usr/(arch)-w64-mingw32/bin`, where `(arch)` might be `i686` if you targeted 32 bits, `x86_64` if you targeted 64 bits. (If you can't find any of these last dlls, check the `lib` or `lib64` folder as distros sometimes put them there)

Once you've got all the DLLs in one single folder, including the executable for the engine, you can now safely run `love.exe`

## Why?
Currently I'm stuck with an [laptop](https://soporte.exo.com.ar/support/solutions/articles/22000272369-netbook-exo-smart-x352) that has Windows XP x64 SP2, and I want to compile stuff for it just to see how "modern" software holds up on old-systems, Love2D is one of them.

I personally think that a modern game engine running on XP is hilariously awesome and interesting to see, so I'll be treating this repo as a playground to see if I can make it work.

## How?
By disabling a lot of code, pasting equivalent functions for modern functions and a little bit of *love* it surely can compile!

MinGW is the compiler of choice in this journey, not only it can compile for Windows XP with a few defines, but it can go as far as NT 4! Though with the current state of LOVE2D, the hard stop will be Windows XP anyway.

This repository is a fusion of the megasource/love2d repos in order to keep the dependencies and engine code in one-place for convenience.

## The future
I'm a solo-dev on this little side-project. If you want to collaborate, then feel free to do so! Currently I'm on college so new changes won't be rolling out as often as I'd like to.

## Original README

Megasource is a CMake-buildable collection of all [LÖVE][love2d] dependencies.

It is currently only officially supported on Windows, but may also work on macOS. It could certainly also work on Linux, but good package managers makes megasource less relevant there.

Versions
--------

This repository uses git tags for the library dependencies of a specific released version of LÖVE.

For in-development versions of LÖVE, there may be a branch in this repository corresponding to a similar branch in the love repository.

Prerequisites
-------------

 - Windows.
 - LOVE 12+: [Visual Studio 2019][vs2019] or newer.
 - LOVE 11 and older: [Visual Studio 2013][oldvs] or newer. Official builds of LOVE 11 and older use Visual Studio 2013.
 - [CMake 3.1][cmake] or greater.
 - [NSIS][nsis] if you want to build the LÖVE installer.

Building
--------

To build just the dependencies for 64 bit x86 using Visual Studio 2019:

	$ git clone https://github.com/love2d/megasource megasource
	$ cd megasource
	$ cmake -G "Visual Studio 16 2019" -A x64 -H. -Bbuild
	$ cmake --build build --target megatest --config Release

... or you can open the solution file in Visual Studio and build from there instead of invoking cmake --build.

To build for a different version of Visual Studio (or a different build tool), replace ```"Visual Studio 16 2019"``` with one of the other [build system generators][generators]. For example Visual Studio 2022 is ```"Visual Studio 17 2022"```.

Similarly, to build for a different architecture than 64 bit x86, use a different [architecture name][architectures] for the ```-A``` parameter.

Note that ```-H``` has been replaced in CMake 3.13 with ```-S```.

If you want to build [LÖVE][love2d], clone LÖVE into the *libs* folder. Megasource will automatically look for it there. E.g.:

	$ git clone https://github.com/love2d/megasource megasource
	$ cd megasource
	$ git clone https://github.com/love2d/love libs/love
	$ cmake -G "Visual Studio 16 2019" -A x64 -H. -Bbuild
	$ cmake --build build --target love/love --config Release

The binaries can be found in *build/love/Release*.

If you want to build the installer, replace the previous build command with:

    $ cmake --build build --target PACKAGE --config Release

A zip with the binaries and the installer will appear in *build*.

[love2d]: http://love2d.org
[cmake]: http://www.cmake.org/
[nsis]: http://nsis.sourceforge.net
[vs2019]: https://visualstudio.microsoft.com/downloads/
[oldvs]: https://visualstudio.microsoft.com/vs/older-downloads/
[generators]: https://cmake.org/cmake/help/latest/manual/cmake-generators.7.html#visual-studio-generators
[architectures]: https://cmake.org/cmake/help/latest/generator/Visual%20Studio%2016%202019.html#platform-selection
