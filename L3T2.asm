.model tiny
.data
array1 db 23, -8, 16, -5, 33, -7, -19
count db 7
neg1 db ?
.code
.startup
lea cl,count
mov dl,0
lea si, array1
loop2: mov al,[si]    
       cmp al,0
       jge x1
       inc dl
loop1: inc si
       loop loop2
lea di,neg1
mov [di],dl
.exit
end
