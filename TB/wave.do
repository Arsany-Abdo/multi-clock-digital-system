onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group TB -color {Slate Blue} /SYS_TOP_TB/REF_CLK_TB
add wave -noupdate -expand -group TB -color {Slate Blue} /SYS_TOP_TB/UART_CLK_TB
add wave -noupdate -expand -group TB -color {Blue Violet} /SYS_TOP_TB/RST_TB
add wave -noupdate -expand -group TB /SYS_TOP_TB/RX_IN_TB
add wave -noupdate -expand -group TB /SYS_TOP_TB/TX_OUT_TB
add wave -noupdate -expand -group TB /SYS_TOP_TB/parity_error_TB
add wave -noupdate -expand -group TB /SYS_TOP_TB/framing_error_TB
add wave -noupdate -expand -group TB /SYS_TOP_TB/data
add wave -noupdate -expand -group TB /SYS_TOP_TB/address
add wave -noupdate -expand -group TB /SYS_TOP_TB/TX_OUT_DETECT
add wave -noupdate -expand -group TB /SYS_TOP_TB/frame
add wave -noupdate -expand -group TB /SYS_TOP_TB/A_OP
add wave -noupdate -expand -group TB /SYS_TOP_TB/B_OP
add wave -noupdate -expand -group TB /SYS_TOP_TB/EXPECTED
add wave -noupdate -expand -group TB /SYS_TOP_TB/alu_fun
add wave -noupdate -expand -group TB /SYS_TOP_TB/ALU_OUT_DETECT
add wave -noupdate -expand -group RegFile /SYS_TOP_TB/SYS_TOP_DUT/RegFile_TOP/WrData
add wave -noupdate -expand -group RegFile /SYS_TOP_TB/SYS_TOP_DUT/RegFile_TOP/Address
add wave -noupdate -expand -group RegFile /SYS_TOP_TB/SYS_TOP_DUT/RegFile_TOP/WrEn
add wave -noupdate -expand -group RegFile /SYS_TOP_TB/SYS_TOP_DUT/RegFile_TOP/RdEn
add wave -noupdate -expand -group RegFile /SYS_TOP_TB/SYS_TOP_DUT/RegFile_TOP/CLK
add wave -noupdate -expand -group RegFile /SYS_TOP_TB/SYS_TOP_DUT/RegFile_TOP/RST
add wave -noupdate -expand -group RegFile /SYS_TOP_TB/SYS_TOP_DUT/RegFile_TOP/RdData
add wave -noupdate -expand -group RegFile /SYS_TOP_TB/SYS_TOP_DUT/RegFile_TOP/RdData_VLD
add wave -noupdate -expand -group RegFile -color Plum /SYS_TOP_TB/SYS_TOP_DUT/RegFile_TOP/REG0
add wave -noupdate -expand -group RegFile -color Plum /SYS_TOP_TB/SYS_TOP_DUT/RegFile_TOP/REG1
add wave -noupdate -expand -group RegFile -color Plum -radix binary /SYS_TOP_TB/SYS_TOP_DUT/RegFile_TOP/REG2
add wave -noupdate -expand -group RegFile -color Plum -radix unsigned /SYS_TOP_TB/SYS_TOP_DUT/RegFile_TOP/REG3
add wave -noupdate -expand -group RegFile /SYS_TOP_TB/SYS_TOP_DUT/RegFile_TOP/i
add wave -noupdate -expand -group SYS_CTRL /SYS_TOP_TB/SYS_TOP_DUT/SYS_CTRL_TOP/CLK
add wave -noupdate -expand -group SYS_CTRL /SYS_TOP_TB/SYS_TOP_DUT/SYS_CTRL_TOP/RST
add wave -noupdate -expand -group SYS_CTRL /SYS_TOP_TB/SYS_TOP_DUT/SYS_CTRL_TOP/ALU_OUT
add wave -noupdate -expand -group SYS_CTRL /SYS_TOP_TB/SYS_TOP_DUT/SYS_CTRL_TOP/OUT_VALID
add wave -noupdate -expand -group SYS_CTRL /SYS_TOP_TB/SYS_TOP_DUT/SYS_CTRL_TOP/ALU_FUN
add wave -noupdate -expand -group SYS_CTRL /SYS_TOP_TB/SYS_TOP_DUT/SYS_CTRL_TOP/ALU_EN
add wave -noupdate -expand -group SYS_CTRL /SYS_TOP_TB/SYS_TOP_DUT/SYS_CTRL_TOP/CLKG_EN
add wave -noupdate -expand -group SYS_CTRL /SYS_TOP_TB/SYS_TOP_DUT/SYS_CTRL_TOP/Address
add wave -noupdate -expand -group SYS_CTRL /SYS_TOP_TB/SYS_TOP_DUT/SYS_CTRL_TOP/WrEn
add wave -noupdate -expand -group SYS_CTRL /SYS_TOP_TB/SYS_TOP_DUT/SYS_CTRL_TOP/RdEn
add wave -noupdate -expand -group SYS_CTRL /SYS_TOP_TB/SYS_TOP_DUT/SYS_CTRL_TOP/WrData
add wave -noupdate -expand -group SYS_CTRL /SYS_TOP_TB/SYS_TOP_DUT/SYS_CTRL_TOP/RdData
add wave -noupdate -expand -group SYS_CTRL /SYS_TOP_TB/SYS_TOP_DUT/SYS_CTRL_TOP/RdData_Valid
add wave -noupdate -expand -group SYS_CTRL -color {Dark Orchid} /SYS_TOP_TB/SYS_TOP_DUT/SYS_CTRL_TOP/RX_P_DATA
add wave -noupdate -expand -group SYS_CTRL -color {Dark Orchid} /SYS_TOP_TB/SYS_TOP_DUT/SYS_CTRL_TOP/RX_D_VLD
add wave -noupdate -expand -group SYS_CTRL /SYS_TOP_TB/SYS_TOP_DUT/SYS_CTRL_TOP/FIFO_P_DATA
add wave -noupdate -expand -group SYS_CTRL /SYS_TOP_TB/SYS_TOP_DUT/SYS_CTRL_TOP/WR_INC
add wave -noupdate -expand -group SYS_CTRL /SYS_TOP_TB/SYS_TOP_DUT/SYS_CTRL_TOP/FIFO_FULL
add wave -noupdate -expand -group SYS_CTRL /SYS_TOP_TB/SYS_TOP_DUT/SYS_CTRL_TOP/clk_div_en
add wave -noupdate -expand -group SYS_CTRL /SYS_TOP_TB/SYS_TOP_DUT/SYS_CTRL_TOP/store
add wave -noupdate -expand -group SYS_CTRL /SYS_TOP_TB/SYS_TOP_DUT/SYS_CTRL_TOP/Address_reg
add wave -noupdate -expand -group SYS_CTRL /SYS_TOP_TB/SYS_TOP_DUT/SYS_CTRL_TOP/current_state
add wave -noupdate -expand -group SYS_CTRL /SYS_TOP_TB/SYS_TOP_DUT/SYS_CTRL_TOP/next_state
add wave -noupdate -expand -group UART /SYS_TOP_TB/SYS_TOP_DUT/UART_TOP/RST
add wave -noupdate -expand -group UART -color {Dark Orchid} /SYS_TOP_TB/SYS_TOP_DUT/UART_TOP/TX_CLK
add wave -noupdate -expand -group UART -color {Dark Orchid} /SYS_TOP_TB/SYS_TOP_DUT/UART_TOP/RX_CLK
add wave -noupdate -expand -group UART /SYS_TOP_TB/SYS_TOP_DUT/UART_TOP/RX_IN_S
add wave -noupdate -expand -group UART /SYS_TOP_TB/SYS_TOP_DUT/UART_TOP/RX_OUT_P
add wave -noupdate -expand -group UART /SYS_TOP_TB/SYS_TOP_DUT/UART_TOP/RX_OUT_V
add wave -noupdate -expand -group UART /SYS_TOP_TB/SYS_TOP_DUT/UART_TOP/TX_IN_P
add wave -noupdate -expand -group UART -color {Dark Orchid} /SYS_TOP_TB/SYS_TOP_DUT/UART_TOP/TX_IN_V
add wave -noupdate -expand -group UART -color {Dark Orchid} /SYS_TOP_TB/SYS_TOP_DUT/UART_TOP/TX_OUT_S
add wave -noupdate -expand -group UART /SYS_TOP_TB/SYS_TOP_DUT/UART_TOP/TX_OUT_V
add wave -noupdate -expand -group UART /SYS_TOP_TB/SYS_TOP_DUT/UART_TOP/Prescale
add wave -noupdate -expand -group UART /SYS_TOP_TB/SYS_TOP_DUT/UART_TOP/parity_enable
add wave -noupdate -expand -group UART /SYS_TOP_TB/SYS_TOP_DUT/UART_TOP/parity_type
add wave -noupdate -expand -group UART /SYS_TOP_TB/SYS_TOP_DUT/UART_TOP/parity_error
add wave -noupdate -expand -group UART /SYS_TOP_TB/SYS_TOP_DUT/UART_TOP/framing_error
add wave -noupdate -expand -group FIFO /SYS_TOP_TB/SYS_TOP_DUT/ASYNC_FIFO_TOP/i_w_clk
add wave -noupdate -expand -group FIFO /SYS_TOP_TB/SYS_TOP_DUT/ASYNC_FIFO_TOP/i_w_rstn
add wave -noupdate -expand -group FIFO /SYS_TOP_TB/SYS_TOP_DUT/ASYNC_FIFO_TOP/i_w_inc
add wave -noupdate -expand -group FIFO /SYS_TOP_TB/SYS_TOP_DUT/ASYNC_FIFO_TOP/i_r_clk
add wave -noupdate -expand -group FIFO /SYS_TOP_TB/SYS_TOP_DUT/ASYNC_FIFO_TOP/i_r_rstn
add wave -noupdate -expand -group FIFO /SYS_TOP_TB/SYS_TOP_DUT/ASYNC_FIFO_TOP/i_r_inc
add wave -noupdate -expand -group FIFO /SYS_TOP_TB/SYS_TOP_DUT/ASYNC_FIFO_TOP/i_w_data
add wave -noupdate -expand -group FIFO /SYS_TOP_TB/SYS_TOP_DUT/ASYNC_FIFO_TOP/o_r_data
add wave -noupdate -expand -group FIFO /SYS_TOP_TB/SYS_TOP_DUT/ASYNC_FIFO_TOP/o_full
add wave -noupdate -expand -group FIFO /SYS_TOP_TB/SYS_TOP_DUT/ASYNC_FIFO_TOP/o_empty
add wave -noupdate -expand -group FIFO /SYS_TOP_TB/SYS_TOP_DUT/ASYNC_FIFO_TOP/r_addr
add wave -noupdate -expand -group FIFO /SYS_TOP_TB/SYS_TOP_DUT/ASYNC_FIFO_TOP/w_addr
add wave -noupdate -expand -group FIFO /SYS_TOP_TB/SYS_TOP_DUT/ASYNC_FIFO_TOP/w2r_ptr
add wave -noupdate -expand -group FIFO /SYS_TOP_TB/SYS_TOP_DUT/ASYNC_FIFO_TOP/r2w_ptr
add wave -noupdate -expand -group FIFO /SYS_TOP_TB/SYS_TOP_DUT/ASYNC_FIFO_TOP/gray_w_ptr
add wave -noupdate -expand -group FIFO /SYS_TOP_TB/SYS_TOP_DUT/ASYNC_FIFO_TOP/gray_rd_ptr
add wave -noupdate -expand -group ALU /SYS_TOP_TB/SYS_TOP_DUT/ALU_TOP/A
add wave -noupdate -expand -group ALU /SYS_TOP_TB/SYS_TOP_DUT/ALU_TOP/B
add wave -noupdate -expand -group ALU /SYS_TOP_TB/SYS_TOP_DUT/ALU_TOP/EN
add wave -noupdate -expand -group ALU /SYS_TOP_TB/SYS_TOP_DUT/ALU_TOP/ALU_FUN
add wave -noupdate -expand -group ALU -color {Dark Orchid} /SYS_TOP_TB/SYS_TOP_DUT/ALU_TOP/CLK
add wave -noupdate -expand -group ALU /SYS_TOP_TB/SYS_TOP_DUT/ALU_TOP/RST
add wave -noupdate -expand -group ALU -radix binary /SYS_TOP_TB/SYS_TOP_DUT/ALU_TOP/ALU_OUT
add wave -noupdate -expand -group ALU /SYS_TOP_TB/SYS_TOP_DUT/ALU_TOP/OUT_VALID
add wave -noupdate -expand -group ALU /SYS_TOP_TB/SYS_TOP_DUT/ALU_TOP/ALU_OUT_Comb
add wave -noupdate -expand -group ALU /SYS_TOP_TB/SYS_TOP_DUT/ALU_TOP/OUT_VALID_Comb
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1045709684 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {1045300696 ps} {1046079304 ps}
