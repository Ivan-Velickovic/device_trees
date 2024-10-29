# Scripts for dealing with Device Trees

This repository contains a couple of useful scripts for
dealing with Device Trees in blob and source format.

## Dependencies

Since this will call into the Linux Makefile, we depend on:
* GNU Make
* A host C compiler
* Device Tree Compiler

The scripts should run on both Linux and macOS since we are just
compiling the Device Trees and not an actual Linux kernel.

## Usage

```sh
# Get a version of Linux source
$ git clone git@github.com:torvalds/linux.git --depth 1 --single-branch --branch v6.11
# Compile all the Device Tree Blobs using the path to Linux source
$ ./from_linux.sh linux
$ ls dtbs
...
# Convert to Device Tree Source
$ ./dts.sh
$ ls dts
...
```

## Motivation

I have to deal with Device Trees very often in my current work. I don't work on Linux itself,
but it acts as the source of truth for many target platforms I deal with for Device Trees
and their bindings.

I often have some kind of board where I need to inspect a Device Tree and so the easiest way
to do that is to compile the DTSI files in Linux source to a DTB and then de-compile that to
a DTS.

This repository just automates that process.
