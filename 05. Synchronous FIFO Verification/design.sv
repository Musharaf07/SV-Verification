//Synchronous FIFO
module fifo
  #(parameter FIFO_DEPTH = 8, parameter DATA_WIDTH = 16)
  (input clk, rst, wr_en, rd_en, 
   input [DATA_WIDTH-1:0] din, 
   output reg [DATA_WIDTH-1:0] dout, 
   output empty, full); 

  localparam FIFO_DEPTH_LOG = $clog2(FIFO_DEPTH); 

  reg [DATA_WIDTH-1:0] fifo [0:FIFO_DEPTH-1];
  reg [FIFO_DEPTH_LOG:0] wr_ptr;
  reg [FIFO_DEPTH_LOG:0] rd_ptr;

  always @(posedge clk or negedge rst) begin
    if (!rst)
      wr_ptr <= 0;
    else if (wr_en && !full) begin
      fifo[wr_ptr[FIFO_DEPTH_LOG-1:0]] <= din;
      wr_ptr <= wr_ptr + 1'b1;
    end
  end

  always @(posedge clk or negedge rst) begin
    if (!rst)
      rd_ptr <= 0;
    else if (rd_en && !empty) begin
      dout <= fifo[rd_ptr[FIFO_DEPTH_LOG-1:0]];
      rd_ptr <= rd_ptr + 1'b1;
    end
  end

  assign empty = (rd_ptr == wr_ptr);
  assign full  = (rd_ptr == {~wr_ptr[FIFO_DEPTH_LOG], wr_ptr[FIFO_DEPTH_LOG-1:0]});
endmodule
