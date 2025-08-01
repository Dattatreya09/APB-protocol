module apb_slave(input pclk, prstn, psel, penable, pwrite, input [7:0] pwdata, 
paddr, output reg [7:0] prdata, output reg pready);

reg [7:0] mem [127:0];

always@(posedge pclk) begin
if(!prstn) begin
pready<=0;
prdata<=0;
end
else begin
if(psel) begin
if(pwrite && penable) mem[paddr] <= pwdata;
else prdata<=mem[paddr];
pready<=1;
end
end
end
endmodule