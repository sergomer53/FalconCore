# FalconCore

An experimental operating system created by Andrea Lezzi.

## Features
- Written in Assembly (x86 architecture)
- Compiled using NASM (Netwide Assembler)
- Features a custom bootloader (`boot.bin`)

## How to Download and Run

### 1. Download the Project
To get the files, click the green **Code** button at the top of this page and select **Download ZIP**, or download the files directly from the repository folder.

### 2. Requirements
To test and run this operating system, you will need a PC emulator. We recommend using **QEMU**, **Bochs**, or **VirtualBox**.

### 3. How to Execute
If you have **QEMU** installed on your computer, you can launch the boot binary immediately by opening your terminal or command prompt inside the project folder and typing:

```bash
qemu-system-x86_64 -drive format=raw,file=FalconCore/boot.bin
```

Alternatively, you can load `boot.bin` as a raw floppy/hard disk image in VirtualBox or Bochs.
