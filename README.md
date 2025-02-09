# 8086 Assembly Programs

## Introduction
This repository contains 8086 assembly language programs written for educational purposes. The programs are designed to run in an 8086 emulator such as DOSBox with MASM (Microsoft Macro Assembler) or TASM (Turbo Assembler).

## Requirements
To run these programs, you need the following:
- DOSBox Emulator
- MASM (Microsoft Macro Assembler) or TASM (Turbo Assembler)
- Windows/Linux with DOSBox installed

## Installation and Setup
### Windows:
1. Download and install DOSBox.
2. Download MASM or TASM and place it inside a directory (e.g., `C:\MASM` or `C:\TASM`).
3. Mount the directory in DOSBox:
   ```
   mount C C:\MASM
   C:
   ```

### Linux (Using DOSBox):
1. Install DOSBox using:
   ```
   sudo apt install dosbox
   ```
2. Place MASM or TASM inside a directory (e.g., `~/dos_programs`).
3. Run DOSBox and mount the directory:
   ```
   mount C ~/dos_programs
   C:
   ```

## Compiling and Running Programs
### Using MASM:
1. Assemble the program:
   ```
   masm program.asm;
   ```
2. Link the program:
   ```
   link program.obj;
   ```
3. Run the executable:
   ```
   program.exe
   ```

### Using TASM:
1. Assemble the program:
   ```
   tasm program.asm
   ```
2. Link the program:
   ```
   tlink program.obj
   ```
3. Run the executable:
   ```
   program.exe
   ```

## Program List
- `hello.asm`: Displays "Hello, World!" on the screen.
- `addition.asm`: Adds two numbers and displays the result.
- `factorial.asm`: Computes the factorial of a given number.
- `string_reverse.asm`: Reverses a given string.
- `palindrome.asm`: Checks if a given string is a palindrome.

## References
- [8086 Assembly Language Programming](https://www.tutorialspoint.com/assembly_programming/index.htm)
- [DOSBox Official Website](https://www.dosbox.com/)

## Author
Rohith R

## License
This project is licensed under the MIT License - see the LICENSE file for details.

