;Program to find sum of two 64-bit numbers.
;Summation is stored in RESULT.
;Values in NUM1 and NUM2 are two 64-bit input numbers.

            AREA Addition, CODE, READONLY
            ENTRY

            LDR     R0, =VALUE1
            LDR     R1, [R0]
            LDR     R2, [R0,#4]
            LDR     R0, =VALUE2
            LDR     R3, [R0]
            LDR     R4, [R0,#4]
            ADDS    R6, R2, R4
            ADC     R5, R1, R3
            LDR     R0, =RESULT
            STR     R5, [R0]        ;Stores Result
            STRH    R6, [R0,#4]
STOP        B       STOP

VALUE1      DCD     0x11111111, 0x33333333
VALUE2      DCD     0x44444444, 0x77777777

            AREA    ANSWER, DATA, READWRITE
RESULT      DCD     0x0, 0x0

            END