;Program to sort n 32-bit given numbers in ascending order.

			AREA	ASCENDING, CODE, READONLY
			ENTRY
			MOV		R8, #5			;Initialize counter to 5(i.e. N=5)
			LDR		R2, =CVALUE		;Address of code region
			LDR		R3, =DVALUE		;Address of data region
LOOP0		
			LDR		R1, [R2], #4	;Loading values from code region
			STR		R1, [R3], #4	;Storing values to data region
			SUBS	R8, R8, #1		;Decrement counter
			CMP		R8, #0			;Compare counter with 0
			BNE		LOOP0			;Loop back till array ends
START
			MOV		R5, #4			;Initialize counter to 4(i.e. N-1)
			MOV		R7, #0			;Flag to denote exchange has occurred
			LDR		R1, =DVALUE		;Load the address of first value
LOOP
			LDR		R2, [R1], #4
			LDR		R3, [R1]
			CMP		R2, R3			;Compare numbers
			BLT		LOOP2			;If first number is < then goto LOOP2
			STR		R2, [R1], #-4	;Interchange numbers R2 and R3
			STR		R3, [R1]
			MOV 	R7, #1			;Flag denoting exchange has taken place
			ADD		R1, #4			;Restore the pointer
LOOP2
			SUBS	R5, R5, #1		;Decrement counter
			CMP		R5, #0			;Compare counter with 0
			BNE		LOOP			;Loop back till array ends
			CMP		R7, #0			;Comparing flag
			BNE		START
STOP		B		STOP

;Array of 32-bit numbers (N=5) in code region.
CVALUE		DCD		0x44444444, 0x11111111, 0x55555555, 0x33333333, 0x22222222
	
;Array of 32-bit numbers in data region.
			AREA	DATA1, DATA, READWRITE
DVALUE		DCD		0x0
			END