
####################################################################################
# Constraints
# ----------------------------------------------------------------------------
#
# 0. Design Compiler variables
#
# 1. Master Clock Definitions
#
# 2. Generated Clock Definitions
#
# 3. Clock Uncertainties
#
# 4. Clock Latencies 
#
# 5. Clock Relationships
#
# 6. #set input/output delay on ports
#
# 7. Driving cells
#
# 8. Output load

####################################################################################
           #########################################################
                  #### Section 0 : DC Variables ####
           #########################################################
#################################################################################### 

# Prevent assign statements in the generated netlist (must be applied before compile command)
set_fix_multiple_port_nets -all -buffer_constants -feedthroughs

####################################################################################
           #########################################################
                  #### Section 1 : Clock Definition ####
           #########################################################
#################################################################################### 
# 1. Master Clock Definitions 
# 2. Generated Clock Definitions
# 3. Clock Latencies
# 4. Clock Uncertainties
# 4. Clock Transitions
####################################################################################
set REF_CLK_PERIOD 20
set UART_CLK_PERIOD 271
set SCAN_CLK_PERIOD 100
set UART_TX_PERIOD [expr $UART_CLK_PERIOD*32]
set SETUP_UNCERTAINTY 0.2 
set HOLD_UNCERTAINTY 0.1
set CLOCK_TRANSITION 0.05




#1. Master Clocks

#REF CLK
create_clock -period $REF_CLK_PERIOD -name REF_CLK [get_ports "REF_CLK"]

#SCAN CLK
create_clock -period $SCAN_CLK_PERIOD -name SCAN_CLK [get_ports "scan_clk"]

#UART CLK
create_clock -period $UART_CLK_PERIOD -name UART_CLK [get_ports "UART_CLK"]

#2. Generated clocks

###########REF CLK##############

#ALU
create_generated_clock -master_clock "REF_CLK" -source [get_ports "REF_CLK"] -name "ALU_CLK" -divide_by 1 [get_pins "CLK_GATE_TOP/GATED_CLK"]

#RX
create_generated_clock -master_clock "UART_CLK" -source [get_ports "UART_CLK"] -name "RX_CLK" -divide_by 1 [get_pins "CLK_RX_TOP/O_div_clk"]

#TX
create_generated_clock -master_clock "UART_CLK" -source [get_ports "UART_CLK"] -name "TX_CLK" -divide_by 32 [get_pins "CLK_TX_TOP/O_div_clk"]

						
						
#clock Uncertainties
set_clock_uncertainty -setup $SETUP_UNCERTAINTY [get_clocks "REF_CLK ALU_CLK UART_CLK RX_CLK TX_CLK SCAN_CLK"]
set_clock_uncertainty -hold  $HOLD_UNCERTAINTY [get_clocks "REF_CLK ALU_CLK UART_CLK RX_CLK TX_CLK SCAN_CLK"]

#Clock Transitions
set_clock_transition $CLOCK_TRANSITION [get_clocks "REF_CLK UART_CLK SCAN_CLK"]



set_dont_touch_network [get_clocks "REF_CLK ALU_CLK UART_CLK RX_CLK TX_CLK SCAN_CLK"]
set_dont_touch_network [get_ports "RST_N scan_rst"] 


####################################################################################
           #########################################################
             #### Section 2 : Clocks Relationship ####
           #########################################################
####################################################################################

set_clock_groups -asynchronous 	-group [get_clocks "REF_CLK ALU_CLK"]\
								-group [get_clocks "UART_CLK RX_CLK TX_CLK"]\
								


set_clock_groups -logically_exclusive -group [get_clocks "REF_CLK"]\
									  -group [get_clocks "SCAN_CLK"]
									  
set_clock_groups -logically_exclusive -group [get_clocks "UART_CLK"]\
									  -group [get_clocks "SCAN_CLK"]
									  
set_clock_groups -logically_exclusive -group [get_clocks "ALU_CLK"]\
									  -group [get_clocks "SCAN_CLK"]
									  
set_clock_groups -logically_exclusive -group [get_clocks "RX_CLK"]\
									  -group [get_clocks "SCAN_CLK"]					  
									  
set_clock_groups -logically_exclusive -group [get_clocks "TX_CLK"]\
									  -group [get_clocks "SCAN_CLK"]
									  
									  
####################################################################################
           #########################################################
             #### Section 3 : set input/output delay on ports ####
           #########################################################
####################################################################################
set INPUT_DELAY_RX  [expr 0.2*$UART_CLK_PERIOD]
set INPUT_DELAY_SCAN [expr 0.2*$SCAN_CLK_PERIOD]
set OUTPUT_DELAY_SCAN [expr 0.2*$SCAN_CLK_PERIOD]
set OUTPUT_DELAY_RX [expr 0.2*$UART_CLK_PERIOD]
set OUTPUT_DELAY_TX [expr 0.2*$UART_TX_PERIOD]


set_input_delay  $INPUT_DELAY_RX  -clock RX_CLK [get_ports "UART_RX_IN"]
set_output_delay $OUTPUT_DELAY_TX -clock TX_CLK [get_ports "UART_TX_O"]
set_output_delay $OUTPUT_DELAY_RX -clock RX_CLK [get_ports "parity_error framing_error"]
set_input_delay $INPUT_DELAY_SCAN -clock SCAN_CLK [get_ports "SE SI test_mode"]
set_output_delay $OUTPUT_DELAY_SCAN -clock SCAN_CLK [get_ports "SO"]

####################################################################################
           #########################################################
                  #### Section 4 : Driving cells ####
           #########################################################
####################################################################################

set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_ports "UART_RX_IN SE SI test_mode"]

####################################################################################
           #########################################################
                  #### Section 5 : Output load ####
           #########################################################
####################################################################################

set_load 0.1 [get_ports "UART_TX_O parity_error framing_error SO"]

####################################################################################
           #########################################################
                 #### Section 6 : Operating Condition ####
           #########################################################
####################################################################################

# Define the Worst Library for Max(#setup) analysis
# Define the Best Library for Min(hold) analysis

set_operating_conditions -min_library "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -min "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -max_library "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c" -max "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"

####################################################################################
           #########################################################
                  #### Section 7 : wireload Model ####
           #########################################################
####################################################################################


####################################################################################
           #########################################################
                  #### Section 8 : premapped cells ####
           #########################################################
####################################################################################


####################################################################################


set_case_analysis 1 [get_port "test_mode"]
