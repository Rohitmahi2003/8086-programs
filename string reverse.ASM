DATA SEGMENT
    STR1 DB 30 DUP("$")
    STR2 DB 30 DUP("$")
    MSG1 DB 13,10,"ENTER STRING: $"
    REV_MSG DB 13,10,"REVERSED STRING: $"
DATA ENDS

CODE SEGMENT
ASSUME CS:CODE, DS:DATA
START:
    MOV AX,DATA
    MOV DS,AX
    
    ; Prompt for string input
    LEA DX,MSG1
    MOV AH,09H
    INT 21H
    
    ; Read string
    LEA SI,STR1
LOOP0:
    MOV AH,01H
    INT 21H
    CMP AL,13
    JE SKIP0
    MOV [SI],AL
    INC SI
    JMP LOOP0

SKIP0:
    MOV BYTE PTR [SI],'$'   ; Null terminate string
    
    CALL REVERSE
    
    MOV AH,4CH
    INT 21H

REVERSE PROC
    LEA SI,STR1
    LEA DI,STR2
    MOV CX,0

    ; Find string length
FIND_LEN:
    CMP BYTE PTR [SI],'$'
    JE FOUND_LEN
    INC SI
    INC CX
    JMP FIND_LEN

FOUND_LEN:
    DEC SI

REV_LOOP:
    CMP CX,0
    JE REV_DONE
    MOV AL,[SI]
    MOV [DI],AL
    DEC SI
    INC DI
    DEC CX
    JMP REV_LOOP

REV_DONE:
    MOV BYTE PTR [DI],'$'  ; Null terminate reversed string
    
    LEA DX,REV_MSG
    MOV AH,09H
    INT 21H
    
    LEA DX,STR2
    MOV AH,09H
    INT 21H
    RET
REVERSE ENDP

CODE ENDS
END START
