// Simple parameterized synchronous FIFO
// Stores data in first-in first-out order

module fifo_sync #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 4        // depth = 16
)(
    input  wire clk,
    input  wire rst_n,

    input  wire wr_en,
    input  wire rd_en,
    input  wire [DATA_WIDTH-1:0] din,

    output reg  [DATA_WIDTH-1:0] dout,
    output wire full,
    output wire empty
);

localparam DEPTH = 1 << ADDR_WIDTH;

// memory array
reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];

// read and write pointers
reg [ADDR_WIDTH:0] wr_ptr;
reg [ADDR_WIDTH:0] rd_ptr;


// ---------------- WRITE ----------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n)
        wr_ptr <= 0;
    else if (wr_en && !full) begin
        mem[wr_ptr[ADDR_WIDTH-1:0]] <= din;
        wr_ptr <= wr_ptr + 1'b1;
    end
end


// ---------------- READ ----------------
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        rd_ptr <= 0;
        dout   <= 0;
    end
    else if (rd_en && !empty) begin
        dout   <= mem[rd_ptr[ADDR_WIDTH-1:0]];
        rd_ptr <= rd_ptr + 1'b1;
    end
end


// ---------------- STATUS ----------------
assign empty = (wr_ptr == rd_ptr);

assign full  = (wr_ptr[ADDR_WIDTH]     != rd_ptr[ADDR_WIDTH]) &&
               (wr_ptr[ADDR_WIDTH-1:0] == rd_ptr[ADDR_WIDTH-1:0]);

endmodule
