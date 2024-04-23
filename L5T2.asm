.model tiny
.data
max1 db 20
act1 db ?
string1 db 20 dup(0) 
.code
.startup
    lea dx, max1
    mov ah, 0ah
    int 21h
    lea si, string1
x1: mov al, [si]
    cmp al, '$'
    je x2
    sub al, 32
    mov [si], al 

x2: lea dx, string1
    mov ah, 09h
    int 21h
    mov dl, 0ah
    mov ah, 02h
    int 21h
.exit
end
