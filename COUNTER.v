/**********************************************************************************************************
 * ECE 527L
 * Ussash Arafat
 *
 * LAB 1b: Verilog coding and simulation review
 * File: COUNTER.v
 * ********************************************************************************************************
 * Scalable saturating up/down counter with clock, reset, enable and direction control signal
 * ********************************************************************************************************/

`timescale 1ns/1ps //Declaring  reference time and time precision

module COUNTER(CLOCK, RESET, ENABLE, CONTROL, COUNT);
parameter SIZE = 4; //Parameterization which makes the module scalable

//Declaring I/O
input wire CLOCK, RESET, ENABLE, CONTROL;
output reg [SIZE-1:0]COUNT;

always @(posedge CLOCK, negedge RESET) //Output is sensitive to rising edge of CLOCK signal
                                       //and negative edge of RESET signal
begin
if(!RESET) COUNT <= 0; //If RESET is active counter initializes to 0
else
   begin
   if(ENABLE) //If ENABLE is active the count begins
       begin
       if(CONTROL) //If the CONTROL is high, count goes up
              begin
               if(&COUNT) COUNT <= COUNT; //Counter stop counts and hold the value if all the bits are high
               else COUNT <= COUNT+1; // Up counting
             end
       else
         begin
           if(~|COUNT) COUNT<= COUNT; //Counter stop counts and hold the value if all the bits are low
           else COUNT <= COUNT-1; //Down counting
         end
       end
   else COUNT <=COUNT; //If ENABLE is not active, counter holds its value
   end
end
endmodule
