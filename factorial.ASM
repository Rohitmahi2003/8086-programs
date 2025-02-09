DATA SEGMENT
    MSG1 DB 13,10, "ENTER A NUMBER: $"
    MSG2 DB 13,10, "FACTORIAL: $"
    NUM DB ?       ; Stores user input
    FACT DW 1      ; Stores factorial result
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA

START:
    MOV AX, DATA
    MOV DS, AX

    ; Display message to enter number
    LEA DX, MSG1
    MOV AH, 09H
    INT 21H

    ; Read a single digit number
    MOV AH, 01H
    INT 21H
    SUB AL, 30H   ; Convert ASCII to integer
    MOV NUM, AL

    ; Compute factorial
    MOV AL, NUM
    CBW           ; Convert AL to AX (extend sign)
    CALL FACTORIAL
    MOV FACT, AX  ; Store result

    ; Display factorial message
    LEA DX, MSG2
    MOV AH, 09H
    INT 21H

    ; Convert result to ASCII and print
    CALL PRINT_RESULT

    MOV AH, 4CH  ; Exit program
    INT 21H

FACTORIAL PROC
    CMP AL, 1
    JBE DONE
    DEC AL
    PUSH AX
    CALL FACTORIAL
    POP BX
    MUL BX
DONE:
    RET
FACTORIAL ENDP

PRINT_RESULT PROC
    MOV BX, 10   ; Divisor
    MOV CX, 0    ; Digit counter

CONVERT_LOOP:
    MOV DX, 0
    DIV BX       ; AX / 10, remainder in DX
    PUSH DX      ; Store remainder (last digit)
    INC CX       ; Increase digit count
    CMP AX, 0
    JNE CONVERT_LOOP

PRINT_LOOP:
    POP DX
    ADD DL, 30H  ; Convert to ASCII
    MOV AH, 02H
    INT 21H
    LOOP PRINT_LOOP

    RET
PRINT_RESULT ENDP

CODE ENDS
END START
