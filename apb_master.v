module apb_master(input [7:0] addr, wdata, input write, input pclk, prstn, input pready, input transfer, output reg [7:0] paddr,
                   output reg [7:0] pwdata,
                   output reg penable, pwrite, psel);
parameter IDLE=2'b00, SETUP=2'b01, ACCESS=2'b10;
reg [1:0] state, next_state;

always@(posedge pclk) begin
if(!prstn) begin
state<=IDLE;
pwdata<=0;
pwrite<=0;
psel<=0;
penable<=0;
paddr<=0;
end 
else state<=next_state;
end

always@(state, transfer) begin
next_state=IDLE;
case(state)
IDLE: begin
pwdata=0;
psel=0;
penable=0;
if(transfer) next_state=SETUP;
else next_state=IDLE;
end
SETUP: begin
psel=1;
penable=0;
pwrite=write;
if(write) pwdata=wdata;
next_state=ACCESS;
end
ACCESS: begin
penable=1;
if(transfer && pready) next_state=SETUP;
else if (!transfer && pready) next_state=IDLE;
else next_state=IDLE;
end
endcase
end
endmodule