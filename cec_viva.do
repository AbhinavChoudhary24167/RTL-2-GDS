set log file logical_equivalence_checking.log -replace
read library slow.v -verilog -both
read design ticket.v -verilog -revised
read design synthesised_netlist.v -verilog -golden 
set system mode lec
add compared point -all
compare
report messages -compare -verb
report compare data -noneq
report verification
write compared points -replace lec_compared_points_intermediate
write mapped points -replace lec_mapped_points_intermediate
set verification information Equivalence_checking
write verification information


