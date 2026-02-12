`timescale 1ns/1ps

module alu_tb;

parameter WIDTH = 8;

reg  [WIDTH-1:0] a;
reg  [WIDTH-1:0] b;
reg  [2:0]       op;

wire [WIDTH-1:0] result;
wire zero;

alu #(WIDTH) uut (
    .a(a),
    .b(b),
    .op(op),
    .result(result),
    .zero(zero)
);

initial begin

    $dumpfile("alu.vcd");
    $dumpvars(0, alu_tb);

    $display("ALU Simulation Start");

    a = 10; b = 5;

    op = 3'b000; #10;
    op = 3'b001; #10;
    op = 3'b010; #10;
    op = 3'b011; #10;
    op = 3'b100; #10;
    op = 3'b101; #10;
    op = 3'b110; #10;
    op = 3'b111; #10;

    $display("ALU Simulation End");

    #10;
    $finish;
end

endmodule
