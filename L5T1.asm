.model tiny
.data
charA db "character entered is a$"
charNotA db "character entered is not a$"
.code
.startup
    mov ah, 08h
    int 21h

    cmp al, 'a'
    je charax
    cmp al, 'A'
    je charax 

    lea dx, charNotA
    mov ah, 09h
    int 21h
    .exit

charax: 
    lea dx, charA
    mov ah, 09h
    int 21h
.exit
end
