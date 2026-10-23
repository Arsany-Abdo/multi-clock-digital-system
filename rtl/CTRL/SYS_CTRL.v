module SYS_CTRL #(parameter DATA_WIDTH = 8,
                            ADDR = 4,
                            ALU_OUT_WIDTH = DATA_WIDTH * 2

)
(
input   wire                            CLK,
input   wire                            RST,
//ALU
input   wire    [ALU_OUT_WIDTH-1:0]     ALU_OUT,
input   wire                            OUT_VALID,
output  reg     [3:0]                   ALU_FUN,
output  reg                             ALU_EN,
//CLKGATE
output  reg                             CLKG_EN,
//REGFILE
output  reg     [ADDR-1:0]              Address,
output  reg                             WrEn,
output  reg                             RdEn,
output  reg     [DATA_WIDTH-1:0]        WrData,
input   wire    [DATA_WIDTH-1:0]        RdData,
input   wire                            RdData_Valid,
//UART
input   wire    [DATA_WIDTH-1:0]        RX_P_DATA,
input   wire                            RX_D_VLD,
//FIFO
output  reg     [DATA_WIDTH-1:0]        FIFO_P_DATA,
output  reg                             WR_INC,
input   wire                            FIFO_FULL,
//CLKDIV
output  reg                             clk_div_en
);


////////////////STATE ENCODING////////////////
localparam  IDLE = 4'b0000,
            WR_OP = 4'b0001,
            DATA_WAIT = 4'b0010,
            WR_DATA = 4'b0011,
            RD_OP = 4'b0100,
            RD_ADDR = 4'b0101,
            WR_FIFO = 4'b0110,
            ALU_WITH_OP = 4'b0111,
            OPERAND_A = 4'b1000,
            OPERAND_B = 4'b1001,
            ALU_FUN_OP = 4'b1010,
            ALU_TO_FIFO_FIRST = 4'b1011,
            ALU_TO_FIFO_SECOND = 4'b1100,
            ALU_NO_OP = 4'b1101;








//////////////////internal signals ////////////////////////////
//WR_OP
reg             store;
reg [ADDR-1:0]  Address_reg;


reg [3:0]       current_state, next_state;




////////////////Current State Incriment /////////////////////////////
always @(posedge CLK or negedge RST)
    begin
        if(!RST)
            begin
                current_state <= IDLE;
            end
        else
            begin
                current_state <= next_state;
            end
    end


