set_attr lib_search_path /home/abhinav24167/Desktop/TicketMachine/lib/90
set_attr hdl_search_path /home/abhinav24167/Desktop/TicketMachine/Synthesis/syn_report_relaxed
set_attr library slow.lib
read_hdl synthesised_netlist.v
elaborate ticket_machine_fsm
read_sdc /home/abhinav24167/Desktop/TicketMachine/DFT/Relaxed.sdc
report timing -lint
set_attribute dft_scan_style muxed_scan
define_dft shift_enable -active high -create_port scan_en
define_dft test_clock clk
report dft_setup
check_dft_rules >dft_report_relaxed/dft_rules_report
fix_dft_violations -test_control scan_en -async_set -async_reset -clock
synthesize -to_mapped
set_attribute dft_min_number_of_scan_chains 1 [find / -design *]
set_attribute dft_mix_clock_edges_in_scan_chains true [find / -design *]
connect_scan_chains -auto_create_chains -preview
connect_scan_chains -auto_create_chains
report qor
write_atpg -cadence > rtl_module_min_time_dft_relaxed.atpg
write_atpg -stil > rtl_module_still_min_time_dft_relaxed.atpg
write_scandef> dft_report_relaxed/rtl_module_min_time_dft_relaxed.def
write_sdf -timescale ns -nonegchecks -recrem split -edges check_edge > dft_report_relaxed/delays_optimal_min_time_dft_relaxed.sdf
write_hdl -mapped > dft_report_relaxed/dft_syn_min_time_dft_relaxed.v
write_sdc > dft_report_relaxed/dft_constraints_for_physical_design_min_time_dft_relaxed.sdc
write_script > dft_report_relaxed/dft_script_min_time_dft_sdc_relaxed.g
report gates > dft_report_relaxed/gates_min_time_dft_relaxed.rep
report dft_registers >dft_report_relaxed/registers_min_time_dft_relaxed.rep
report timing > dft_report_relaxed/dft_timing_report_min_time_dft_relaxed.rep
report power > dft_report_relaxed/dft_timing_power_report_min_time_dft_relaxed.rep
#report area > dft_report_relaxed/dft_timing_area_report_min_time_dft_relaxed.rep
report summary > dft_report_relaxed/summary_min_time_dft_relaxed.rep
gui_show

