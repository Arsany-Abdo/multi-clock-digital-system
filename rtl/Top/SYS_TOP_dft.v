module  SYS_TOP_dft #(parameter DATA_WIDTH = 8,
                            ALU_OUT_WIDTH = DATA_WIDTH * 2,
                            DEPTH = 16,
                            ADDR = 4,
                            POINTER = ADDR + 1,
                            NUM_STAGES_RST = 2,
                            NUM_STAGES_DATA = 2,
                            NUM_OF_CHAINS = 5
)
(
//DFT PORTS
input   wire    scan_clk,
input   wire    scan_rst,
input   wire    test_mode,
input   wire    SE,
input   wire    [NUM_OF_CHAINS-1:0] SI,
output  wire    [NUM_OF_CHAINS-1:0] SO,

input   wire    REF_CLK,
input   wire    UART_CLK,
input   wire    RST_N,
input   wire    UART_RX_IN,
output  wire    UART_TX_O,
output  wire    parity_error,
output  wire    framing_error
);



///////////////////////////////////////////////////////////
///////////////////interanl signals////////////////////////
///////////////////////////////////////////////////////////

//DFT
wire REF_CLK_M,
     UART_CLK_M,
     CLK_RX_M,
     CLK_TX_M,
     ALU_CLK_M,
     SYNC_RST_REF_M,
     SYNC_RST_UART_M,
     RST_M;



//SYNC_RST_REF
wire SYNC_RST_REF;

//SYNC_RST_UART
wire SYNC_RST_UART;

//CLK DIV TX
wire                        CLK_TX;
wire    [DATA_WIDTH-1:0]    DIV_RATIO;

//CLK DIV RX
wire CLK_RX,
     CLK_EN;

wire [DATA_WIDTH-1:0]   CLK_RX_DIV_RATIO;

//CLK GATE 
wire CLKG_EN,
     ALU_CLK;



//UART
wire [DATA_WIDTH-1:0]   UART_CONFIG,
                        RX_OUT_P;

wire RX_OUT_V,TX_BUSY;


//DATA_SYNC
wire [DATA_WIDTH-1:0]   RX_OUT_P_SYNC;
wire RX_OUT_V_SYNC;


//ALU
wire [DATA_WIDTH-1:0]     A_TOP; 
wire [DATA_WIDTH-1:0]     B_TOP;
wire                      ALU_EN_TOP;
wire [3:0]                ALU_FUN_TOP;
wire [ALU_OUT_WIDTH-1:0]  ALU_OUT_TOP;
wire                      ALU_OUT_VALID_TOP;

//SYS CTRL
wire [ADDR-1:0]             Address_TOP;
wire                        WrEn_TOP;
wire                        RdEn_TOP;
wire [DATA_WIDTH-1:0]       WrData_TOP;
wire [DATA_WIDTH-1:0]       RdData_TOP;
wire                        RdData_Valid_TOP;
wire [DATA_WIDTH-1:0]       FIFO_P_DATA_TOP;
wire                        WR_INC_TOP;



//FIFO
wire    RD_INC,
        FIFO_EMPTY_TOP,
        FIFO_FULL_TOP;
        
wire    [DATA_WIDTH-1:0]    FIFO_RD_DATA;








///////////////////////////////////////////////////
/////////////////////Instatiation//////////////////
//////////////////////////////////////////////////

////////////////////DFT/////////////////

////////////REF CLK////////////
mux2x1 REF_CLK_MUX (

.I0(REF_CLK),
.I1(scan_clk),
.SEL(test_mode),
.Y(REF_CLK_M)
);


///////////UART CLK///////////////
mux2x1 UART_CLK_MUX (

.I0(UART_CLK),
.I1(scan_clk),
.SEL(test_mode),
.Y(UART_CLK_M)
);


//////////RST/////////////
mux2x1 RST_MUX (

.I0(RST_N),
.I1(scan_rst),
.SEL(test_mode),
.Y(RST_M)
);


