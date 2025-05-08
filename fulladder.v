// Implements a single bit full adder and adds three 1 bit inputs in A, B, and Cin
// And it produces a 1 bit Sum and 1 bit Cout
module full_adder(
    input A, // First input bit
    input B, // Second input bit
    input Cin, // Carry in from previous stage
    output Sum, // Sum of A, B, and Cin
    output Cout // Carry out to next stage
);
    assign Sum = A ^ B ^ Cin; // Sum's computed using XOR logic where Sum = A ^ B ^ Cin

    // Carry out thats computed using majoritiy logic where the Cout is 1 if any two or more inputs are 1
    assign Cout = (A & B) | (A & Cin) | (B & Cin);
endmodule
