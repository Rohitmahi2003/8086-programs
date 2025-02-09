#8086 Assembly Programs

#Introduction

This repository contains 8086 assembly language programs written for educational purposes. The programs are designed to run in an 8086 emulator such as DOSBox with MASM (Microsoft Macro Assembler) or TASM (Turbo Assembler).

#Requirements

To run these programs, you need the following:

#DOSBox Emulator

MASM (Microsoft Macro Assembler) or TASM (Turbo Assembler)

Windows/Linux with DOSBox installed
Installation and Setup
Windows:
Download and install DOSBox.

Download MASM or TASM and place it inside a directory (e.g., C:\MASM or C:\TASM).

Mount the directory in DOSBox:
mount C C:\MASM
C:

Linux (Using DOSBox):

Install DOSBox using:

sudo apt install dosbox

Place MASM or TASM inside a directory (e.g., ~/dos_programs).

Run DOSBox and mount the directory:

mount C ~/dos_programs
C:

Compiling and Running Programs

#Using MASM:

Assemble the program:
    masm program.asm;
Link the program:
    link program.obj;
Run the executable:
    program.exe

#Using TASM:

Assemble the program:
    tasm program.asm
  
Link the program:
    tlink program.obj

Run the executable:
    program.exe

Program List

hello.asm: Displays "Hello, World!" on the screen.

addition.asm: Adds two numbers and displays the result.

factorial.asm: Computes the factorial of a given number.

string_reverse.asm: Reverses a given string.

palindrome.asm: Checks if a given string is a palindrome.

References:
8086 Assembly Language Programming
DOSBox Official Website

Author
#ROHITH R

License
This project is licensed under the MIT License - see the LICENSE file for details.