////////////////////////SYNC_RST_REF//////////////////////////
RST_SYNC #(.NUM_STAGES(NUM_STAGES_RST)) RST_SYNC_REF (
.RST(RST_M),
.CLK(REF_CLK_M),
.SYNC_RST(SYNC_RST_REF)
);

mux2x1 SYNC_RST_REF_MUX (

.I0(SYNC_RST_REF),
.I1(scan_rst),
.SEL(test_mode),
.Y(SYNC_RST_REF_M)
);


/////////////////////////////SYNC_RST_UART//////////////////////////
RST_SYNC #(.NUM_STAGES(NUM_STAGES_RST)) RST_SYNC_UART (
.RST(RST_M),
.CLK(UART_CLK_M),
.SYNC_RST(SYNC_RST_UART)
);

mux2x1 SYNC_RST_UART_MUX (

.I0(SYNC_RST_UART),
.I1(scan_rst),
.SEL(test_mode),
.Y(SYNC_RST_UART_M)
);




///////////////////////////////CLK DIV TX////////////////////////////////////
clk_div #(.DATA_WIDTH(DATA_WIDTH)) CLK_TX_TOP 
(
.I_ref_clk(UART_CLK_M),
.I_rst_n(SYNC_RST_UART_M),
.I_clk_en(CLK_EN),
.I_div_ratio(DIV_RATIO),
.O_div_clk(CLK_TX)    
);

mux2x1 CLK_TX_MUX (

.I0(CLK_TX),
.I1(scan_clk),
.SEL(test_mode),
.Y(CLK_TX_M)
);



///////////////////////////////CLK DIV RX MUX////////////////////////////////////
CLKDIV_MUX #(.WIDTH(DATA_WIDTH)) CLKDIV_MUX_TOP 
(
.IN(UART_CONFIG[DATA_WIDTH-1:2]),
.OUT(CLK_RX_DIV_RATIO)
);


/////////////////////////////CLK DIV RX//////////////////////////
clk_div #(.DATA_WIDTH(DATA_WIDTH)) CLK_RX_TOP 
(
.I_ref_clk(UART_CLK_M),
.I_rst_n(SYNC_RST_UART_M),
.I_clk_en(CLK_EN),
.I_div_ratio(CLK_RX_DIV_RATIO),
.O_div_clk(CLK_RX)    
);


mux2x1 CLK_RX_MUX (

.I0(CLK_RX),
.I1(scan_clk),
.SEL(test_mode),
.Y(CLK_RX_M)
);



///////////////////////////////UART///////////////////////////
UART #(.DATA_WIDTH(DATA_WIDTH)) UART_TOP
(
.RST(SYNC_RST_UART_M),
.TX_CLK(CLK_TX_M),
.RX_CLK(CLK_RX_M),
.RX_IN_S(UART_RX_IN),
.RX_OUT_P(RX_OUT_P), 
.RX_OUT_V(RX_OUT_V),
.TX_IN_P(FIFO_RD_DATA), 
.TX_IN_V(!FIFO_EMPTY_TOP),
.TX_OUT_S(UART_TX_O),
.TX_OUT_V(TX_BUSY),  
.Prescale(UART_CONFIG[DATA_WIDTH-1:2]), 
.parity_enable(UART_CONFIG[0]),
.parity_type(UART_CONFIG[1]),
.parity_error(parity_error),
.framing_error(framing_error)
);


////////////////PULSE GEN////////////////
PULSE_GEN PULSE_GEN_TOP 
(
.clk(CLK_TX_M),
.rst(SYNC_RST_UART_M),
.lvl_sig(TX_BUSY),
.pulse_sig(RD_INC)
);




/////////////////////////////DATA_SYNC/////////////////////////
DATA_SYNC #(.BUS_WIDTH(DATA_WIDTH), .NUM_STAGES(NUM_STAGES_DATA)) DATA_SYNC_TOP 
(
.Unsync_bus(RX_OUT_P),
.bus_enable(RX_OUT_V),
.CLK(REF_CLK_M),
.RST(SYNC_RST_REF_M),
.sync_bus(RX_OUT_P_SYNC),
.enable_pusle(RX_OUT_V_SYNC)
);