///////////////Next state and output logic/////////////
always @(*)
    begin
        clk_div_en = 1'b1;
        case (current_state)
            IDLE:   begin
                        //output logic 
                        ALU_FUN     = 4'b0;
                        ALU_EN      = 1'b0;
                        CLKG_EN      = 1'b0;
                        Address     =  'b0100;
                        WrEn        = 1'b0;
                        RdEn        = 1'b0;
                        WrData      =  'b0;
                        FIFO_P_DATA =  'b0;
                        WR_INC      = 1'b0;
                        store       = 1'b0;

                        //next state logic
                        if (RX_D_VLD)
                            begin
                                case (RX_P_DATA)
                                    'hAA:   begin
                                                next_state = WR_OP;
                                            end
                                    'hBB:   begin
                                                next_state = RD_OP;
                                            end
                                    'hCC:   begin
                                                next_state = ALU_WITH_OP;
                                            end
                                    'hDD:    begin
                                                next_state = ALU_NO_OP;
                                            end
                                    default begin
                                                next_state = IDLE;
                                            end
                                endcase
                            end
                        else 
                            begin
                                next_state = IDLE;
                            end
                    end

            WR_OP:  begin
                        //output logic 
                        ALU_FUN     = 4'b0;
                        ALU_EN      = 1'b0;
                        CLKG_EN      = 1'b0;
                        Address     = 'b0100;
                        WrEn        = 1'b0;
                        RdEn        = 1'b0;
                        WrData      =  'b0;
                        FIFO_P_DATA =  'b0;
                        WR_INC      = 1'b0;
                        store       = 1'b1;

                        //next state logic
                        if(RX_D_VLD)
                            begin
                                next_state = DATA_WAIT;
                            end
                        else
                            begin
                                next_state = WR_OP;
                            end
                    end
            
            DATA_WAIT:  begin
                            //output logic 
                            ALU_FUN     = 4'b0;
                            ALU_EN      = 1'b0;
                            CLKG_EN      = 1'b0;
                            Address     = Address_reg;
                            WrEn        = 1'b0;
                            RdEn        = 1'b0;
                            WrData      =  'b0;
                            FIFO_P_DATA =  'b0;
                            WR_INC      = 1'b0;
                            store       = 1'b0;

                            //next state logic
                        if(RX_D_VLD)
                            begin
                                next_state = WR_DATA;
                            end
                        else
                            begin
                                next_state = DATA_WAIT;
                            end

                        end

            WR_DATA:    begin
                            //output logic 
                            ALU_FUN     = 4'b0;
                            ALU_EN      = 1'b0;
                            CLKG_EN      = 1'b0;
                            Address     =  Address_reg;
                            WrEn        = 1'b1;
                            RdEn        = 1'b0;
                            WrData      = RX_P_DATA;
                            FIFO_P_DATA =  'b0;
                            WR_INC      = 1'b0;
                            store       = 1'b0;

                            //next state logic
                            next_state = IDLE;
                        end
            
            RD_OP:  begin
                        //output logic 
                        ALU_FUN     = 4'b0;
                        ALU_EN      = 1'b0;
                        CLKG_EN      = 1'b0;
                        Address     =  'b0100;
                        WrEn        = 1'b0;
                        RdEn        = 1'b0;
                        WrData      =  'b0;
                        FIFO_P_DATA =  'b0;
                        WR_INC      = 1'b0;
                        store       = 1'b0;

                        //next state logic
                        if (RX_D_VLD)
                            begin
                                next_state = RD_ADDR;
                            end
                        else
                            begin
                                next_state = RD_OP;
                            end
                    end

            RD_ADDR:    begin
                            //output logic 
                            ALU_FUN     = 4'b0;
                            ALU_EN      = 1'b0;
                            CLKG_EN      = 1'b0;
                            Address     =  RX_P_DATA[ADDR-1:0];
                            WrEn        = 1'b0;
                            RdEn        = 1'b1;
                            WrData      =  'b0;
                            FIFO_P_DATA =  'b0;
                            WR_INC      = 1'b0;
                            store       = 1'b0;

                            //next state logic
                            if (RdData_Valid)
                                begin
                                    next_state = WR_FIFO;
                                end
                            else
                                begin
                                    next_state = RD_ADDR;
                                end
                        end

            WR_FIFO:    begin
                            //output logic 
                            ALU_FUN     = 4'b0;
                            ALU_EN      = 1'b0;
                            CLKG_EN      = 1'b0;
                            Address     =  RX_P_DATA[ADDR-1:0];
                            WrEn        = 1'b0;
                            RdEn        = 1'b1;
                            WrData      =  'b0;                            
                            store       = 1'b0;
                            if(FIFO_FULL)
                                begin
                                    FIFO_P_DATA = 'b0;
                                    WR_INC      = 1'b0;
                                end
                            else
                                begin
                                    FIFO_P_DATA = RdData;
                                    WR_INC      = 1'b1;
                                end
                            
                            //next state logic
                            if (FIFO_FULL)
                                begin
                                    next_state = WR_FIFO;
                                end
                            else
                                begin
                                    next_state = IDLE;
                                end
                        end

            ALU_WITH_OP:    begin
                               //output logic 
                                ALU_FUN     = 4'b0;
                                ALU_EN      = 1'b0;
                                CLKG_EN      = 1'b0;
                                Address     =  'b0100;
                                WrEn        = 1'b0;
                                RdEn        = 1'b0;
                                WrData      =  'b0;
                                FIFO_P_DATA =  'b0;
                                WR_INC      = 1'b0;
                                store       = 1'b0;

                                //next state logic
                                if (RX_D_VLD)
                                    begin
                                        next_state = OPERAND_A;
                                    end
                                else
                                    begin
                                        next_state = ALU_WITH_OP;
                                    end
                            end

            OPERAND_A:  begin
                            //output logic 
                            ALU_FUN     = 4'b0;
                            ALU_EN      = 1'b0;
                            CLKG_EN      = 1'b0;
                            
                            WrEn        = 1'b1;
                            RdEn        = 1'b0;
                            WrData      =  RX_P_DATA;
                            FIFO_P_DATA =  'b0;
                            WR_INC      = 1'b0;
                            store       = 1'b0;

                            //next state logic
                            if(RX_D_VLD)
                                begin
                                    next_state = OPERAND_B;
                                    Address     =  'b1;
                                end 
                            else
                                begin
                                    next_state = OPERAND_A;
                                    Address     =  'b0;
                                end 
                        end

            OPERAND_B:  begin
                            //output logic 
                            ALU_FUN     = 4'b0;
                            ALU_EN      = 1'b0;
                            CLKG_EN      = 1'b0;
                            
                            WrEn        = 1'b1;
                            RdEn        = 1'b0;
                            WrData      =  RX_P_DATA;
                            FIFO_P_DATA =  'b0;
                            WR_INC      = 1'b0;
                            store       = 1'b0;

                            //next state logic
                            if(RX_D_VLD)
                                begin
                                    next_state = ALU_FUN_OP;
                                    Address     =  'b0100;
                                end
                            else
                                begin
                                    next_state = OPERAND_B;
                                    Address     =  'b0001;
                                end

                        end

            ALU_FUN_OP: begin
                            //output logic 
                            ALU_FUN     = RX_P_DATA;
                            ALU_EN      = 1'b1;
                            CLKG_EN      = 1'b1;
                            Address     =  'b0100;
                            WrEn        = 1'b0;
                            RdEn        = 1'b0;
                            WrData      =  'b0;
                            FIFO_P_DATA =  'b0;
                            WR_INC      = 1'b0;
                            store       = 1'b0;

                            //next state logic
                            if(OUT_VALID)
                                begin
                                    next_state = ALU_TO_FIFO_FIRST;
                                end
                            else    
                                begin
                                    next_state = ALU_FUN_OP;
                                end
                        
                        end

            ALU_TO_FIFO_FIRST:  begin
                                    //output logic 
                                    ALU_FUN     = RX_P_DATA;
                                    ALU_EN      = 1'b1;
                                    CLKG_EN      = 1'b1;
                                    Address     =  'b0100;
                                    WrEn        = 1'b0;
                                    RdEn        = 1'b0;
                                    WrData      =  'b0;
                                    store       = 1'b0;

                                    if (FIFO_FULL)
                                        begin
                                            FIFO_P_DATA =  'b0;
                                            WR_INC      = 1'b0;
                                        end
                                    else
                                        begin
                                            FIFO_P_DATA =  ALU_OUT[DATA_WIDTH-1:0];
                                            WR_INC      = 1'b1;
                                        end

                                    //next state logic
                                    if (FIFO_FULL)
                                        begin
                                            next_state = ALU_TO_FIFO_FIRST;
                                        end
                                    else
                                        begin
                                            next_state = ALU_TO_FIFO_SECOND;
                                        end
                                end

            ALU_TO_FIFO_SECOND:  begin
                                    //output logic 
                                    ALU_FUN     = RX_P_DATA;
                                    ALU_EN      = 1'b1;
                                    CLKG_EN      = 1'b1;
                                    Address     =  'b0100;
                                    WrEn        = 1'b0;
                                    RdEn        = 1'b0;
                                    WrData      =  'b0;
                                    store       = 1'b0;

                                    if (FIFO_FULL)
                                        begin
                                            FIFO_P_DATA =  'b0;
                                            WR_INC      = 1'b0;
                                        end
                                    else
                                        begin
                                            FIFO_P_DATA =  ALU_OUT[ALU_OUT_WIDTH-1:DATA_WIDTH];
                                            WR_INC      = 1'b1;
                                        end

                                    //next state logic
                                    if (FIFO_FULL)
                                        begin
                                            next_state = ALU_TO_FIFO_SECOND;
                                        end
                                    else
                                        begin
                                            next_state = IDLE;
                                        end
                                end

            ALU_NO_OP:  begin
                            //output logic 
                            ALU_FUN     = 4'b0;
                            ALU_EN      = 1'b0;
                            CLKG_EN      = 1'b0;
                            Address     =  'b0100;
                            WrEn        = 1'b0;
                            RdEn        = 1'b0;
                            WrData      =  'b0;
                            FIFO_P_DATA =  'b0;
                            WR_INC      = 1'b0;
                            store       = 1'b0;

                            //next state logic
                            if (RX_D_VLD)
                                begin
                                    next_state = ALU_FUN_OP;
                                end
                            else
                                begin
                                    next_state = ALU_NO_OP;
                                end
                        end

            default begin
                        //output logic 
                        ALU_FUN     = 4'b0;
                        ALU_EN      = 1'b0;
                        CLKG_EN      = 1'b0;
                        Address     =  'b0100;
                        WrEn        = 1'b0;
                        RdEn        = 1'b0;
                        WrData      =  'b0;
                        FIFO_P_DATA =  'b0;
                        WR_INC      = 1'b0;
                        store       = 1'b0;

                        //next state logic
                        if (RX_D_VLD)
                            begin
                                case (RX_P_DATA)
                                    'hAA:   begin
                                                next_state = WR_OP;
                                            end
                                    'hBB:   begin
                                                next_state = RD_OP;
                                            end
                                    'hCC:   begin
                                                next_state = ALU_WITH_OP;
                                            end
                                    'hDD:    begin
                                                next_state = ALU_NO_OP;
                                            end
                                    default begin
                                                next_state = IDLE;
                                            end
                                endcase
                            end
                        else 
                            begin
                                next_state = IDLE;
                            end
                    end


        endcase
    end

























////////////////Address Store//////////////////
always @(posedge CLK or negedge RST)
    begin
        if(!RST)
            begin
                Address_reg <= 'b0100;
            end
        else if(store && RX_D_VLD)
            begin
                Address_reg <= RX_P_DATA[ADDR-1:0];
            end
    end

endmodule
