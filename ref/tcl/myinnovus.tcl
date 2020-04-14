setLibraryUnit -time 1ps

setMultiCpuUsage -localCpu 11
source ./Default.globals
init_design

floorPlan -site coreSite -r 1 0.1 5 5 5 5

add_tracks -honor_pitch 

clearGlobalNets

globalNetConnect VDD -type pgpin -pin VDD -inst * -module {}
globalNetConnect VSS -type pgpin -pin VSS -inst * -module {}

#addWellTap -cell TAPCELL_ASAP7_75t_R -cellInterval 7.6 -inRowOffset 2 -prefix WELLTAP
addWellTap -cell TAPCELL_ASAP7_75t_R -cellInterval 7.6 -inRowOffset 2 -prefix WELLTAP

setViaGenMode -viarule_preference { M6_M5widePWR1p152 M5_M4widePWR0p864 M4_M3widePWR0p864 M3_M2widePWR0p936}

#####Power Planning 
#Note: You can add power rings: Commands to put power rings are given below in comments.

##Power rings
addRing -nets {VDD VSS } -around default_power_domain -center 1 -width 1.224 -spacing 0.5 -layer {left M3 right M3 bottom M2 top M2} -extend_corner {lb lt rb rt bl tl br tr}

#Sprecial routing using M1
sroute -connect { blockPin padPin padRing corePin floatingStripe } -nets {VDD VSS } -layerChangeRange { M1 M3 } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { M1 Pad } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { M1 Pad }

timeDesign -prePlace

createBasicPathGroups

setMaxRouteLayer 6
set_interactive_constraint_modes common
# SET TIMING FOR CLK
create_clock -name clk  -period 550 -waveform {0 225} [get_ports clk]
report_clocks
setOptMode -usefulSkew false \
    -allEndPoints true \
    -fixHoldAllowSetupTnsDegrade false 



getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixedPin 1 -fixOverlap 1 -spreadDirection clockwise -edge 0 -layer 6 -spreadType side -pin {clk {image_4x4_b[0]} {image_4x4_b[1]} {image_4x4_b[2]} {image_4x4_b[3]} {image_4x4_b[4]} {image_4x4_b[5]} {image_4x4_b[6]} {image_4x4_b[7]} {image_4x4_b[8]} {image_4x4_b[9]} {image_4x4_b[10]} {image_4x4_b[11]} {image_4x4_b[12]} {image_4x4_b[13]} {image_4x4_b[14]} {image_4x4_b[15]} {image_4x4_b[16]} {image_4x4_b[17]} {image_4x4_b[18]} {image_4x4_b[19]} {image_4x4_b[20]} {image_4x4_b[21]} {image_4x4_b[22]} {image_4x4_b[23]} {image_4x4_b[24]} {image_4x4_b[25]} {image_4x4_b[26]} {image_4x4_b[27]} {image_4x4_b[28]} {image_4x4_b[29]} {image_4x4_b[30]} {image_4x4_b[31]} {image_4x4_b[32]} {image_4x4_b[33]} {image_4x4_b[34]} {image_4x4_b[35]} {image_4x4_b[36]} {image_4x4_b[37]} {image_4x4_b[38]} {image_4x4_b[39]} {image_4x4_b[40]} {image_4x4_b[41]} {image_4x4_b[42]} {image_4x4_b[43]} {image_4x4_b[44]} {image_4x4_b[45]} {image_4x4_b[46]} {image_4x4_b[47]} {image_4x4_b[48]} {image_4x4_b[49]} {image_4x4_b[50]} {image_4x4_b[51]} {image_4x4_b[52]} {image_4x4_b[53]} {image_4x4_b[54]} {image_4x4_b[55]} {image_4x4_b[56]} {image_4x4_b[57]} {image_4x4_b[58]} {image_4x4_b[59]} {image_4x4_b[60]} {image_4x4_b[61]} {image_4x4_b[62]} {image_4x4_b[63]} {image_4x4_b[64]} {image_4x4_b[65]} {image_4x4_b[66]} {image_4x4_b[67]} {image_4x4_b[68]} {image_4x4_b[69]} {image_4x4_b[70]} {image_4x4_b[71]} {image_4x4_b[72]} {image_4x4_b[73]} {image_4x4_b[74]} {image_4x4_b[75]} {image_4x4_b[76]} {image_4x4_b[77]} {image_4x4_b[78]} {image_4x4_b[79]} {image_4x4_b[80]} {image_4x4_b[81]} {image_4x4_b[82]} {image_4x4_b[83]} {image_4x4_b[84]} {image_4x4_b[85]} {image_4x4_b[86]} {image_4x4_b[87]} {image_4x4_b[88]} {image_4x4_b[89]} {image_4x4_b[90]} {image_4x4_b[91]} {image_4x4_b[92]} {image_4x4_b[93]} {image_4x4_b[94]} {image_4x4_b[95]} {image_4x4_b[96]} {image_4x4_b[97]} {image_4x4_b[98]} {image_4x4_b[99]} {image_4x4_b[100]} {image_4x4_b[101]} {image_4x4_b[102]} {image_4x4_b[103]} {image_4x4_b[104]} {image_4x4_b[105]} {image_4x4_b[106]} {image_4x4_b[107]} {image_4x4_b[108]} {image_4x4_b[109]} {image_4x4_b[110]} {image_4x4_b[111]} {image_4x4_b[112]} {image_4x4_b[113]} {image_4x4_b[114]} {image_4x4_b[115]} {image_4x4_b[116]} {image_4x4_b[117]} {image_4x4_b[118]} {image_4x4_b[119]} {image_4x4_b[120]} {image_4x4_b[121]} {image_4x4_b[122]} {image_4x4_b[123]} {image_4x4_b[124]} {image_4x4_b[125]} {image_4x4_b[126]} {image_4x4_b[127]} {kernel_b[0]} {kernel_b[1]} {kernel_b[2]} {kernel_b[3]} {kernel_b[4]} {kernel_b[5]} {kernel_b[6]} {kernel_b[7]} {kernel_b[8]} {kernel_b[9]} {kernel_b[10]} {kernel_b[11]} {kernel_b[12]} {kernel_b[13]} {kernel_b[14]} {kernel_b[15]} {kernel_b[16]} {kernel_b[17]} {kernel_b[18]} {kernel_b[19]} {kernel_b[20]} {kernel_b[21]} {kernel_b[22]} {kernel_b[23]} {kernel_b[24]} {kernel_b[25]} {kernel_b[26]} {kernel_b[27]} {kernel_b[28]} {kernel_b[29]} {kernel_b[30]} {kernel_b[31]} {kernel_b[32]} {kernel_b[33]} {kernel_b[34]} {kernel_b[35]} {kernel_b[36]} {kernel_b[37]} {kernel_b[38]} {kernel_b[39]} {kernel_b[40]} {kernel_b[41]} {kernel_b[42]} {kernel_b[43]} {kernel_b[44]} {kernel_b[45]} {kernel_b[46]} {kernel_b[47]} {kernel_b[48]} {kernel_b[49]} {kernel_b[50]} {kernel_b[51]} {kernel_b[52]} {kernel_b[53]} {kernel_b[54]} {kernel_b[55]} {kernel_b[56]} {kernel_b[57]} {kernel_b[58]} {kernel_b[59]} {kernel_b[60]} {kernel_b[61]} {kernel_b[62]} {kernel_b[63]} {kernel_b[64]} {kernel_b[65]} {kernel_b[66]} {kernel_b[67]} {kernel_b[68]} {kernel_b[69]} {kernel_b[70]} {kernel_b[71]} rst}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixedPin 1 -fixOverlap 1 -spreadDirection clockwise -edge 1 -layer 5 -spreadType side -pin {{image_4x4_g[0]} {image_4x4_g[1]} {image_4x4_g[2]} {image_4x4_g[3]} {image_4x4_g[4]} {image_4x4_g[5]} {image_4x4_g[6]} {image_4x4_g[7]} {image_4x4_g[8]} {image_4x4_g[9]} {image_4x4_g[10]} {image_4x4_g[11]} {image_4x4_g[12]} {image_4x4_g[13]} {image_4x4_g[14]} {image_4x4_g[15]} {image_4x4_g[16]} {image_4x4_g[17]} {image_4x4_g[18]} {image_4x4_g[19]} {image_4x4_g[20]} {image_4x4_g[21]} {image_4x4_g[22]} {image_4x4_g[23]} {image_4x4_g[24]} {image_4x4_g[25]} {image_4x4_g[26]} {image_4x4_g[27]} {image_4x4_g[28]} {image_4x4_g[29]} {image_4x4_g[30]} {image_4x4_g[31]} {image_4x4_g[32]} {image_4x4_g[33]} {image_4x4_g[34]} {image_4x4_g[35]} {image_4x4_g[36]} {image_4x4_g[37]} {image_4x4_g[38]} {image_4x4_g[39]} {image_4x4_g[40]} {image_4x4_g[41]} {image_4x4_g[42]} {image_4x4_g[43]} {image_4x4_g[44]} {image_4x4_g[45]} {image_4x4_g[46]} {image_4x4_g[47]} {image_4x4_g[48]} {image_4x4_g[49]} {image_4x4_g[50]} {image_4x4_g[51]} {image_4x4_g[52]} {image_4x4_g[53]} {image_4x4_g[54]} {image_4x4_g[55]} {image_4x4_g[56]} {image_4x4_g[57]} {image_4x4_g[58]} {image_4x4_g[59]} {image_4x4_g[60]} {image_4x4_g[61]} {image_4x4_g[62]} {image_4x4_g[63]} {image_4x4_g[64]} {image_4x4_g[65]} {image_4x4_g[66]} {image_4x4_g[67]} {image_4x4_g[68]} {image_4x4_g[69]} {image_4x4_g[70]} {image_4x4_g[71]} {image_4x4_g[72]} {image_4x4_g[73]} {image_4x4_g[74]} {image_4x4_g[75]} {image_4x4_g[76]} {image_4x4_g[77]} {image_4x4_g[78]} {image_4x4_g[79]} {image_4x4_g[80]} {image_4x4_g[81]} {image_4x4_g[82]} {image_4x4_g[83]} {image_4x4_g[84]} {image_4x4_g[85]} {image_4x4_g[86]} {image_4x4_g[87]} {image_4x4_g[88]} {image_4x4_g[89]} {image_4x4_g[90]} {image_4x4_g[91]} {image_4x4_g[92]} {image_4x4_g[93]} {image_4x4_g[94]} {image_4x4_g[95]} {image_4x4_g[96]} {image_4x4_g[97]} {image_4x4_g[98]} {image_4x4_g[99]} {image_4x4_g[100]} {image_4x4_g[101]} {image_4x4_g[102]} {image_4x4_g[103]} {image_4x4_g[104]} {image_4x4_g[105]} {image_4x4_g[106]} {image_4x4_g[107]} {image_4x4_g[108]} {image_4x4_g[109]} {image_4x4_g[110]} {image_4x4_g[111]} {image_4x4_g[112]} {image_4x4_g[113]} {image_4x4_g[114]} {image_4x4_g[115]} {image_4x4_g[116]} {image_4x4_g[117]} {image_4x4_g[118]} {image_4x4_g[119]} {image_4x4_g[120]} {image_4x4_g[121]} {image_4x4_g[122]} {image_4x4_g[123]} {image_4x4_g[124]} {image_4x4_g[125]} {image_4x4_g[126]} {image_4x4_g[127]} {kernel_g[0]} {kernel_g[1]} {kernel_g[2]} {kernel_g[3]} {kernel_g[4]} {kernel_g[5]} {kernel_g[6]} {kernel_g[7]} {kernel_g[8]} {kernel_g[9]} {kernel_g[10]} {kernel_g[11]} {kernel_g[12]} {kernel_g[13]} {kernel_g[14]} {kernel_g[15]} {kernel_g[16]} {kernel_g[17]} {kernel_g[18]} {kernel_g[19]} {kernel_g[20]} {kernel_g[21]} {kernel_g[22]} {kernel_g[23]} {kernel_g[24]} {kernel_g[25]} {kernel_g[26]} {kernel_g[27]} {kernel_g[28]} {kernel_g[29]} {kernel_g[30]} {kernel_g[31]} {kernel_g[32]} {kernel_g[33]} {kernel_g[34]} {kernel_g[35]} {kernel_g[36]} {kernel_g[37]} {kernel_g[38]} {kernel_g[39]} {kernel_g[40]} {kernel_g[41]} {kernel_g[42]} {kernel_g[43]} {kernel_g[44]} {kernel_g[45]} {kernel_g[46]} {kernel_g[47]} {kernel_g[48]} {kernel_g[49]} {kernel_g[50]} {kernel_g[51]} {kernel_g[52]} {kernel_g[53]} {kernel_g[54]} {kernel_g[55]} {kernel_g[56]} {kernel_g[57]} {kernel_g[58]} {kernel_g[59]} {kernel_g[60]} {kernel_g[61]} {kernel_g[62]} {kernel_g[63]} {kernel_g[64]} {kernel_g[65]} {kernel_g[66]} {kernel_g[67]} {kernel_g[68]} {kernel_g[69]} {kernel_g[70]} {kernel_g[71]}}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixedPin 1 -fixOverlap 1 -spreadDirection clockwise -edge 3 -layer 3 -spreadType side -pin {{image_4x4_r[0]} {image_4x4_r[1]} {image_4x4_r[2]} {image_4x4_r[3]} {image_4x4_r[4]} {image_4x4_r[5]} {image_4x4_r[6]} {image_4x4_r[7]} {image_4x4_r[8]} {image_4x4_r[9]} {image_4x4_r[10]} {image_4x4_r[11]} {image_4x4_r[12]} {image_4x4_r[13]} {image_4x4_r[14]} {image_4x4_r[15]} {image_4x4_r[16]} {image_4x4_r[17]} {image_4x4_r[18]} {image_4x4_r[19]} {image_4x4_r[20]} {image_4x4_r[21]} {image_4x4_r[22]} {image_4x4_r[23]} {image_4x4_r[24]} {image_4x4_r[25]} {image_4x4_r[26]} {image_4x4_r[27]} {image_4x4_r[28]} {image_4x4_r[29]} {image_4x4_r[30]} {image_4x4_r[31]} {image_4x4_r[32]} {image_4x4_r[33]} {image_4x4_r[34]} {image_4x4_r[35]} {image_4x4_r[36]} {image_4x4_r[37]} {image_4x4_r[38]} {image_4x4_r[39]} {image_4x4_r[40]} {image_4x4_r[41]} {image_4x4_r[42]} {image_4x4_r[43]} {image_4x4_r[44]} {image_4x4_r[45]} {image_4x4_r[46]} {image_4x4_r[47]} {image_4x4_r[48]} {image_4x4_r[49]} {image_4x4_r[50]} {image_4x4_r[51]} {image_4x4_r[52]} {image_4x4_r[53]} {image_4x4_r[54]} {image_4x4_r[55]} {image_4x4_r[56]} {image_4x4_r[57]} {image_4x4_r[58]} {image_4x4_r[59]} {image_4x4_r[60]} {image_4x4_r[61]} {image_4x4_r[62]} {image_4x4_r[63]} {image_4x4_r[64]} {image_4x4_r[65]} {image_4x4_r[66]} {image_4x4_r[67]} {image_4x4_r[68]} {image_4x4_r[69]} {image_4x4_r[70]} {image_4x4_r[71]} {image_4x4_r[72]} {image_4x4_r[73]} {image_4x4_r[74]} {image_4x4_r[75]} {image_4x4_r[76]} {image_4x4_r[77]} {image_4x4_r[78]} {image_4x4_r[79]} {image_4x4_r[80]} {image_4x4_r[81]} {image_4x4_r[82]} {image_4x4_r[83]} {image_4x4_r[84]} {image_4x4_r[85]} {image_4x4_r[86]} {image_4x4_r[87]} {image_4x4_r[88]} {image_4x4_r[89]} {image_4x4_r[90]} {image_4x4_r[91]} {image_4x4_r[92]} {image_4x4_r[93]} {image_4x4_r[94]} {image_4x4_r[95]} {image_4x4_r[96]} {image_4x4_r[97]} {image_4x4_r[98]} {image_4x4_r[99]} {image_4x4_r[100]} {image_4x4_r[101]} {image_4x4_r[102]} {image_4x4_r[103]} {image_4x4_r[104]} {image_4x4_r[105]} {image_4x4_r[106]} {image_4x4_r[107]} {image_4x4_r[108]} {image_4x4_r[109]} {image_4x4_r[110]} {image_4x4_r[111]} {image_4x4_r[112]} {image_4x4_r[113]} {image_4x4_r[114]} {image_4x4_r[115]} {image_4x4_r[116]} {image_4x4_r[117]} {image_4x4_r[118]} {image_4x4_r[119]} {image_4x4_r[120]} {image_4x4_r[121]} {image_4x4_r[122]} {image_4x4_r[123]} {image_4x4_r[124]} {image_4x4_r[125]} {image_4x4_r[126]} {image_4x4_r[127]} {kernel_r[0]} {kernel_r[1]} {kernel_r[2]} {kernel_r[3]} {kernel_r[4]} {kernel_r[5]} {kernel_r[6]} {kernel_r[7]} {kernel_r[8]} {kernel_r[9]} {kernel_r[10]} {kernel_r[11]} {kernel_r[12]} {kernel_r[13]} {kernel_r[14]} {kernel_r[15]} {kernel_r[16]} {kernel_r[17]} {kernel_r[18]} {kernel_r[19]} {kernel_r[20]} {kernel_r[21]} {kernel_r[22]} {kernel_r[23]} {kernel_r[24]} {kernel_r[25]} {kernel_r[26]} {kernel_r[27]} {kernel_r[28]} {kernel_r[29]} {kernel_r[30]} {kernel_r[31]} {kernel_r[32]} {kernel_r[33]} {kernel_r[34]} {kernel_r[35]} {kernel_r[36]} {kernel_r[37]} {kernel_r[38]} {kernel_r[39]} {kernel_r[40]} {kernel_r[41]} {kernel_r[42]} {kernel_r[43]} {kernel_r[44]} {kernel_r[45]} {kernel_r[46]} {kernel_r[47]} {kernel_r[48]} {kernel_r[49]} {kernel_r[50]} {kernel_r[51]} {kernel_r[52]} {kernel_r[53]} {kernel_r[54]} {kernel_r[55]} {kernel_r[56]} {kernel_r[57]} {kernel_r[58]} {kernel_r[59]} {kernel_r[60]} {kernel_r[61]} {kernel_r[62]} {kernel_r[63]} {kernel_r[64]} {kernel_r[65]} {kernel_r[66]} {kernel_r[67]} {kernel_r[68]} {kernel_r[69]} {kernel_r[70]} {kernel_r[71]}}
setPinAssignMode -pinEditInBatch false
getPinAssignMode -pinEditInBatch -quiet
setPinAssignMode -pinEditInBatch true
editPin -fixedPin 1 -fixOverlap 1 -spreadDirection clockwise -edge 2 -layer 4 -spreadType side -pin {{input_addr[0]} {input_addr[1]} {input_addr[2]} {input_addr[3]} {input_addr[4]} {input_addr[5]} {input_addr[6]} {input_addr[7]} {input_addr[8]} {input_addr[9]} {input_addr[10]} {input_addr[11]} {input_addr[12]} {input_addr[13]} {input_addr[14]} {input_addr[15]} input_re {output_addr[0]} {output_addr[1]} {output_addr[2]} {output_addr[3]} {output_addr[4]} {output_addr[5]} {output_addr[6]} {output_addr[7]} {output_addr[8]} {output_addr[9]} {output_addr[10]} {output_addr[11]} {output_addr[12]} {output_addr[13]} {output_addr[14]} {output_addr[15]} output_we {y[0]} {y[1]} {y[2]} {y[3]} {y[4]} {y[5]} {y[6]} {y[7]}}
setPinAssignMode -pinEditInBatch false

