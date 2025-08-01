`timescale 1ns / 1ps

module apb_tb;

  reg         pclk;
  reg         prstn;
  reg         transfer;
  reg         write;
  reg  [7:0]  wdata;
  reg  [7:0]  addr;
  wire [7:0]  rdata;
  wire preadyout;
  wire enable;
  wire sel;
  wire writecheck;

  // Instantiate DUT (Design Under Test)
  top dut (
    .pclk(pclk),
    .prstn(prstn),
    .transfer(transfer),
    .preadyout(preadyout),
    .write(write),
    .wdata(wdata),
    .addr(addr),
    .rdata(rdata),
    .enable(enable),
    .sel(sel),
    .writecheck(writecheck)
  );

  // Clock generation
  always begin
    #5 pclk = ~pclk;
  end

  // Stimulus block
  initial begin
    // Initialize
    pclk = 0;
    prstn = 0;
    transfer = 0;
    write = 0;
    wdata = 8'b0;
    addr = 8'b0;

    #15 prstn = 1;

    // WRITE to Slave 
    #10 addr = 8'h5A;
    wdata = 8'hAB;
    transfer = 1;
    write = 1;
    #30;
    transfer = 0;

    // READ from Slave 
    #20;
    addr = 8'h5A;
    transfer = 1;
    write = 0;
    #50 $finish;
  end

endmodule
