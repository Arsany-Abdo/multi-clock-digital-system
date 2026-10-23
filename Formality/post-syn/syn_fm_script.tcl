
########################### Define Top Module ############################
                                                   
set top_module SYS_TOP

######################### Formality Setup File ###########################

set synopsys_auto_setup true

set_svf "../../Synthesis/$top_module.svf"


set SSLIB "/home/ICer/multi-clock-digital-system/std_cells/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/home/ICer/multi-clock-digital-system/std_cells/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/home/ICer/multi-clock-digital-system/std_cells/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

######################### Reference Container ############################

## Read Reference technology libraries

set fh [open rtl.f r+]
set rtl [read $fh]
set designs ""
regsub -all "\n" $rtl " " designs

read_verilog -container Ref $designs


## Read Reference Design Files
read_db -container Ref "$SSLIB $TTLIB $FFLIB" 

## set the top Reference Design 
set_reference_design $top_module
set_top $top_module


######################## Implementation Container #########################

## Read Implementation technology libraries
read_verilog -container Imp "/home/ICer/multi-clock-digital-system/Synthesis/netlists/SYS_TOP.v"

## Read Implementation Design Files
 read_db -container Imp "$SSLIB $TTLIB $FFLIB"
 
## set the top Implementation Design
set_implementation_design $top_module
set_top $top_module


## matching Compare points
match

## verify
set successful [verify]
if {!$successful} {
diagnose
analyze_points -failing
}

report_passing_points > "reports/passing_points.rpt"
report_failing_points > "reports/failing_points.rpt"
report_aborted_points > "reports/aborted_points.rpt"
report_unverified_points > "reports/unverified_points.rpt"


start_gui
