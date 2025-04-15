module seven_seg_decoder(
    input [3:0] A,
    input [3:0] B,
    input [3:0] AplusB,
    input [3:0] AminusB,
    input [3:0] anode,
    output reg [6:0] segs
);

    // Decoder, provided free of charge!
    always @(*) begin
        case(selected_sig)
            //            GFEDCBA
            0: segs  = 7'b1000000;        
            1: segs  = 7'b1111001;        
            2: segs  = 7'b0100100;        
            3: segs  = 7'b0110000;        
            4: segs  = 7'b0011001;        
            5: segs  = 7'b0010010;        
            6: segs  = 7'b0000010;        
            7: segs  = 7'b1111000;        
            8: segs  = 7'b0000000;
            9: segs  = 7'b0010000;        
            10: segs = 7'b0001000;        
            11: segs = 7'b0000011;        
            12: segs = 7'b1000110;        
            13: segs = 7'b0100001;        
            14: segs = 7'b0000110;        
            15: segs = 7'b0001110;       
        endcase
    end

endmodule