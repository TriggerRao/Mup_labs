.model tiny ; Set memory model to tiny (code and data in one segment)
.386 ; Target 80386 processor

.data ; Data segment
inp1 db 'Tarun Rao' ; Define a byte array 'inp1' containing the input string 'MyName'
colmstr dw ? ; Define a word 'colmstr' to store the column position of the next character
cnt db 09h ; Define a byte 'cnt' containing the length of the input string (9 characters)

.code ; Code segment
.startup ; Executable code starts here

    ; SET DISPLAY MODE
    ; Set video mode to 80x25 text, 16 colors
    MOV AH, 00H
    MOV AL, 03H
    INT 10H

    ; INITIALIZING
    ; Load the addresses of the input string, length counter, and column position into registers
    LEA SI, inp1
    LEA DI, cnt
    MOV CH, 00h
    MOV CL, [DI]
    MOV colmstr, CX ; Set initial column position to 9
    LEA DI, colmstr

    ; WRITING CHAR
    WRITE1:
    PUSH CX ; Save count value on the stack

    ; SETTING CURSOR POS
    ; Set the cursor position to row 20 and column specified by colmstr
    MOV AH, 02H
    MOV DH, [DI] ; Row
    MOV DL, [DI] ; Column
    MOV BH, 00
    INT 10H

    ; Write a single character with custom color and no blinking
    MOV AH, 09H
    MOV AL, [SI] ; Load character from input string
    MOV BH, 00

    ; Set text color (foreground and background)
    MOV BL, 10101000b ; Black background, White foreground
    ; Adjust BL according to your desired text color

    ; Set no blinking
    MOV CX, 01
    INT 10H
    POP CX ; Restore count value from the stack

    ; CHANGING VERTICES
    ; Increment the input string pointer, column position,
    ; and decrement the length counter
    INC SI
    DEC WORD PTR[DI]
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
