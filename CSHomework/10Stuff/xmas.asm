.FALIGN
.CODE
main
CONST R5 0x00
HICONST R5 0x80
ADD R6 R5 #0
CONST R0 x0
HICONST R0 x7C
STR R0 R6 #-1
ADD R6 R6 #-1
CONST R0 x14
HICONST R0 x0
STR R0 R6 #-1
ADD R6 R6 #-1
CONST R0 x64
HICONST R0 x0
STR R0 R6 #-1
ADD R6 R6 #-1
CONST R0 x64
HICONST R0 x0
STR R0 R6 #-1
ADD R6 R6 #-1
CONST R0 xE
HICONST R0 x0
STR R0 R6 #-1
ADD R6 R6 #-1
JSR lc4_draw_rect
CONST R0 x0
HICONST R0 x33
STR R0 R6 #-1
ADD R6 R6 #-1
CONST R0 x14
HICONST R0 x0
STR R0 R6 #-1
ADD R6 R6 #-1
CONST R0 x50
HICONST R0 x0
STR R0 R6 #-1
ADD R6 R6 #-1
CONST R0 x50
HICONST R0 x0
STR R0 R6 #-1
ADD R6 R6 #-1
CONST R0 x18
HICONST R0 x0
STR R0 R6 #-1
ADD R6 R6 #-1
JSR lc4_draw_rect
CONST R0 x0
HICONST R0 x7C
STR R0 R6 #-1
ADD R6 R6 #-1
CONST R0 x14
HICONST R0 x0
STR R0 R6 #-1
ADD R6 R6 #-1
CONST R0 x3C
HICONST R0 x0
STR R0 R6 #-1
ADD R6 R6 #-1
CONST R0 x3C
HICONST R0 x0
STR R0 R6 #-1
ADD R6 R6 #-1
CONST R0 x22
HICONST R0 x0
STR R0 R6 #-1
ADD R6 R6 #-1
JSR lc4_draw_rect
CONST R0 x0
HICONST R0 x33
STR R0 R6 #-1
ADD R6 R6 #-1
CONST R0 x14
HICONST R0 x0
STR R0 R6 #-1
ADD R6 R6 #-1
CONST R0 x28
HICONST R0 x0
STR R0 R6 #-1
ADD R6 R6 #-1
CONST R0 x28
HICONST R0 x0
STR R0 R6 #-1
ADD R6 R6 #-1
CONST R0 x2C
HICONST R0 x0
STR R0 R6 #-1
ADD R6 R6 #-1
JSR lc4_draw_rect
CONST R0 xF0
HICONST R0 x7F
STR R0 R6 #-1
ADD R6 R6 #-1
CONST R0 x14
HICONST R0 x0
STR R0 R6 #-1
ADD R6 R6 #-1
CONST R0 x14
HICONST R0 x0
STR R0 R6 #-1
ADD R6 R6 #-1
CONST R0 x14
HICONST R0 x0
STR R0 R6 #-1
ADD R6 R6 #-1
CONST R0 x36
HICONST R0 x0
STR R0 R6 #-1
ADD R6 R6 #-1
JSR lc4_draw_rect
CONST R0 x0
HICONST R0 x80
CMP R0 R5
BRz EMAIN
LDR R0 R6 #0
STR R0 R5 #2
LDR R7 R5 #1
ADD R6 R5 #2
LDR R5 R5 #0
JMPR R7
EMAIN TRAP x25
