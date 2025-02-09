DATA SEGMENT
    STR1 DB 30 DUP("$")
    MSG1 DB 13,10,"ENTER STRING: $"
    PAL_MSG DB 13,10,"STRING IS A PALINDROME$"
    NOT_PAL_MSG DB 13,10,"STRING IS NOT A PALINDROME$"
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
    
    CALL PALINDROME
    
    MOV AH,4CH
    INT 21H

PALINDROME PROC
    LEA SI,STR1
    MOV CX,0
    
    ; Find string length
FIND_LEN:
    CMP BYTE PTR [SI],'$'
    JE FOUND_LEN
    INC SI
    INC CX
    JMP FIND_LEN

FOUND_LEN:
    DEC SI ; Point to last character
    LEA DI,STR1 ; Point to first character
    MOV DX,CX
    SHR DX,1 ; DX = CX / 2
    
CHECK_LOOP:
    CMP DX,0
    JE IS_PAL
    MOV AL,[DI]
    MOV BL,[SI]
    CMP AL,BL
    JNE NOT_PAL
    INC DI
    DEC SI
    DEC DX
    JMP CHECK_LOOP

IS_PAL:
    LEA DX,PAL_MSG
    MOV AH,09H
    INT 21H
    RET

NOT_PAL:
    LEA DX,NOT_PAL_MSG
    MOV AH,09H
    INT 21H
    RET
PALINDROME ENDP

CODE ENDS
END START
