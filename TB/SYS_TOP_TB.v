`timescale 1ns/1ps

module  SYS_TOP_TB ();


parameter   DATA_WIDTH = 8,
            ALU_OUT_WIDTH = DATA_WIDTH * 2,
            DEPTH = 16,
            ADDR = 4,
            NUM_STAGES_RST = 2,
            NUM_STAGES_DATA = 2,
            REF_CLK_PERIOD = 20,
            REF_CLK_HALF_PERIOD = 10,
            UART_RX_CLK_PERIOD = 271.267,
            UART_RX_CLK_HALF_PERIOD = 135.633,
            UART_TX_CLK_PERIOD = 8680,
            UART_TX_CLK_HALF_PERIOD = 4340;



///////////////////Ports///////////////////////////

reg     REF_CLK_TB;
reg     UART_CLK_TB;
reg     RST_TB;
reg     RX_IN_TB;
wire    TX_OUT_TB;
wire    parity_error_TB;
wire    framing_error_TB;


///////////////// Signals /////////////////////
reg [DATA_WIDTH-1:0]    frame;
reg [DATA_WIDTH-1:0]    data;
reg [DATA_WIDTH-1:0]    A_OP,
                        B_OP;
reg [ALU_OUT_WIDTH-1:0] EXPECTED;
reg [3:0]   alu_fun;
reg [ADDR-1:0]          address;
reg [DATA_WIDTH+2:0]    TX_OUT_DETECT;
reg [ALU_OUT_WIDTH-1:0] ALU_OUT_DETECT;






/////////////// INITIAL BLOCK //////////////////////////
initial
    begin
        $dumpfile ("SYS.vcd");
        $dumpvars;

        Initialize();
        #UART_TX_CLK_PERIOD;
        
        Reset();
        #UART_TX_CLK_PERIOD;
        
        //configration

        //UART_CONFIG
        data = 'b100000_01;
        address = 'b10;
        Wr_OP(address, data);
        #UART_TX_CLK_PERIOD
        
        //DIV RATIO
        data = 'b0010_0000;
        address = 'b11;
        Wr_OP(address, data);
        #UART_TX_CLK_PERIOD

        //Write
        data = 'b0010_0010;
        address = 'b1000;
        Wr_OP(address, data);
        #UART_TX_CLK_PERIOD
        
        //READ
        Rd_OP(address);
        #UART_TX_CLK_PERIOD
        
        //ALU WITH OPERANT
        A_OP = 'd10;
        B_OP = 'd100;
        alu_fun = 'b0010;
        EXPECTED = A_OP*B_OP;
        ALU_WITH_OPERANT(A_OP,B_OP,alu_fun);
        #UART_TX_CLK_PERIOD;
        
        //ALU NO OPERANT
        alu_fun = 'b0000;
        EXPECTED = A_OP+B_OP;
        ALU_NO_OPERANT(alu_fun);
        #UART_TX_CLK_PERIOD;




        $stop;
    end




/////////////Tasks//////////////

//initialize task
task Initialize;
    begin
        REF_CLK_TB = 1'b0;
        UART_CLK_TB = 1'b0;
        RST_TB = 1'b1;
        RX_IN_TB = 1'b1;
        frame = 'b0;
        #UART_TX_CLK_PERIOD;
    end
endtask

//Reset task
task Reset;
    begin
        RST_TB = 1'b0;
        #UART_TX_CLK_PERIOD;
        RST_TB = 1'b1;
    end
endtask

//Write Operation Task
task Wr_OP;
    integer i;
    input [DATA_WIDTH-1:0]  Address,
                            Data;
    begin
        //Command frame
        frame = 'hAA;
        RX_IN_TB = 1'b0;
        #UART_TX_CLK_PERIOD
        for (i=0 ; i<DATA_WIDTH ; i=i+1)
            begin
                RX_IN_TB = frame[i];
                #UART_TX_CLK_PERIOD;
            end
        RX_IN_TB = ^frame;
        #UART_TX_CLK_PERIOD
        RX_IN_TB = 1;
        #UART_TX_CLK_PERIOD
        
        //address frame
        frame = Address;
        RX_IN_TB = 1'b0;
        #UART_TX_CLK_PERIOD
        for (i=0 ; i<DATA_WIDTH ; i=i+1)
            begin
                RX_IN_TB = frame[i];
                #UART_TX_CLK_PERIOD;
            end
        RX_IN_TB = ^frame;
        #UART_TX_CLK_PERIOD
        RX_IN_TB = 1;
        #UART_TX_CLK_PERIOD

        //data frame
        RX_IN_TB = 1'b0;
        frame = Data;
        #UART_TX_CLK_PERIOD
        for (i=0 ; i<DATA_WIDTH ; i=i+1)
            begin
                RX_IN_TB = frame[i];
                #UART_TX_CLK_PERIOD;
            end
        RX_IN_TB = ^frame;
        #UART_TX_CLK_PERIOD
        RX_IN_TB = 1;
        #UART_TX_CLK_PERIOD
        #UART_TX_CLK_PERIOD;
    end
endtask

//RD OP task
task Rd_OP;
    integer j;
    input [DATA_WIDTH-1:0]  Rd_Address;
    
    begin
        //Command frame
        frame = 'hBB;
        RX_IN_TB = 1'b0;
        #UART_TX_CLK_PERIOD
        for (j=0 ; j<DATA_WIDTH ; j=j+1)
            begin
                RX_IN_TB = frame[j];
                #UART_TX_CLK_PERIOD;
            end
        RX_IN_TB = ^frame;
        #UART_TX_CLK_PERIOD
        RX_IN_TB = 1;
        #UART_TX_CLK_PERIOD
        
        //address frame
        frame = Rd_Address;
        RX_IN_TB = 1'b0;
        #UART_TX_CLK_PERIOD
        for (j=0 ; j<DATA_WIDTH ; j=j+1)
            begin
                RX_IN_TB = frame[j];
                #UART_TX_CLK_PERIOD;
            end
        RX_IN_TB = ^frame;
        #UART_TX_CLK_PERIOD
        RX_IN_TB = 1;
        #UART_TX_CLK_PERIOD
        @(negedge TX_OUT_TB)
        #UART_TX_CLK_PERIOD
        for(j=0 ;j<DATA_WIDTH+3; j=j+1)
            begin
                TX_OUT_DETECT[j] = TX_OUT_TB;
                #UART_TX_CLK_PERIOD;
            end
        if(TX_OUT_DETECT == {1'b1, ^data, data, 1'b0})
            begin
                $display ("Wr Op and Rd Op succeed TX_OUT = %b", TX_OUT_DETECT);
            end
        else
            begin
                $display ("Wr Op and Rd Op failed TX_OUT = %b", TX_OUT_DETECT);
            end

    end
endtask


task ALU_WITH_OPERANT;
integer k;
input   [DATA_WIDTH-1:0]    A,B,FUN;
    begin
        //Command frame
        frame = 'hCC;
        RX_IN_TB = 1'b0;
        #UART_TX_CLK_PERIOD
        for (k=0 ; k<DATA_WIDTH ; k=k+1)
            begin
                RX_IN_TB = frame[k];
                #UART_TX_CLK_PERIOD;
            end
        RX_IN_TB = ^frame;
        #UART_TX_CLK_PERIOD
        RX_IN_TB = 1;
        #UART_TX_CLK_PERIOD

        //A Frame
        frame = A;
        RX_IN_TB = 1'b0;
        #UART_TX_CLK_PERIOD
        for (k=0 ; k<DATA_WIDTH ; k=k+1)
            begin
                RX_IN_TB = frame[k];
                #UART_TX_CLK_PERIOD;
            end
        RX_IN_TB = ^frame;
        #UART_TX_CLK_PERIOD
        RX_IN_TB = 1;
        #UART_TX_CLK_PERIOD

        //B frame
        frame = B;
        RX_IN_TB = 1'b0;
        #UART_TX_CLK_PERIOD
        for (k=0 ; k<DATA_WIDTH ; k=k+1)
            begin
                RX_IN_TB = frame[k];
                #UART_TX_CLK_PERIOD;
            end
        RX_IN_TB = ^frame;
        #UART_TX_CLK_PERIOD
        RX_IN_TB = 1;
        #UART_TX_CLK_PERIOD

        //FUNCTION frame
        frame = FUN;
        RX_IN_TB = 1'b0;
        #UART_TX_CLK_PERIOD
        for (k=0 ; k<DATA_WIDTH ; k=k+1)
            begin
                RX_IN_TB = frame[k];
                #UART_TX_CLK_PERIOD;
            end
        RX_IN_TB = ^frame;
        #UART_TX_CLK_PERIOD
        RX_IN_TB = 1;
        #UART_TX_CLK_PERIOD

        @(negedge TX_OUT_TB)
        #UART_TX_CLK_PERIOD
        for(k=0 ;k<DATA_WIDTH+3; k=k+1)
            begin
                TX_OUT_DETECT[k] = TX_OUT_TB;
                #UART_TX_CLK_PERIOD;
            end

        ALU_OUT_DETECT[DATA_WIDTH-1:0] = TX_OUT_DETECT [DATA_WIDTH:1];

        @(negedge TX_OUT_TB)
        #UART_TX_CLK_PERIOD
        for(k=0 ;k<DATA_WIDTH+3; k=k+1)
            begin
                TX_OUT_DETECT[k] = TX_OUT_TB;
                #UART_TX_CLK_PERIOD;
            end

        ALU_OUT_DETECT[ALU_OUT_WIDTH-1:DATA_WIDTH] = TX_OUT_DETECT [DATA_WIDTH:1];

        if(ALU_OUT_DETECT == EXPECTED)
            begin
                $display ("ALU_WITH_OP Op succeed:");
                $display ("A = %d B = %d FUN = %b  TX_OUT = %d",A,B,FUN, ALU_OUT_DETECT);
            end
        else
            begin
                $display ("ALU_WITH_OP Op failed" );
                $display ("A = %d B = %d FUN = %b  TX_OUT = %d",A,B,FUN, ALU_OUT_DETECT);
            end


    end
endtask


task ALU_NO_OPERANT;
integer l;
input   [3:0]    fun;
    begin
        //Command frame
        frame = 'hDD;
        RX_IN_TB = 1'b0;
        #UART_TX_CLK_PERIOD
        for (l=0 ; l<DATA_WIDTH ; l=l+1)
            begin
                RX_IN_TB = frame[l];
                #UART_TX_CLK_PERIOD;
            end
        RX_IN_TB = ^frame;
        #UART_TX_CLK_PERIOD
        RX_IN_TB = 1;
        #UART_TX_CLK_PERIOD

        //FUNCTION frame
        frame = fun;
        RX_IN_TB = 1'b0;
        #UART_TX_CLK_PERIOD
        for (l=0 ; l<DATA_WIDTH ; l=l+1)
            begin
                RX_IN_TB = frame[l];
                #UART_TX_CLK_PERIOD;
            end
        RX_IN_TB = ^frame;
        #UART_TX_CLK_PERIOD
        RX_IN_TB = 1;
        #UART_TX_CLK_PERIOD

        @(negedge TX_OUT_TB)
        #UART_TX_CLK_PERIOD
        for(l=0 ;l<DATA_WIDTH+3; l=l+1)
            begin
                TX_OUT_DETECT[l] = TX_OUT_TB;
                #UART_TX_CLK_PERIOD;
            end

        ALU_OUT_DETECT[DATA_WIDTH-1:0] = TX_OUT_DETECT [DATA_WIDTH:1];

        @(negedge TX_OUT_TB)
        #UART_TX_CLK_PERIOD
        for(l=0 ;l<DATA_WIDTH+3; l=l+1)
            begin
                TX_OUT_DETECT[l] = TX_OUT_TB;
                #UART_TX_CLK_PERIOD;
            end

        ALU_OUT_DETECT[ALU_OUT_WIDTH-1:DATA_WIDTH] = TX_OUT_DETECT [DATA_WIDTH:1];

        if(ALU_OUT_DETECT == EXPECTED)
            begin
                $display ("ALU_NO_OP Op succeed:");
                $display ("A = %d B = %d FUN = %b  TX_OUT = %d",A_OP,B_OP,fun, ALU_OUT_DETECT);
            end
        else
            begin
                $display ("ALU_NO_OP Op failed" );
                $display ("A = %d B = %d FUN = %b  TX_OUT = %d",A_OP,B_OP,fun, ALU_OUT_DETECT);
            end


    end
endtask





/////////////////////CLKS GEN////////////////////////
//REF_CLK
always #REF_CLK_HALF_PERIOD REF_CLK_TB = !REF_CLK_TB;

//UART_CLK
always #UART_RX_CLK_HALF_PERIOD UART_CLK_TB = !UART_CLK_TB;






///////////////////Intantiation////////////////////////
SYS_TOP #(  .DATA_WIDTH(DATA_WIDTH),
            .ALU_OUT_WIDTH(ALU_OUT_WIDTH),
            .DEPTH(DEPTH),
            .ADDR(ADDR),
            .NUM_STAGES_RST(NUM_STAGES_RST),
            .NUM_STAGES_DATA(NUM_STAGES_DATA)
        )
SYS_TOP_DUT
(
.REF_CLK(REF_CLK_TB),
.UART_CLK(UART_CLK_TB),
.RST_N(RST_TB),
.UART_RX_IN(RX_IN_TB),
.UART_TX_O(TX_OUT_TB),
.parity_error(parity_error_TB),
.framing_error(framing_error_TB)
);


endmodule