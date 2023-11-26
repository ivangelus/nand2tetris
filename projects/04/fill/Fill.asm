// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen
// by writing 'black' in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen by writing
// 'white' in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(LOOP)
@SCREEN
D=A
@addr
M=D

(CONDITION)
@KBD
D=M
@BLACK
D;JGT	// if
@WHITE
D;JEQ	//ELSE JUMP TO WHITEN

@CONDITION
0;JMP

(BLACK)
@fill
M=-1	// black fill
@CHANGE
0;JMP

(WHITE)
@fill
M=0	// white fill
@CHANGE
0;JMP

(CHANGE)
@fill
D=M

@addr
A=M
M=D

@addr
D=M+1	// inc to next pixel
@KBD
D=A-D

@addr
M=M+1	// inc to next pixel
A=M

@CHANGE
D;JGT	// while is greater than 0, screen is not painted

@LOOP
0;JMP