module mux2x1 (

input   wire    I0,
input   wire    I1,
input   wire    SEL,
output  wire    Y
);

assign Y = SEL? I1 : I0;

endmodule