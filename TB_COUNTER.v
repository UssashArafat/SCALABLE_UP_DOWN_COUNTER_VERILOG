`timescale 1ns/1ps

module TB_COUNTER();
reg CLOCK, RESET, ENABLE, CONTROL;
wire [3:0] COUNT;

COUNTER UUT(CLOCK, RESET, ENABLE, CONTROL, COUNT);

initial
$monitorb("%d clock=%b reset=%b enable=%b control=%b count=%b", $time, CLOCK, RESET, ENABLE, CONTROL, COUNT);

initial
begin
CLOCK = 1'b0;
forever #100 CLOCK= ~CLOCK;
end

initial begin
$vcdpluson;
$sdf_annotate("TIME.sdf",UUT);

RESET =1; ENABLE=0; CONTROL= 1;
#20 RESET = 0;
#50 RESET =1;
#500 ENABLE =1;
#500 CONTROL =0;
#500 CONTROL =1;
#150 ENABLE =0;
#100 RESET =0;
#100 $finish;

end
endmodule
