// ===============================================
// Parameterized ALU
// Supports arithmetic and logical operations
// ===============================================

module alu #(
    parameter WIDTH = 8
)(
    input  wire [WIDTH-1:0] a,
    input  wire [WIDTH-1:0] b,
    input  wire [2:0]       op,
    output reg  [WIDTH-1:0] result,
    output wire             zero
);

// ALU operations
always @(*) begin
    case (op)
        3'b000: result = a + b;                 // ADD
        3'b001: result = a - b;                 // SUB
        3'b010: result = a & b;                 // AND
        3'b011: result = a | b;                 // OR
        3'b100: result = a ^ b;                 // XOR
        3'b101: result = a << 1;                // SHIFT LEFT
        3'b110: result = a >> 1;                // SHIFT RIGHT
        3'b111: result = (a < b) ? 1 : 0;       // LESS THAN
        default: result = {WIDTH{1'b0}};
    endcase
end

// Zero flag
assign zero = (result == 0);

endmodule
