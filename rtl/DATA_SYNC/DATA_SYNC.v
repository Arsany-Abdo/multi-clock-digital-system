module DATA_SYNC #(parameter BUS_WIDTH = 8, 
                             NUM_STAGES = 2
) 
(

input   wire    [BUS_WIDTH-1:0] Unsync_bus,
input   wire                    bus_enable,
input   wire                    CLK,
input   wire                    RST,
output  reg     [BUS_WIDTH-1:0] sync_bus,
output  reg                     enable_pusle
);


////////////////Internal Signals/////////////////////
reg [NUM_STAGES-1:0]    sync_ff;

reg                     pulse_ff;

wire                    enable_pusle_comb;



/////////////Shifting Bus Enable Always Block////////////////
always @(posedge CLK or negedge RST)
    begin
        if(!RST)
            begin
                sync_ff <= 0;
                pulse_ff <= 0;
            end
        
        else
            begin
                {sync_ff, pulse_ff} <= {bus_enable, sync_ff};
            end
    end

////////////Pulse Gen//////////////
assign  enable_pusle_comb = !pulse_ff && sync_ff[0];


////////////////Enable Pulse Registeration/////////////////
always @(posedge CLK or negedge RST)
    begin
        if (!RST)
            begin
                enable_pusle <= 0;
            end
        
        else    
            begin
                enable_pusle <= enable_pusle_comb;
            end
    end

//////////////Data Synchronization Always Block//////////////////////
always @(posedge CLK or negedge RST)
    begin
        if(!RST)
            begin
                sync_bus <= 0;
            end
        
        else if(enable_pusle_comb)
            begin
                sync_bus <= Unsync_bus;
            end
        
    end

endmodule
