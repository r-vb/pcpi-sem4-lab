			AREA	Pgml, CODE, READONLY

			ENTRY
			MOV R0,#0x32
			MOV R1,#0x24
			SUB R2,R0,R1
 STOP		B	STOP
			END