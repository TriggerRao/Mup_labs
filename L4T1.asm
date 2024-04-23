.model tiny
.data
dat1 db 'wasitaatisaw'
dat1length db 0ch
res dw 00h
.code
.startup

    lea si, dat1
    lea di, dat1
    mov cl, dat1length
    mov ch, 00h
    add di, cx
    dec di
    loop1: mov al, [si] 
           mov bl, [di]       
           cmp al, bl
           jnz exit
           inc si
           dec di
           dec cl
           dec cl
           jnz loop1 
           
    lea si, res
    mov al, 01h
    mov [si], al
    jmp exit

exit: .exit
end
