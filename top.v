module top(input pclk, prstn, input [7:0] addr, input transfer, input write, input [7:0] wdata, 
output [7:0] rdata, output preadyout, output enable, output sel, output writecheck);

wire pwrite,psel,penable;
wire [7:0] paddr, pwdata;
wire pready;

apb_master dut1(.addr(addr), .wdata(wdata), .write(write),  .pclk(pclk), .prstn(prstn), .pready(pready),
                .transfer(transfer), .paddr(paddr),
                .pwdata(pwdata), .penable(penable), .pwrite(pwrite), .psel(psel));
                
apb_slave dut2(.pclk(pclk), .prstn(prstn), .psel(psel), .penable(penable), .pwrite(pwrite), .pwdata(pwdata), 
.paddr(paddr),  .prdata(rdata),  .pready(pready));

assign preadyout=pready;
assign enable = penable;
assign sel= psel;
assign writecheck=pwrite;
endmodule