module clk_div #(parameter DATA_WIDTH = 8) (
input   wire                        I_ref_clk,
input   wire                        I_rst_n,
input   wire                        I_clk_en,
input   wire    [DATA_WIDTH-1:0]    I_div_ratio,
output  reg                         O_div_clk    
);


////////////Internal signals/////////////

reg     [DATA_WIDTH-2:0]    counter;
wire    [DATA_WIDTH-2:0]    half;
wire    [DATA_WIDTH-2:0]    halfp1;
wire                        odd;
reg                         flip;    //I will use this to decide in the odd ration the most of the cycle will be high or low
reg                         O_div_clk_reg;

/////////////////assign the internal signal/////////////////

assign  half = I_div_ratio >> 1;
assign  halfp1 = half + 1;
assign  odd = I_div_ratio[0];



/////////////always block/////////////
always@ (posedge I_ref_clk or negedge I_rst_n)
    begin
        if (!I_rst_n)
            begin
                counter <= 0;
                O_div_clk_reg <= 0;
                flip <= 1;
            end

        else if (I_clk_en && (I_div_ratio != 0) && (I_div_ratio != 1) )
            begin
            //even 
                if (!odd && counter == half)
                    begin
                        O_div_clk_reg <= !O_div_clk_reg;
                        counter <= 1;
                    end
            //odd    
                else if (odd && ((counter == half && flip) || (counter == halfp1  && !flip)))
                    begin
                        O_div_clk_reg <= !O_div_clk_reg;
                        counter <= 1;
                        flip <= !flip;  
                    end
                else
                    begin
                        counter <= counter + 1;
                    end    
            end
        
    end


always @(*)
    begin
        if(I_clk_en && (I_div_ratio != 0) && (I_div_ratio != 1))
            begin
                O_div_clk = O_div_clk_reg;
            end
        else
            begin
                O_div_clk = I_ref_clk;
            end
    end

endmodule

