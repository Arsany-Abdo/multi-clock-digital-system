module RegFile #(parameter WIDTH = 8,
                            DEPTH = 16,
                            ADDR = 4

)
(
input   wire    [WIDTH-1:0] WrData,
input   wire    [ADDR-1:0]  Address,
input   wire                WrEn,
input   wire                RdEn,
input   wire                CLK,
input   wire                RST,
output  reg     [WIDTH-1:0] RdData,
output  reg                 RdData_VLD,
output   wire   [WIDTH-1:0] REG0,
output   wire   [WIDTH-1:0] REG1,
output   wire   [WIDTH-1:0] REG2,
output   wire   [WIDTH-1:0] REG3
);

//2D Array
reg [WIDTH-1:0] mem  [DEPTH-1:0];

integer i;

always @(posedge CLK or negedge RST)
    begin
        if (!RST)
            begin
                RdData_VLD <= 0;
                RdData <= 0;
                for (i=0 ; i<DEPTH ; i=i+1)
                    begin
                        if (i == 2)
                            begin
                                mem[i] <= 'b100000_01 ;  //UART_CONFIG
                            end
                        else if (i == 3)
                            begin
                                mem[i] <= 'b0010_0000 ;  //DIV_Ratio
                            end
                        else
                            begin
                                mem[i] <= 0;
                            end
                    end
            end
        else if (WrEn && !RdEn)
            begin
                mem [Address] <= WrData ;
            end 
        else if (!WrEn && RdEn)
            begin
                RdData <= mem [Address] ;
                RdData_VLD <= 1 ;
            end
        else
            begin
                RdData_VLD <= 0;
            end
    end


assign REG0 = mem[0] ;
assign REG1 = mem[1] ;
assign REG2 = mem[2] ;
assign REG3 = mem[3] ;


endmodule