saveDesign conv_pool.pin.enc



setPlaceMode -place_global_timing_effort medium
setPlaceMode -place_global_reorder_scan false
setPlaceMode -place_global_cong_effort low
place_opt_design


#CHECK TIMING!


setNanoRouteMode -drouteMinimizeLithoEffectOnLayer {f t t t t t t t t t} \
    -routeTopRoutingLayer 3 -routeBottomRoutingLayer 2 \
    -routeWithViaInPin true 


set_ccopt_property buffer_cells {BUFx10_ASAP7_75t_R BUFx12_ASAP7_75t_R BUFx12f_ASAP7_75t_R BUFx16f_ASAP7_75t_R BUFx24_ASAP7_75t_R BUFx2_ASAP7_75t_R BUFx3_ASAP7_75t_R BUFx4_ASAP7_75t_R BUFx5_ASAP7_75t_R BUFx4f_ASAP7_75t_R BUFx6f_ASAP7_75t_R BUFx8_ASAP7_75t_R HB1xp67_ASAP7_75t_R HB2xp67_ASAP7_75t_R}

set_ccopt_property inverter_cells {INVx11_ASAP7_75t_R INVx13_ASAP7_75t_R INVx1_ASAP7_75t_R INVx2_ASAP7_75t_R INVx3_ASAP7_75t_R INVx4_ASAP7_75t_R INVx5_ASAP7_75t_R INVx6_ASAP7_75t_R INVx8_ASAP7_75t_R INVxp67_ASAP7_75t_R INVxp33_ASAP7_75t_R}


