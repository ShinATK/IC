// sv中，program可以用来启动仿真平台
program automatic test;
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    `include "my_transaction.sv"
    `include "my_sequence.sv"
    `include "my_sequencer.sv"
    `include "my_driver.sv"
    `include "my_monitor.sv"
    `include "my_agent.sv"
    `include "my_env.sv"
    `include "my_test.sv"

    initial begin
        run_test(); // 调用uVM的全局任务run_test()来启动UVM验证平台
    end

endprogram