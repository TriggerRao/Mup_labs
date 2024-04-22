.model tiny
.data
dat1 db 'wasitcatisaw'
dat1length db 0ch
res dw 00h
.code
.startup

    lea si, dat1
    lea di, dat1
    mov cl, dat1length
    add di, cl
    dec di
    loop1: cmp [si], [di]
           jnz exit
           inc si
           dec di
           dec cl
           dec cl
           jnz loop1 
           
    lea si, res
    mov al, 01h
    mov [si], 01h
    jmp exit

exit: .exit
end