#timeDesign -postCTS -expandedViews -outDir ./timing/


set_ccopt_property cts_add_wire_delay_in_detailed_balancer true
set_ccopt_property cts_compute_fastest_drivers_and_slews_for_clustering multi_corner
set_ccopt_property cts_clustering_net_skew_limit_as_proportion_of_skew_target 0.5
set_ccopt_property routing_top_min_fanout 2000
set_ccopt_property cell_density 0.5
set_ccopt_property adjacent_rows_legal false
set_ccopt_property ccopt_auto_limit_insertion_delay_factor 1.0
set_ccopt_property skew_band_size 0.1
set_ccopt_property useful_skew_use_gigaopt_for_mfn_chain_speed true
set_ccopt_property useful_skew_implement_using_wns_windows false
set_ccopt_property target_max_trans  100ps

create_ccopt_clock_tree_spec -filename ./ccopt.spec
source ./ccopt.spec

ccopt_design -outDir ./

timeDesign -postCTS -expandedViews -outDir ./timing/
    

report_ccopt_clock_trees -filename ./clock_trees.rpt
report_ccopt_skew_groups -filename ./skew_groups.rpt


optDesign -postCTS
optDesign -postCTS -hold

#saveDesign mux_16_1.clock.enc
setNanoRouteMode -drouteMinimizeLithoEffectOnLayer {t t t t t t t t t t}
setNanoRouteMode -routeWithViaInPin true -routeDesignFixClockNets true -routeTopRoutingLayer 6
setNanoRouteMode -quiet -drouteFixAntenna 0
setNanoRouteMode -quiet -routeWithTimingDriven 1
setNanoRouteMode -quiet -drouteEndIteration default
setNanoRouteMode -quiet -routeWithTimingDriven true
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign -globalDetail


