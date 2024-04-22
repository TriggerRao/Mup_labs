.model tiny
.data
    array db 91h, 02h, 83h, 75h, 0Ah, 47h, 12h, 76h, 61h
.code
.startup
    lea bx, array
    mov cl, 9h
    mov al, 0Ah
loop1: cmp [bx], al
    jnz loop2
    mov dl, 55h
    mov [bx], dl
loop2: inc bx
    dec cl
    jnz loop1
.exit
end
