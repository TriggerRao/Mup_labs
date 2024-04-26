.model tiny ; Set memory model to tiny (code and data in one segment)
.386 ; Target 80386 processor

.data ; Data segment
cnt db 07h ; Define a byte 'cnt' containing the length of the input string (9 characters)
fib db 01h
prev_fib db 01h

.code ; Code segment
.startup ; Executable code starts here

    ; SET DISPLAY MODE
    ; Set video mode to 80x25 text, 16 colors
    MOV AH, 00H
    MOV AL, 03H
    INT 10H

    ; INITIALIZING
    ; Load the addresses of the input string, length counter, and column position into registers
    LEA DI, cnt
    MOV CH, 00h
    MOV CL, [DI]
    MOV DH, 00

    ; WRITING CHAR
    WRITE1:
    PUSH CX ; Save count value on the stack

    ; SETTING CURSOR POS
    ; Set the cursor position to row 20 and column specified by colmstr
    LEA SI, fib
    MOV AL, 'A'
    ADD AL, [SI]
    DEC AL
    MOV DL, 00
    MOV BX, 00
    INC DH; Row

    ROW:
    PUSH BX

    MOV AH, 02H
    INC DL
    MOV BH, 00
    INT 10H

    ; Write a single character with custom color and no blinking
    MOV AH, 09H
    MOV BH, 00

    ; Set text color (foreground and background)
    MOV BL, 00001111b ; Black background, White foreground
    ; Adjust BL according to your desired text color

    ; Set no blinking
    MOV CX, 01
    INT 10H

    POP BX
    INC BX
    CMP BL, [SI]
    JNE ROW

    ; CHANGING VERTICES
    ; Increment the input string pointer, column position,
    ; and decrement the length counter  
    MOV AL, fib
    MOV BL, prev_fib
    MOV CL, AL
    ADD AL, BL
    MOV BL, CL

    MOV fib, AL
    MOV prev_fib, BL
    
    POP CX ; Restore count value from the stack

    DEC CL
    JNZ WRITE1 ; Repeat for all characters in the input string

    ; BLOCKING FUNCTION
    ; Wait for the user to press the '%' key to exit
    END1:
    MOV AH, 07H
    INT 21h
    CMP AL, "%"
    JNZ END1

    ; TERMINATE PROGRAM
    TERM:
    MOV AH, 4CH ; Exit function
    INT 21H

.exit ; Mark the end of the program
end ; End the program