getFillerMode -quiet
addFiller -cell {TAPCELL_ASAP7_75t_R FILLERxp5_ASAP7_75t_R FILLER_ASAP7_75t_R} -prefix FILLER_

setAnalysisMode -analysisType onChipVariation -cppr both
setOptMode -allEndPoints true
setOptMode -fixFanoutLoad
optDesign -postRoute
optDesign -postRoute -hold -setup

#verifyConnectivity -type all -noAntenna -error 1000000 -warning 50
verifyConnectivity
verify_drc



extractRC

rcOut -spf  conv_pool.spf
rcOut -spef conv_pool.spef


saveNetlist conv_pool.apr.v -excludeLeafCell -excludeCellInst {FILLERxp5_ASAP7_75t_R FILLER_ASAP7_75t_R}
saveNetlist conv_pool.apr_pg.v -includePowerGround -excludeLeafCell -excludeCellInst {FILLERxp5_ASAP7_75t_R FILLER_ASAP7_75t_R}


streamOut conv_pool.gds -mapFile /afs/asu.edu/class/e/e/e/eee525b/asap7/asap7PDK/cdslib/asap7_TechLib/asap7_fromAPR.layermap -libName mux_16_1 -units 4000 -mode ALL

saveDesign conv_pool.final.enc

#setAnalysisMode -analysisType onChipVariation -cppr both

summaryReport
