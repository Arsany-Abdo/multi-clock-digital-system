module RST_SYNC #(parameter NUM_STAGES = 2) (
input   wire    RST,
input   wire    CLK,
output  wire    SYNC_RST
);

//////////internal signals////////////
reg [NUM_STAGES-1:0]    rst_reg;


//////////////always block/////////////////
always @(posedge CLK or negedge RST)
    begin
        if(!RST)
            begin
                rst_reg <= 0;
            end

        else
            begin
                rst_reg <= {1'b1,rst_reg[NUM_STAGES-1:1]};
            end
    end


/////////output SYNC_RST//////////
assign  SYNC_RST = rst_reg [0];

endmodule
