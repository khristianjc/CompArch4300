`timescale 1ns / 1ps
/*
Tests alu.v
*/
module alu_test;
    reg [31:0] a;
    reg [31:0] b;
    reg [2:0]  control;

    wire [31:0] result;
    wire        zero;

    alu uut (
        .a(a),
        .b(b),
        .control(control),
        .result(result),
        .zero(zero)
    );

    initial begin
        a <= 'b1010;  // 10
        b <= 'b0111;  // 7
        control <= 'b011;
        $display("A = %b\tB = %b", a, b);
        $monitor("ALUop = %b\t result = %b\t zero = %b", control, result, zero);

        #1  control <= 'b100;
        #1  control <= 'b010;
        #1  control <= 'b111;
        #1  control <= 'b011;
        #1  control <= 'b110;
        #1  control <= 'b001;
        #1  control <= 'b000; 

        #1
        $finish;
    end
endmodule
