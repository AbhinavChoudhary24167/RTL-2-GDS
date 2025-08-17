
# Creating some directories for generating reports.


file mkdir reports/place_and_route
file mkdir reports/place_and_route/timing
file mkdir reports/place_and_route/area
file mkdir reports/place_and_route/GDS
file mkdir reports/place_and_route/netlist
file mkdir reports/place_and_route/incremental_placement_report
file mkdir placementreports/placement
file mkdir placementreports/placement/timing
file mkdir placementreports/placement/area
file mkdir placementreports/placement/GDS
file mkdir placementreports/placement/incremental_placement_report

file mkdir postctsreports/postcts_bo/timing
file mkdir postctsreports/postcts_bo/area
file mkdir postctsreports/postcts_bo/GDS
file mkdir postctsreports/postcts_bo/netlist

file mkdir optimisectsrepairreports/postcts_ao/timing
file mkdir optimisectsrepairreports/postcts_ao/area
file mkdir optimisectsrepairreports/postcts_ao/GDS
file mkdir optimisectsrepairreports/postcts_ao/netlist

file mkdir ctsrepairreports/postcts_ao/timing
file mkdir ctsrepairreports/postcts_ao/area
file mkdir ctsrepairreports/postcts_ao/GDS
file mkdir ctsrepairreports/postcts_ao/netlist

file mkdir postroutereports/route/timing
file mkdir postroutereports/route/area
file mkdir postroutereports/route/GDS
file mkdir postroutereports/route/netlist

file mkdir reportpandrsta
set report_dir reportpandrsta

set init_gnd_net GND
set init_io_file pin.io
set init_lef_file /home/abhinav24167/Desktop/TicketMachine/lib/90/gsclib090_translated_ref.lef
set init_mmmc_file newview.view
set init_pwr_net VDD
set init_top_cell ticket_machine_fsm
set init_verilog /home/abhinav24167/Desktop/TicketMachine/DFT/dft_report_tight/dft_syn_min_time_dft_tight.v
init_design


setDesignMode -process 90 -flowEffort standard
#/* Sanity check before Floorplanning*/
checkDesign -physicalLibrary;#/Sanity check of physical library -lef file/
checkDesign -timingLibrary;#/*Sanity check of timing library */
checkDesign -netlist;#/*Sanity check of dft netlist/
check_timing;#/Sanity check of timing reports of min and max path/


#/Floorplanning/
getIoFlowFlag
setIoFlowFlag 0
#/floorplanning die siting according to Innovus LRM/
#floorPlan -site gsclib090site -r 1 0.5 6 6 6 6
floorPlan -site gsclib090site -r 1 0.8 4.06 4.06 4.06 4.06
floorPlan -site gsclib090site -r 1 0.8 4.06 4.06 4.06 4.06

#/*Adding Rings*/
addRing -center 1 -stacked_via_top_layer Metal9 -type core_rings -jog_distance 0.435 -threshold 0.435 -nets {GND VDD} -follow core -stacked_via_bottom_layer Metal1 -layer {bottom Metal8 top Metal8 right Metal9 left Metal9} -width {top 1.25 bottom 1.25 left 1.25 right 1.25} -spacing {top 0.4 bottom 0.4 left 0.4 right 0.4} -offset {top 0.435 bottom 0.435 left 0.435 right 0.435}

#/*Adding Stripes*/
addStripe -block_ring_top_layer_limit Metal9 -max_same_layer_jog_length 0.88 -padcore_ring_bottom_layer_limit Metal7 -number_of_sets 10 -padcore_ring_top_layer_limit Metal9 -spacing 0.4 -merge_stripes_value 0.435 -layer Metal8 -block_ring_bottom_layer_limit Metal7 -width 0.44 -nets {VDD GND}


set delaycal_use_default_delay_limit 1000 
setDelayCalMode -reportOutBound true

#/Global Routing/
globalNetConnect VDD -type pgpin -pin VDD -override -verbose -netlistOverride
globalNetConnect VSS -type pgpin -pin VSS -override -verbose -netlistOverride
sroute -nets {VDD VSS} -allowLayerChange 1 -layerChangeRange {Metal1 Metal9}

#/Sanity check of Scan chain dft/
specifyScanChain scan1 -start DFT_sdi_1 -stop DFT_sdo_1

report_timing -max_path 100 -late > report_dir/before_placement_80/timing_setup_report_GBA.rpt
report_timing -max_path 100 -early > report_dir/before_placement_80/timing_hold_report_GBA.rpt
report_timing -retime path_slew_propagation -max_path 100 -late -format retime_slew > report_dir/before_placement_80/timing_setup_report_PBA.rpt
report_timing -retime path_slew_propagation -max_path 100 -early -format retime_slew > report_dir/before_placement_80/timing_hold_report_PBA.rpt
report_power -rail_analysis_format VS -outfile 80_before_placement_reports/power.rpt
report_area -detail > 80_before_placement_reports/area.rpt
report_power -rail_analysis_format VS -outfile .//placementbeforeanalysis.rpt
#win

#/Placement/
setPlaceMode -place_global_place_io_pins true
setPlaceMode -fp false
placeDesign

report_timing -max_path 100 -late > report_dir/after_placement_80/timing_setup_report_GBA.rpt
report_timing -max_path 100 -early > report_dir/after_placement_80/timing_hold_report_GBA.rpt
report_timing -retime path_slew_propagation -max_path 100 -late -format retime_slew > report_dir/after_placement_80/timing_setup_report_PBA.rpt
report_timing -retime path_slew_propagation -max_path 100 -early -format retime_slew > report_dir/after_placement_80/timing_hold_report_PBA.rpt
report_power -rail_analysis_format VS -outfile 80_after_placement_reports/power.rpt
report_area -detail > 80_after_placement_reports/area.rpt
#win

