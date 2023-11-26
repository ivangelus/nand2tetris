// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// Assumes that R0 >= 0, R1 >= 0, and R0 * R1 < 32768.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

    // initalize i to R0
    @R0
    D=M
    @i
    M=D

    // initialize R2 to 0
    @R2
    M=0

    // if R0 == 0; jump to cleanup
    @R0
    D=M
    @CLEANUP
    D;JEQ

    // if R1 == 0; jump to cleanup
    @R1
    D=M
    @CLEANUP
    D;JEQ


(LOOP)
    // R2 = R2 + R1
    @R1
    D=M
    @R2
    M=M + D
    // decrement i
    @i
    M=M - 1
    D=M
    // if i > 0; loop
    @LOOP
    D;JGT
    // if i == 0; terminate program
    @CLEANUP
    D;JLE

(CLEANUP)
    // set R0 to 0
    @R0
    M=0
    // set R1 to 0
    @R1
    M=0
    // set i to 0
    @i
    M=0
    // jump to end
    @END
    0;JMP

    // infinite loop
(END)
    @END
    0;JMP