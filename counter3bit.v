module counter3bit (
    input wire clk,       // Clock input
    input wire reset,     // Active-high synchronous reset
    output reg [2:0] count // 3-bit counter output
);

always @(posedge clk) begin
    if (reset) begin
        count <= 3'b000; // Reset counter
    end else begin
        count <= count + 1; // Increment counter
    end
end

endmodule