streamOut placementreports/placement/GDS/GDSoutput
saveNetlist placementreports/placement/netlist/main_post_pnr1.v


report_power -rail_analysis_format VS -outfile .//placementafteranalysis.rpt

#CTS
set_ccopt_mode -cts_buffer_cells {CLKBUFX3 CLKBUFX2  CLKBUFX8 CLKBUFX12 CLKBUFX16 CLKBUFX20} -cts_opt_priority all
create_ccopt_clock_tree_spec -file ccopt_new.spec -keep_all_sdc_clocks -views {view1}

source ccopt_new.spec 

# ccopt_design is a super command. Capable of doing complete CTS
ccopt_design -check_prerequisites
ccopt_design

verify_drc > report_dir/before_optimisation_80/placement_DRC_vio.rpt
verifyConnectivity > report_dir/before_optimisation_80/post_detailedRoute_verifyConnectivity.rpt
reportRoute > report_dir/before_optimisation_80/postDetailRoute_reportRoute.rpt
reportWire report_dir/before_optimisation_80/postDetailRoute_reportWire.rpt
report_timing -max_path 100 -late > report_dir/before_optimisation_80/timing_setup_report_GBA.rpt
report_timing -max_path 100 -early > report_dir/before_optimisation_80/timing_hold_report_GBA.rpt
report_timing -retime path_slew_propagation -max_path 100 -late -format retime_slew > report_dir/before_optimisation_80/timing_setup_report_PBA.rpt
report_timing -retime path_slew_propagation -max_path 100 -early -format retime_slew > report_dir/before_optimisation_80/timing_hold_report_PBA.rpt
report_power -rail_analysis_format VS -outfile 80_before_optimisation_reports/power.rpt
report_area -detail > 80_before_optimisation_reports/area.rpt
#win

optDesign -postCTS ;   #for setup violation
optDesign -postCTS -hold;
ccopt_pro -enable_drv_fixing true -enable_drv_fixing_by_rebuffering true -enable_refine_place true -enable_routing_eco true -enable_skew_fixing true -enable_skew_fixing_by_rebuffering true -enable_timing_update true

verify_drc > report_dir/after_optimisation_80/placement_DRC_vio.rpt
verifyConnectivity > report_dir/after_optimisation_80/post_detailedRoute_verifyConnectivity.rpt
reportRoute > report_dir/after_optimisation_80/postDetailRoute_reportRoute.rpt
reportWire report_dir/after_optimisation_80/postDetailRoute_reportWire.rpt
report_timing -max_path 100 -late > report_dir/after_optimisation_80/timing_setup_report_GBA.rpt
report_timing -max_path 100 -early > report_dir/after_optimisation_80/timing_hold_report_GBA.rpt
report_timing -retime path_slew_propagation -max_path 100 -late -format retime_slew > report_dir/after_optimisation_80/timing_setup_report_PBA.rpt
report_timing -retime path_slew_propagation -max_path 100 -early -format retime_slew > report_dir/after_optimisation_80/timing_hold_report_PBA.rpt
report_power -rail_analysis_format VS -outfile 80_after_optimisation_reports/power.rpt
report_area -detail > 80_after_optimisation_reports/area.rpt
#win

setDesignMode -bottomRoutingLayer Metal1 -topRoutingLayer Metal7
setNanoRouteMode -quiet -timingEngine {}
setNanoRouteMode -quiet -routeWithSiPostRouteFix 0
setNanoRouteMode -quiet -drouteStartIteration default
setNanoRouteMode -quiet -routeTopRoutingLayer default
setNanoRouteMode -quiet -routeBottomRoutingLayer default
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven false
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign -globalDetail
routeDesign

verify_drc > report_dir/after_routing_80/routing_DRC_vio.rpt
verifyConnectivity > report_dir/after_routing_80/post_detailedRoute_verifyConnectivity.rpt
reportRoute > report_dir/after_routing_80/postDetailRoute_reportRoute.rpt
reportWire report_dir/after_routing_80/postDetailRoute_reportWire.rpt
report_timing -max_path 100 -late > report_dir/after_routing_80/timing_setup_report_GBA.rpt
report_timing -max_path 100 -early > report_dir/after_routing_80/timing_hold_report_GBA.rpt
report_timing -retime path_slew_propagation -max_path 100 -late -format retime_slew > report_dir/after_routing_80/timing_setup_report_PBA.rpt
report_timing -retime path_slew_propagation -max_path 100 -early -format retime_slew > report_dir/after_routing_80/timing_hold_report_PBA.rpt

report_area -detail > 80_after_routing_reports/area.rpt

streamOut postroutereports/route/GDS/GDSoutput
saveNetlist postroutereports/route/netlist/main_post_pnr4.v

#/Generating GDS/
streamOut rtl_module.gds -mapFile streamOut.map -libName DesignLib -units 2000 -mode ALL

#/Saving the Design and generating .def file required for power analysis using voltus tool/
saveNetlist rtl_module_post_route_netlist.v
defOut -floorplan -netlist -routing rtl_module.def
saveDesign new_uptoGDS.enc
report_power -rail_analysis_format VS -outfile 80_after_routing_reports/power.rpt
win
