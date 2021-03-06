module conv_pool_chan (
     input logic clk,
     input logic rst,
     input logic [127:0] image,
     input logic [71:0]  kernel,
    output logic signed [19:0] conv_out   [1:0][1:0]
);

logic signed [7 :0] kernel_mem  [2:0][2:0];
logic signed [8 :0] image_mem   [3:0][3:0];
logic signed [16:0] mult_0_0_ff [8:0];
logic signed [16:0] mult_0_1_ff [8:0];
logic signed [16:0] mult_1_0_ff [8:0];
logic signed [16:0] mult_1_1_ff [8:0];

assign kernel_mem[0][0] = kernel[7 :0 ];
assign kernel_mem[0][1] = kernel[15:8 ];
assign kernel_mem[0][2] = kernel[23:16];
assign kernel_mem[1][0] = kernel[31:24];
assign kernel_mem[1][1] = kernel[39:32];
assign kernel_mem[1][2] = kernel[47:40];
assign kernel_mem[2][0] = kernel[55:48];
assign kernel_mem[2][1] = kernel[63:56];
assign kernel_mem[2][2] = kernel[71:64];

assign image_mem[0][0] = {1'b0, image[7  :0  ]};
assign image_mem[0][1] = {1'b0, image[15 :8  ]};
assign image_mem[0][2] = {1'b0, image[23 :16 ]};
assign image_mem[0][3] = {1'b0, image[31 :24 ]};
assign image_mem[1][0] = {1'b0, image[39 :32 ]};
assign image_mem[1][1] = {1'b0, image[47 :40 ]};
assign image_mem[1][2] = {1'b0, image[55 :48 ]};
assign image_mem[1][3] = {1'b0, image[63 :56 ]};
assign image_mem[2][0] = {1'b0, image[71 :64 ]};
assign image_mem[2][1] = {1'b0, image[79 :72 ]};
assign image_mem[2][2] = {1'b0, image[87 :80 ]};
assign image_mem[2][3] = {1'b0, image[95 :88 ]};
assign image_mem[3][0] = {1'b0, image[103:96 ]};
assign image_mem[3][1] = {1'b0, image[111:104]};
assign image_mem[3][2] = {1'b0, image[119:112]};
assign image_mem[3][3] = {1'b0, image[127:120]};


always_ff @(posedge clk) begin
  if (~rst) begin
    mult_0_0_ff[0] <= 16'd0;
    mult_0_0_ff[1] <= 16'd0;
    mult_0_0_ff[2] <= 16'd0;
    mult_0_0_ff[3] <= 16'd0;
    mult_0_0_ff[4] <= 16'd0;
    mult_0_0_ff[5] <= 16'd0;
    mult_0_0_ff[6] <= 16'd0;
    mult_0_0_ff[7] <= 16'd0;
    mult_0_0_ff[8] <= 16'd0;

    mult_0_1_ff[0] <= 16'd0;
    mult_0_1_ff[1] <= 16'd0;
    mult_0_1_ff[2] <= 16'd0;
    mult_0_1_ff[3] <= 16'd0;
    mult_0_1_ff[4] <= 16'd0;
    mult_0_1_ff[5] <= 16'd0;
    mult_0_1_ff[6] <= 16'd0;
    mult_0_1_ff[7] <= 16'd0;
    mult_0_1_ff[8] <= 16'd0;

    mult_1_0_ff[0] <= 16'd0;
    mult_1_0_ff[1] <= 16'd0;
    mult_1_0_ff[2] <= 16'd0;
    mult_1_0_ff[3] <= 16'd0;
    mult_1_0_ff[4] <= 16'd0;
    mult_1_0_ff[5] <= 16'd0;
    mult_1_0_ff[6] <= 16'd0;
    mult_1_0_ff[7] <= 16'd0;
    mult_1_0_ff[8] <= 16'd0;
    
    mult_1_1_ff[0] <= 16'd0;
    mult_1_1_ff[1] <= 16'd0;
    mult_1_1_ff[2] <= 16'd0;
    mult_1_1_ff[3] <= 16'd0;
    mult_1_1_ff[4] <= 16'd0;
    mult_1_1_ff[5] <= 16'd0;
    mult_1_1_ff[6] <= 16'd0;
    mult_1_1_ff[7] <= 16'd0;
    mult_1_1_ff[8] <= 16'd0;
  end
  else begin
    mult_0_0_ff[0] <= image_mem[0][0] * kernel_mem[0][0];
    mult_0_0_ff[1] <= image_mem[0][1] * kernel_mem[0][1];
    mult_0_0_ff[2] <= image_mem[0][2] * kernel_mem[0][2];
    mult_0_0_ff[3] <= image_mem[1][0] * kernel_mem[1][0];
    mult_0_0_ff[4] <= image_mem[1][1] * kernel_mem[1][1];
    mult_0_0_ff[5] <= image_mem[1][2] * kernel_mem[1][2];
    mult_0_0_ff[6] <= image_mem[2][0] * kernel_mem[2][0];
    mult_0_0_ff[7] <= image_mem[2][1] * kernel_mem[2][1];
    mult_0_0_ff[8] <= image_mem[2][2] * kernel_mem[2][2];

    mult_0_1_ff[0] <= image_mem[0][1] * kernel_mem[0][0];
    mult_0_1_ff[1] <= image_mem[0][2] * kernel_mem[0][1];
    mult_0_1_ff[2] <= image_mem[0][3] * kernel_mem[0][2];
    mult_0_1_ff[3] <= image_mem[1][1] * kernel_mem[1][0];
    mult_0_1_ff[4] <= image_mem[1][2] * kernel_mem[1][1];
    mult_0_1_ff[5] <= image_mem[1][3] * kernel_mem[1][2];
    mult_0_1_ff[6] <= image_mem[2][1] * kernel_mem[2][0];
    mult_0_1_ff[7] <= image_mem[2][2] * kernel_mem[2][1];
    mult_0_1_ff[8] <= image_mem[2][3] * kernel_mem[2][2];

    mult_1_0_ff[0] <= image_mem[1][0] * kernel_mem[0][0];
    mult_1_0_ff[1] <= image_mem[1][1] * kernel_mem[0][1];
    mult_1_0_ff[2] <= image_mem[1][2] * kernel_mem[0][2];
    mult_1_0_ff[3] <= image_mem[2][0] * kernel_mem[1][0];
    mult_1_0_ff[4] <= image_mem[2][1] * kernel_mem[1][1];
    mult_1_0_ff[5] <= image_mem[2][2] * kernel_mem[1][2];
    mult_1_0_ff[6] <= image_mem[3][0] * kernel_mem[2][0];
    mult_1_0_ff[7] <= image_mem[3][1] * kernel_mem[2][1];
    mult_1_0_ff[8] <= image_mem[3][2] * kernel_mem[2][2];

    mult_1_1_ff[0] <= image_mem[1][1] * kernel_mem[0][0];
    mult_1_1_ff[1] <= image_mem[1][2] * kernel_mem[0][1];
    mult_1_1_ff[2] <= image_mem[1][3] * kernel_mem[0][2];
    mult_1_1_ff[3] <= image_mem[2][1] * kernel_mem[1][0];
    mult_1_1_ff[4] <= image_mem[2][2] * kernel_mem[1][1];
    mult_1_1_ff[5] <= image_mem[2][3] * kernel_mem[1][2];
    mult_1_1_ff[6] <= image_mem[3][1] * kernel_mem[2][0];
    mult_1_1_ff[7] <= image_mem[3][2] * kernel_mem[2][1];
    mult_1_1_ff[8] <= image_mem[3][3] * kernel_mem[2][2];
  end
end

assign conv_out[0][0] =  mult_0_0_ff[0] +  mult_0_0_ff[1] +  mult_0_0_ff[2] 
                      +  mult_0_0_ff[3] +  mult_0_0_ff[4] +  mult_0_0_ff[5] 
                      +  mult_0_0_ff[6] +  mult_0_0_ff[7] +  mult_0_0_ff[8];

assign conv_out[0][1] =  mult_0_1_ff[0] +  mult_0_1_ff[1] +  mult_0_1_ff[2] 
                      +  mult_0_1_ff[3] +  mult_0_1_ff[4] +  mult_0_1_ff[5] 
                      +  mult_0_1_ff[6] +  mult_0_1_ff[7] +  mult_0_1_ff[8];

assign conv_out[1][0] =  mult_1_0_ff[0] +  mult_1_0_ff[1] +  mult_1_0_ff[2] 
                      +  mult_1_0_ff[3] +  mult_1_0_ff[4] +  mult_1_0_ff[5] 
                      +  mult_1_0_ff[6] +  mult_1_0_ff[7] +  mult_1_0_ff[8];

assign conv_out[1][1] =  mult_1_1_ff[0] +  mult_1_1_ff[1] +  mult_1_1_ff[2] 
                      +  mult_1_1_ff[3] +  mult_1_1_ff[4] +  mult_1_1_ff[5] 
                      +  mult_1_1_ff[6] +  mult_1_1_ff[7] +  mult_1_1_ff[8];


endmodule



