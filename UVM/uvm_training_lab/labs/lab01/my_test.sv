class my_test extends uvm_test;
    `uvm_component_utils(my_test)
    my_env m_env;

    function new(string name="", uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        m_env = my_env :: type_id :: create("m_env", this);

        uvm_config_db#(uvm_object_wrapper) :: set(
            this, "*.m_seqr.run_phase",
            "default_sequence", my_sequence::get_type());
        // uvm_config机制配置agent sequencer的default_sequence
        // set,为指定的目标设置资源
        // 1.调用phase的位置；
        // 2.被配置变量的相对路径，*代表通配符；
        // 3.目标变量的标识符
        // 4.要启动的sequence的类型
    endfunction

    virtual function void start_of_simulation_phase(uvm_phase, phase);
        super.start_of_simulation_phase(phase);
        //print_topology，在start_of_simulation_phase中打印当前平台的结构
        uvm_top.print_topology(uvm_default_tree_printer);
    endfunction

endclass