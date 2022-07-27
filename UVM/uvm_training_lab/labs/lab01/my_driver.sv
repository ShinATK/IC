 class my_driver extends uvm_driver #(my_transaction);

    `uvm_component_utils(my_driver)

    // 实例化时，uvm_component parent，指定其父对象
    function new(string name = "my_driver", uvm_component parent);
        super.new(name, parent);
    endfunction

    // run_phase()是driver的主要方法，
    // driver在这个方法中完成从sequencer获取transaction、对transaction的分解和驱动DUT
    virtual task run_phase(uvm_phase phase);
        forever begin

            // 从sequencer中获取transaction，调用一次获取一个事务对象
            seq_item_port.get_next_item(req);
            // 将获取的transaction打印出来
            `uvm_info("DRV_RUN_PHASE", req.sprint(), UVM_MEDIUM)
            #100;
            // 通知sequencer该事务已经处理完毕
            seq_item_port.item_done();

        end
    endtask

endclass