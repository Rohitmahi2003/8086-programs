.model small
.data
msg1 db 13,10,"num1:$"
msg2 db 13,10,"num2:$"
sum db 13,10,"sum:$"
TEN DW 10
.code
.stack
start: 
    mov ax,@data
    mov ds,ax
    lea dx,msg1
    mov ah,09h
    int 21h
    call input
    mov bh,dl
    lea dx,msg2
    mov ah,09h
    int 21h
    call input
    mov bl,dl
    mov ax,0000h
    mov al,bl
    mov cx,0000h
    mov cl,bh
    add ax,cx
    mov bx,ax
    mov ah,09h
    lea dx,sum
    int 21h
    call dec_output
    mov ah,4ch
    int 21h
  input proc
    call inputnum
    mov cl,04h
    rol dl,cl
    and dl,00f0h
    mov ch,dl
    call inputnum
    and dl,000fh
    add dl,ch
    ret
  input endp
  inputnum proc
     mov ah,01h
     int 21h
     cmp al,'A'
     jc inputnum_is_dec
     jmp inputnum_is_hex
  inputnum_is_hex:
     sub al,'A'
     add al,0Ah
     mov dl,al
     ret
  inputnum_is_dec:
      sub al,'0'
      mov dl,al
      ret
    inputnum endp
  dec_output proc
      mov cx,0
   output_loop:
      mov ax,bx
      mov dx,0
      DIV WORD PTR TEN
      push dx
      inc cx
      mov bx,ax
      cmp bx,0
      jnz output_loop
   display_digits:
      pop dx
      add dl,'0'
      mov ah,02h
      int 21h
      loop display_digits
      ret
   dec_output endp
      end start
      
   
