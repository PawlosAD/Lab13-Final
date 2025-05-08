// Performs 4 bit binary subtraction (A-B) by using two's compliment
// Inverts the bits of B and adds 1 via Cin and uses ripply carry adder structure with four full adders to compute difference

module four_bit_subtractor(
    input [3:0] A, // 4 bit minuend input value to subtract from
    input [3:0] B, // 4 bit subtrahend input value to subtract from
    output [3:0] Diff // 4 bit difference output in A-B
);
    wire [3:0] not_B; // Inverted B one's compliment
    wire c1, c2, c3, unused; // Carry wires where final carry is unused

    // Invert each bit of B(performs one's compliment)
    assign not_B = ~B;

    // Full adder for bit 0 which is the least significant bit
    // Adding A[0] + not_B[0] + 1 to complement twos compliment operation
    full_adder fa0(
        .A(A[0]),
        .B(not_B[0]),
        .Cin(1'b1), //Initial carry in's 1 for twos compliment
        .Sum(Diff[0]),
        .Cout(c1)
    );

    // Full adder for bit 1
    full_adder fa1(
        .A(A[1]),
        .B(not_B[1]),
        .Cin(c1), // carry in from previous stage
        .Sum(Diff[1]),
        .Cout(c2)
    );

    // Full adder for bit 2
    full_adder fa2(
        .A(A[2]),
        .B(not_B[2]),
        .Cin(c2), // carry in from previous stage
        .Sum(Diff[2]),
        .Cout(c3)
    );

    // Full adder for bit 3 which is the most significant bit
    full_adder fa3(
        .A(A[3]),
        .B(not_B[3]),
        .Cin(c3), // carry in from previous stage
        .Sum(Diff[3]),
        .Cout(unused) // Final carry out that's unused because of subtraction
    );
endmodule
