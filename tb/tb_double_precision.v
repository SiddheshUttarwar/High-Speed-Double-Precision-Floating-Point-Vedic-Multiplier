`timescale 1ns / 1ps

module tb_double_precision;
  reg  [63:0] a;
  reg  [63:0] b;
  wire [63:0] mul;

  integer errors;

  double_precision dut (
    .mul(mul),
    .a(a),
    .b(b)
  );

  task run_case;
    input integer id;
    input [63:0] in_a;
    input [63:0] in_b;
    input [63:0] expected;
    begin
      a = in_a;
      b = in_b;
      #1;
      if (mul !== expected) begin
        $display("FAIL case %0d: A=0x%016h B=0x%016h DUT=0x%016h EXP=0x%016h",
                 id, in_a, in_b, mul, expected);
        errors = errors + 1;
      end else begin
        $display("PASS case %0d: A=0x%016h B=0x%016h OUT=0x%016h",
                 id, in_a, in_b, mul);
      end
    end
  endtask

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb_double_precision);

    errors = 0;
    a = 64'd0;
    b = 64'd0;
    #1;

    // Directed normalized IEEE-754 test vectors.
    run_case(1,  64'h3FF0_0000_0000_0000, 64'h3FF0_0000_0000_0000, 64'h3FF0_0000_0000_0000); // 1.0 * 1.0
    run_case(2,  64'h3FF8_0000_0000_0000, 64'h4004_0000_0000_0000, 64'h400E_0000_0000_0000); // 1.5 * 2.5
    run_case(3,  64'h4000_0000_0000_0000, 64'h4010_0000_0000_0000, 64'h4020_0000_0000_0000); // 2.0 * 4.0
    run_case(4,  64'h4008_0000_0000_0000, 64'h4014_0000_0000_0000, 64'h402E_0000_0000_0000); // 3.0 * 5.0
    run_case(5,  64'h3FE0_0000_0000_0000, 64'h3FE0_0000_0000_0000, 64'h3FD0_0000_0000_0000); // 0.5 * 0.5
    run_case(6,  64'h3FF4_0000_0000_0000, 64'h3FF4_0000_0000_0000, 64'h3FF9_0000_0000_0000); // 1.25 * 1.25
    run_case(7,  64'h4024_0000_0000_0000, 64'h3FE8_0000_0000_0000, 64'h401E_0000_0000_0000); // 10.0 * 0.75
    run_case(8,  64'h405E_E000_0000_0000, 64'h4000_0000_0000_0000, 64'h406E_E000_0000_0000); // 123.5 * 2.0
    run_case(9,  64'hBFF0_0000_0000_0000, 64'h4000_0000_0000_0000, 64'hC000_0000_0000_0000); // -1.0 * 2.0
    run_case(10, 64'hC00C_0000_0000_0000, 64'hC000_0000_0000_0000, 64'h401C_0000_0000_0000); // -3.5 * -2.0
    run_case(11, 64'hC019_0000_0000_0000, 64'h3FE0_0000_0000_0000, 64'hC009_0000_0000_0000); // -6.25 * 0.5

    if (errors == 0) begin
      $display("PASS: all directed floating-point vectors matched.");
    end else begin
      $display("FAIL: %0d directed vector mismatches found.", errors);
    end

    $finish;
  end
endmodule
