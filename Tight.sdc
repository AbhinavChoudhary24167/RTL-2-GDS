create_clock -name clk -period 4.22 [get_ports clk]
set_clock_transition -rise 0.1 [get_clocks clk]
set_clock_transition -fall 0.1 [get_clocks clk]
set_clock_uncertainty 0.1 [get_clocks clk]
set_input_delay -clock [get_clocks clk] 1.5 [all_inputs]
set_output_delay -clock [get_clocks clk] 0.05 [all_outputs]
set_load 1 [all_outputs]

#create_clock -name clk -period 10 [get_ports clk]
#set_clock_transition -rise 2 [get_clocks clk]
#set_clock_transition -fall 2 [get_clocks clk]
#set_clock_uncertainty -setup 0.4 [get_clocks clk]
#set_input_transition 0.2 [get_ports all_inputs]
#set_load 1 [get_ports all_outputs]



