.model tiny
.data
S         db "BITSIOTLAB$"
S1        db "IOT$"
Slength db 10
S1length db 3

.code
.startup
    mov si, offset S
    mov di, offset S1
searchLoop:
    mov al, [si]
    mov bl, [di]
    cmp al, '$'
    .exit
    cmp bl, '$'
    je  copyRemaining
    cmp al, bl
    jne nextPosition
    inc si
    inc di
    jmp searchLoop

nextPosition:
    inc si
    mov di, offset S1
    jmp searchLoop

copyRemaining:
    mov cl, S1length
    mov ch, 00
    mov bx, si
    mov di, si
    sub si, cx
    sub bx, cx
    mov al, '*'
    mov [si], al 
    inc si
    
copyAll:
    mov al, [di]
    mov [si], al
    cmp al, '$'
    je nextPositionTemp 
    inc si
    inc di 
    jmp copyAll

nextPositionTemp: 
    mov si, bx 
    jmp nextPosition

.exit
end
