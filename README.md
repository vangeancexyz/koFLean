# KoFLean

KoFLean is a Linux runtime ELF module inspector written entirely in Kof.

It was built for offensive-security and game-hacking research: given a running process, KoFLean turns `/proc/<pid>/maps` into a catalog of loaded modules and reports their ASLR base, end address, span, segments, permissions, path, inode, and deleted state.

## Use cases

- Confirm that an internal `.so` became resident after loading.
- Inspect the runtime base of game modules such as `client.so`.
- Diagnose failed initialization after a loader reports success.
- Find stale, duplicated, or deleted builds still mapped in memory.
- Compare the process footprint of internal and external instrumentation.

## Usage

```bash
make check
make run PROCESS=process_linux
make run PROCESS=process_linux MODULE=lib.so
make run PROCESS=process_linux MODULE=client.so
make run PROCESS=process_linux MODULE=lib.so VERBOSE=1
```

Example module result:

```text
[MODULE FOUND]
name        : lib.so
base        : 0x7f...
end         : 0x7f...
segments    : 5
permissions : r--p | r-xp | rw-p
deleted     : no
```

KoFLean reports observable runtime state. It does not determine whether a module is legitimate or prove how it was loaded.

For authorized research and controlled environments only.
