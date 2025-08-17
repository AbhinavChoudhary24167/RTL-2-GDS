# Create directory for reports
file mkdir sta_after_synthesis_relaxed/reports
set report_dir sta_after_synthesis_relaxed/reports

# Read library and netlist
read_lib /home/abhinav24167/Desktop/TicketMachine/lib/90/slow.lib
read_verilog /home/abhinav24167/Desktop/TicketMachine/DFT/dft_report_relaxed/dft_syn_min_time_dft_relaxed.v
set_top_module ticket_machine_fsm

# Read constraints
read_sdc /home/abhinav24167/Desktop/TicketMachine/DFT/Relaxed.sdc

# Generate reports
check_timing > $report_dir/check_timing_relaxed.rpt
report_timing > $report_dir/timing_report_relaxed.rpt
report_timing -retime path_slew_propagation -max_paths 50 -nworst 50 -path_type full_clock > $report_dir/pba_relaxed.rpt
report_analysis_coverage > $report_dir/analysis_coverage_relaxed.rpt
report_analysis_summary > $report_dir/analysis_summary_relaxed.rpt
report_annotated_parasitics > $report_dir/annotated_min_area_relaxed.rpt
report_clocks > $report_dir/clocks_relaxed.rpt
report_case_analysis > $report_dir/case_analysis_relaxed.rpt
report_constraints -all_violators > $report_dir/allviolations_relaxed.rpt