//////////////////////////////////////REGFILE//////////////////////////////////
RegFile #(.ADDR(ADDR), .WIDTH(DATA_WIDTH), .DEPTH(DEPTH)) RegFile_TOP
(
.WrData(WrData_TOP),
.Address(Address_TOP),
.WrEn(WrEn_TOP),
.RdEn(RdEn_TOP),
.CLK(REF_CLK_M),
.RST(SYNC_RST_REF_M),
.RdData(RdData_TOP),
.RdData_VLD(RdData_Valid_TOP),
.REG0(A_TOP),
.REG1(B_TOP),
.REG2(UART_CONFIG),
.REG3(DIV_RATIO)
);




///////////////////////////////SYS_CTRL//////////////////////////////
SYS_CTRL #(.DATA_WIDTH(DATA_WIDTH), .ADDR(ADDR)) SYS_CTRL_TOP
(
.CLK(REF_CLK_M),
.RST(SYNC_RST_REF_M),
.ALU_OUT(ALU_OUT_TOP),
.OUT_VALID(ALU_OUT_VALID_TOP),
.ALU_FUN(ALU_FUN_TOP),
.ALU_EN(ALU_EN_TOP),
.CLKG_EN(CLKG_EN),

.Address(Address_TOP),
.WrEn(WrEn_TOP),
.RdEn(RdEn_TOP),
.WrData(WrData_TOP),
.RdData(RdData_TOP),
.RdData_Valid(RdData_Valid_TOP),
.RX_P_DATA(RX_OUT_P_SYNC),
.RX_D_VLD(RX_OUT_V_SYNC),

.FIFO_P_DATA(FIFO_P_DATA_TOP),
.WR_INC(WR_INC_TOP),
.FIFO_FULL(FIFO_FULL_TOP),

.clk_div_en(CLK_EN)
);



/////////////////////////ASYNC_FIFO////////////////////
Async_fifo #(.D_SIZE(DATA_WIDTH),                         // data size
             .A_SIZE(ADDR),                         // address size
             .P_SIZE(POINTER),                         // pointer width
             .F_DEPTH(DEPTH)                         // fifo depth
) ASYNC_FIFO_TOP
 (
.i_w_clk(REF_CLK_M),              // write domian operating clock
.i_w_rstn(SYNC_RST_REF_M),        // write domian active low reset  
.i_w_inc(WR_INC_TOP),           // write control signal 
.i_r_clk(CLK_TX_M),               // read domian operating clock
.i_r_rstn(SYNC_RST_UART_M),       // read domian active low reset 
.i_r_inc(RD_INC),             // read control signal
.i_w_data(FIFO_P_DATA_TOP),             // write data bus 
.o_r_data(FIFO_RD_DATA),             // read data bus
.o_full(FIFO_FULL_TOP),               // fifo full flag
.o_empty(FIFO_EMPTY_TOP)               // fifo empty flag
 );



/////////////////////////////CLK GATE///////////////////////////////
CLK_GATE CLK_GATE_TOP (
.CLK_EN(CLKG_EN|test_mode),
.CLK(REF_CLK_M),
.GATED_CLK(ALU_CLK)
);


mux2x1 ALU_CLK_MUX (

.I0(ALU_CLK),
.I1(scan_clk),
.SEL(test_mode),
.Y(ALU_CLK_M)
);



////////////////////////////////ALU////////////////////////////////////
ALU #(.OPER_WIDTH(DATA_WIDTH)) ALU_TOP
(
.A(A_TOP), 
.B(B_TOP),
.EN(ALU_EN_TOP),
.ALU_FUN(ALU_FUN_TOP),
.CLK(ALU_CLK_M),
.RST(SYNC_RST_REF_M),  
.ALU_OUT(ALU_OUT_TOP),
.OUT_VALID(ALU_OUT_VALID_TOP)  
);


endmodule