################################################################################
#This is an internally genertaed by spyglass to populate Waiver Info for Reports
#Note:Spyglass does not support any perl routine like "spyDecompileWaiverInfo"
#     The routine is purely for internal usage of spyglass
################################################################################


use SpyGlass;

spyClearWaiverHashInPerl(0);

spyComputeWaivedViolCount("totalWaivedViolationCount"=>'6',
                          "totalGeneratedCount"=>'8',
                          "totalReportCount"=>'2'
                         );

spyDecompileWaiverInfo("waive_cmd_id"=>'1',
                       "waiverCmd"=>'q%waive  -du "CLK_GATE" -rule "InferLatch" -msg "Latch inferred for signal \'Latch_Out\' in module \'CLK_GATE\'" -comment "Created by ICer on 06-Oct-2026 20:00:53 This is intented latch used in CLK GATE"%',
                       "-du"=>'"CLK_GATE"',
                       "-rule"=>'"InferLatch"',
                       "-msg"=>'q%Latch inferred for signal \'Latch_Out\' in module \'CLK_GATE\'%',
                       "-comment"=>'"Created by ICer on 06-Oct-2026 20:00:53 This is intented latch used in CLK GATE"',
                       "violations_waived"=>'10',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1/lint/lint_rtl/spyglass-1_waiver_file.awl"',
                       "waiverline"=>'1'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'2',
                       "waiverCmd"=>'q%waive  -rule "STARC05-1.4.3.4" -msg "Clock signal \'SYS_TOP.CLK_TX_TOP.O_div_clk_reg\' used as a non-clock (Used with name \'SYS_TOP.CLK_TX_TOP.O_div_clk_reg\')" -comment "Created by ICer on 06-Oct-2026 20:01:36"%',
                       "-rule"=>'q%STARC05-1.4.3.4%',
                       "-msg"=>'q%Clock signal \'SYS_TOP.CLK_TX_TOP.O_div_clk_reg\' used as a non-clock (Used with name \'SYS_TOP.CLK_TX_TOP.O_div_clk_reg\')%',
                       "-comment"=>'"Created by ICer on 06-Oct-2026 20:01:36"',
                       "violations_waived"=>'11',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1/lint/lint_rtl/spyglass-1_waiver_file.awl"',
                       "waiverline"=>'2'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'3',
                       "waiverCmd"=>'q%waive  -rule "STARC05-1.4.3.4" -msg "Clock signal \'SYS_TOP.CLK_RX_TOP.O_div_clk_reg\' used as a non-clock (Used with name \'SYS_TOP.CLK_RX_TOP.O_div_clk_reg\')" -comment "Created by ICer on 06-Oct-2026 20:01:36 this is the mux of the clk_div conected directly to the clock of the RX and TX clocks but this will be stable all time so no glitches will occur"%',
                       "-rule"=>'q%STARC05-1.4.3.4%',
                       "-msg"=>'q%Clock signal \'SYS_TOP.CLK_RX_TOP.O_div_clk_reg\' used as a non-clock (Used with name \'SYS_TOP.CLK_RX_TOP.O_div_clk_reg\')%',
                       "-comment"=>'"Created by ICer on 06-Oct-2026 20:01:36 this is the mux of the clk_div conected directly to the clock of the RX and TX clocks but this will be stable all time so no glitches will occur"',
                       "violations_waived"=>'12',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1/lint/lint_rtl/spyglass-1_waiver_file.awl"',
                       "waiverline"=>'4'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'4',
                       "waiverCmd"=>'q%waive  -du "data_sampling" -rule "W362" -msg "For operator (==), left expression: \\"edge_count\\" width 6 should match right expression: \\"half_edges_n1\\" width 5 [Hierarchy: \':SYS_TOP:UART_TOP@UART:U0_UART_RX@UART_RX:U0_data_sampling@data_sampling\']" -comment "Created by ICer on 06-Oct-2026 20:03:14"%',
                       "-du"=>'"data_sampling"',
                       "-rule"=>'"W362"',
                       "-msg"=>'q%For operator (==), left expression: "edge_count" width 6 should match right expression: "half_edges_n1" width 5 [Hierarchy: \':SYS_TOP:UART_TOP@UART:U0_UART_RX@UART_RX:U0_data_sampling@data_sampling\']%',
                       "-comment"=>'"Created by ICer on 06-Oct-2026 20:03:14"',
                       "violations_waived"=>'4',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1/lint/lint_rtl/spyglass-1_waiver_file.awl"',
                       "waiverline"=>'5'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'5',
                       "waiverCmd"=>'q%waive  -du "data_sampling" -rule "W362" -msg "For operator (==), left expression: \\"edge_count\\" width 6 should match right expression: \\"half_edges\\" width 5 [Hierarchy: \':SYS_TOP:UART_TOP@UART:U0_UART_RX@UART_RX:U0_data_sampling@data_sampling\']" -comment "Created by ICer on 06-Oct-2026 20:03:14"%',
                       "-du"=>'"data_sampling"',
                       "-rule"=>'"W362"',
                       "-msg"=>'q%For operator (==), left expression: "edge_count" width 6 should match right expression: "half_edges" width 5 [Hierarchy: \':SYS_TOP:UART_TOP@UART:U0_UART_RX@UART_RX:U0_data_sampling@data_sampling\']%',
                       "-comment"=>'"Created by ICer on 06-Oct-2026 20:03:14"',
                       "violations_waived"=>'5',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1/lint/lint_rtl/spyglass-1_waiver_file.awl"',
                       "waiverline"=>'6'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'6',
                       "waiverCmd"=>'q%waive  -du "data_sampling" -rule "W362" -msg "For operator (==), left expression: \\"edge_count\\" width 6 should match right expression: \\"half_edges_p1\\" width 5 [Hierarchy: \':SYS_TOP:UART_TOP@UART:U0_UART_RX@UART_RX:U0_data_sampling@data_sampling\']" -comment "Created by ICer on 06-Oct-2026 20:03:14 "%',
                       "-du"=>'"data_sampling"',
                       "-rule"=>'"W362"',
                       "-msg"=>'q%For operator (==), left expression: "edge_count" width 6 should match right expression: "half_edges_p1" width 5 [Hierarchy: \':SYS_TOP:UART_TOP@UART:U0_UART_RX@UART_RX:U0_data_sampling@data_sampling\']%',
                       "-comment"=>'"Created by ICer on 06-Oct-2026 20:03:14 "',
                       "violations_waived"=>'6',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1/lint/lint_rtl/spyglass-1_waiver_file.awl"',
                       "waiverline"=>'8'
                      );

spyWaiversDataCount("totalWaivers"=>'6',
"totalWaiversApplied"=>'6',
"totalWaiversWithRegExp"=>'0',
"totalWaiversWithRuleSpecified"=>'6',
"totalWaiversWithIpSpecified"=>'0',
"totalWaiversWithFileLine"=>'0',
                         );

spyProhibitWaiverRules(                         );

spySetWaivedViolationNumberHash("");

1;
