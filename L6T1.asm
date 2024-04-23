.model tiny
.data
string1 db 'Please enter your name: $'
max1 db 32
act1 db ? 
inp1 db 32 dup('$')
fname db 'testing.txt', 0
handle dw ?
.code
.startup
    lea dx, string1
    mov ah, 09h
    int 21h

    lea dx, max1
    mov ah, 0ah
    int 21h

    mov ah, 3ch
    lea dx, fname
    mov cl, 1h
    int 21h
    mov handle, ax

    mov ah, 3dh
    mov al, 1h
    lea dx, fname
    int 21h
    mov handle, ax

    mov ah, 40h
    mov bx, handle
    mov cx, 10
    lea dx, act1
    int 21h

    mov ah, 3eh
    int 21h
    
.exit
end
