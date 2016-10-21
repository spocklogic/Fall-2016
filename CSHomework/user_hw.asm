.DATA
.ADDR x3000
CROSS	.FILL x0018 ;Cross Data
	.FILL x0018
	.FILL x0018
	.FILL x00FF
	.FILL x00FF
	.FILL x0018
	.FILL x0018
	.FILL x0018
RED   	.UCONST x7C00 ;Constants
GREEN 	.UCONST x03E0
BLACK	.UCONST x0000
I	.UCONST x69
K	.UCONST x6B
J	.UCONST x6A
L	.UCONST x6C
ENTER	.UCONST xA
TEMP	.BLKW #2 ;Temporary Storage
XCENTER .CONST x0
YCENTER .CONST x1
TEXT 	.STRINGZ "All Done" ;Message
XMAX 	.UCONST #128 ;Size of Video Screen
YMAX	.UCONST #124

.CODE
.ADDR x0000
	LEA R3 CROSS ;Draw initial screen
	CONST R0 #60
	CONST R1 #58
	LC R2 RED
	TRAP x06
	CONST R2 x1
	CONST R3 x1
	LC R4 GREEN
	CONST R0 #64
	CONST R1 #62
	TRAP x05
	CONST R0 #60
	CONST R1 #58
LOOP 
	LEA R6 TEMP ;Store initial cross coordinates
	STR R0 R6 x0
	STR R1 R6 x1
	CONST R0 xD0 ;Set timer length
	HICONST R0 x07
	TRAP x08 ;Get character
	CMPI R0 x0 ;Check for characters
	LEA R6 TEMP
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
	BRz ENTERM
	BR CENTER
DRAW	;Draw new cross and line
	LEA R6 TEMP
	STR R0 R6 x0
	STR R1 R6 x1
	LC R0 BLACK
	TRAP x03
	LC R2 RED
	LEA R6 TEMP
	LDR R0 R6 x0
	LDR R1 R6 x1
	LEA R3 CROSS
	TRAP x06
	LEA R6 TEMP
	LDR R0 R6 x0
	LDR R1 R6 x1
	CONST R2 x1
	CONST R3 x1
	LC R4 GREEN
	ADD R0 R0 #4
	ADD R1 R1 #4
	TRAP x05
	LEA R6 TEMP
	LDR R0 R6 x0
	LDR R1 R6 x1
	BR LOOP
CENTER ;Change cross to center
	CONST R0 #60
	CONST R1 #58
	BR DRAW
FORWARD ;Move cross coordinate forward
	LDR R0 R6 x0
	LDR R1 R6 x1
	ADD R1 R1 #-10
	BR CHECK
BACK	; Move cross coordinate back
	LDR R0 R6 x0
	LDR R1 R6 x1
	ADD R1 R1 #10
	BR CHECK
LEFT	;Move cross coordinate left
	LDR R0 R6 x0
	LDR R1 R6 x1
	ADD R0 R0 #-10
	BR CHECK
RIGHT	;Move cross coordinate right
	LDR R0 R6 x0
	LDR R1 R6 x1
	ADD R0 R0 #10
	BR CHECK
CHECK 	;Check for overflow
	CMPI R0 #0
	BRn CENTER
	CMPI R1 #0
	BRn CENTER
	LC R5 XMAX
	ADD R5 R5 #-8
	CMP R0 R5
	BRp CENTER
	LC R5 YMAX
	ADD R5 R5 #-8
	CMP R1 R5
	BRp CENTER
	BR DRAW
ENTERM 	;Ending message
	LEA R0 TEXT
	TRAP x02
END
