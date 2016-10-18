.DATA
.ADDR x3000
CROSS	.FILL x001F ;Cross Data
	.FILL x001F
	.FILL x001F
	.FILL x001F
	.FILL x001F
	.FILL x001F
	.FILL x001F
	.FILL x001F
RED   	.UCONST x7C00 ;Constants
GREEN 	.UCONST x03E0
I	.UCONST x69
K	.UCONST x6B
J	.UCONST x6A
L	.UCONST x6C
ENTER	.UCONST xA
TEMP	.BLKW #2 ;Temporary Storage
XCENTER .CONST x1
YCENTER .CONST x2
TEXT 	.STRINGZ "All Done" ;Message
XMAX 	.UCONST #128 ;Size of Video Screen
YMAX	.UCONST #124

.CODE
.ADDR x0000
	LEA R3 CROSS ;Draw initial screen
	CONST R0 #64
	CONST R1 #62
	LC R2 RED
	TRAP x06
	CONST R2 x1
	CONST R3 x1
	LC R4 GREEN
	TRAP x05
LOOP 
	LEA R6 TEMP ;Store initial cross coordinates
	STR R0 R6 XCENTER
	STR R1 R6 YCENTER
	CONST R0 xD0 ;Set timer length
	HICONST R0 x07
	TRAP x08 ;Get character
	CMPI R0 x0 ;Check for characters
	BRz CENTER
	LC R5 I
	CMP R0 R5
	BRz FORWARD
	LC R5 K
	CMP R0 R5
	BRz BACK
	LC R5 J
	CMP R0 R5
	BRz LEFT
	LC R5 L
	CMP R0 R5
	BRz RIGHT
	LC R5 ENTER
	CMP R0 R5
	BRz ENTER
	BR CENTER
DRAW	;Draw new cross and line
	LC R2 RED
	TRAP x06
	CONST R2 x1
	CONST R3 x1
	LC R4 GREEN
	TRAP x05
	BR LOOP
CENTER ;Change cross to center
	CONST R0 #64
	CONST R1 #62
	BR DRAW
FORWARD ;Move cross coordinate forward
	LDR R0 R6 XCENTER
	LDR R1 R6 YCENTER
	ADD R1 R1 #10
	BR CHECK
BACK	; Move cross coordinate back
	LDR R0 R6 XCENTER
	LDR R1 R6 YCENTER
	ADD R1 R1 #-10
	BR CHECK
LEFT	;Move cross coordinate left
	LDR R0 R6 XCENTER
	LDR R1 R6 YCENTER
	ADD R0 R0 #-10
	BR CHECK
RIGHT	;Move cross coordinate right
	LDR R0 R6 XCENTER
	LDR R1 R6 YCENTER
	ADD R0 R0 #10
	BR CHECK
CHECK 	;Check for overflow
	CMPI R0 #0
	BRn CENTER
	CMPI R1 #0
	BRn CENTER
	LC R5 XMAX
	CMP R0 R5
	BRp CENTER
	LC R5 YMAX
	CMP R1 R5
	BRp CENTER
	BR DRAW
ENTER 	;Ending message
	LEA R0 TEXT
	TRAP x02
END
