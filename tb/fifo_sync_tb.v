`timescale 1ns/1ps

module fifo_sync_tb;

parameter DATA_WIDTH = 8;
parameter ADDR_WIDTH = 4;

reg clk;
reg rst_n;
reg wr_en;
reg rd_en;
reg [DATA_WIDTH-1:0] din;

wire [DATA_WIDTH-1:0] dout;
wire full;
wire empty;

fifo_sync #(
    .DATA_WIDTH(DATA_WIDTH),
    .ADDR_WIDTH(ADDR_WIDTH)
) dut (
    .clk(clk),
    .rst_n(rst_n),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .din(din),
    .dout(dout),
    .full(full),
    .empty(empty)
);


// clock
always #5 clk = ~clk;


initial begin
    $dumpfile("fifo_sync.vcd");
    $dumpvars(0, fifo_sync_tb);

    clk = 0;
    rst_n = 0;
    wr_en = 0;
    rd_en = 0;
    din   = 0;

    #20 rst_n = 1;

    // write some data
    repeat (8) begin
        @(posedge clk);
        wr_en = 1;
        din   = din + 1;
    end

    @(posedge clk);
    wr_en = 0;

    // read data back
    repeat (8) begin
        @(posedge clk);
        rd_en = 1;
    end

    @(posedge clk);
    rd_en = 0;

    #20 $finish;
end

endmodule
