`default_nettype none
module tt_um_blink(
        input wire [7:0] ui_in,
        output wire [7:0] uo_out,
        input  wire [7:0] uio_in,
        output wire [7:0] uio_out,
        output wire [7:0] uio_oe,
        input wire ena,
        input wire clk,
        input wire rst_n);

   reg [7:0] 	   cnt;
   wire 	   ck;

   assign uo_out = cnt[7:0];
   
   always @(posedge ck) begin
      if (rst_n == 1'b0) cnt <= 0;
      else cnt <= cnt + 1;
   end
   
   wire [20:0] n;
   assign n[20:1] = ~n[19:0];
   assign n[0] = ~n[20];
   assign ck = ~n[0];
		    
endmodule
