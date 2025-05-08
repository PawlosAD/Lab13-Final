// Implements single type D flip flop with asynchronous active high reset.
// Flip flop captures input value of D and outputs it on Q.
// Provides complement of Q as NotQ
module dff(
    input reset, // Asynchronous active high reset input
    input clock, // Posedge triggered clock input
    input D, // Data input
    output reg Q, // Data output
    output NotQ // Complement of Q
);
    // Continous assignment to generate complement of Q
    assign NotQ = ~Q;

    // Always  block thats triggered on rising edge of either reset or clock
    always @(posedge reset, posedge clock) begin
        if (reset) begin
            // Asynchronously set Q to 0 when reset is high
            Q <= 0;
        end else if (clock) begin
            // Captures D into Q on rising clock edge if reset isn't asserted
            Q <= D;
        end
    end
endmodule
