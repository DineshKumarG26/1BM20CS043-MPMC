.MODEL SMALL

DISPLAY MACRO MSG
        LEA DX, MSG
        MOV AH, 09H
        INT 21H

ENDM

DISPCHAR MACRO
        MOV AH, 02H
        INT 21H

ENDM

.DATA
MSG1 DB 0DH, 0AH, "ENTER A ALPHANUMERIC CGARACTER::$"

.CODE
START : MOV AX, @DATA
        MOV DS, AX
        DISPLAY MSG1
        MOV AH, 01H
        INT 21H
        PUSH AX
        MOV AH, 00H
        MOV AL, 03H
        INT 10H
        MOV AH, 02H
        MOV BH, 00H
        MOV DH, 12D
        MOV DL, 40D
        INT 10H
        POP AX
        AAM
        PUSH AX
        MOV AL, AH
        XOR AH, AH
        AAM
        ADD AX, 3030H
        MOV DL, AH
        PUSH AX
        DISPCHAR
        POP AX
        MOV DL, AL
        DISPCHAR
        POP AX
        ADD AL, 30H
        MOV DL, AL
        DISPCHAR
        MOV AH, 07H
        INT 21H
        JMP FINAL

FINAL: MOV AH, 4CH
       INT 21H

END START
