// Implements 4 bit riplle carry adder with four instances of a full adder
// Adds two 4 bit binary numbers A and B along with Cin input and produces 4 bit sum and final cout
module four_bit_adder(
    input [3:0] A, //4 bit input operand A
    input [3:0] B, //4 bit input operand B
    input Cin, // Initial carry in input
    output [3:0] Sum, // 4 bit sum output
    output Cout // final carry out output
);
    wire c1, c2, c3; // Internal wires connecting carry out from each full adder to next stage carry in
    
    full_adder fa0(
        .A(A[0]), // LSB of operand A
        .B(B[0]), // LSB of operand B
        .Cin(Cin), // initial carry in
        .Sum(Sum[0]), // Sum output for bit 0
        .Cout(c1) // Carry out to next stage
    );

    // Instantiate full adder for bit 1
    full_adder fa1(
        .A(A[1]), // Bit 1 of operand A
        .B(B[1]), // Bit 1 of operand B
        .Cin(c1), // Carry in from previous stage
        .Sum(Sum[1]), // Sum output for bit 1
        .Cout(c2) // Carry out to next stage
    );

    // Instantiate full adder for bit 2
    full_adder fa2(
        .A(A[2]), // Bit 2 of operand A
        .B(B[2]), // Bit 2 of operand B
        .Cin(c2), // Carry in from previous stage
        .Sum(Sum[2]), // Sum output for bit 2
        .Cout(c3) // Carryout to next stage
    );

    // Instantiate full adder for bit 3 which is the most significant bit
    full_adder fa3(
        .A(A[3]), // MSB of operand A
        .B(B[3]), // MSB of operand B
        .Cin(c3), // Carry in from previous stage
        .Sum(Sum[3]), // Sum output for bit 3
        .Cout(Cout) // Final carry out output
    );
endmodule
