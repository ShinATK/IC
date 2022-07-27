class master_agent extends uvm_agent;
    `uvm_component_utils(master_agent)

    my_sequencer    m_seqr;
    my_driver       m_driv;
    my_monitor      m_moni;

    function new(string name="", uvm_component parent);
        super.new(name, parent);
    endfunction

    // build_phase()——sequencer、driver和monitor对象会在这里创建
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (is_active == UVM_ACTIVE) begin
            /* UVM的factory机制创建对象 */
            // 格式：
            // 类型名 + 静态成员 + type id + 静态成员type id的create(对象名，该对象的副对象)
            // this表示当前副对象为当前的agent
            m_seqr = my_sequencer :: type_id :: create("m_seqr", this);
            m_driv = my_driver :: type_id :: creat("m_driv", this);
        end
        m_moni = my_monitor :: type_id :: creat("m_moni"m  this);
    endfunction

    /* connect_phase()--将driver的seq_item_port 和 sequencer 的 seq_item_export 连接 */
    // 以实现它们之间的transaction级通信，在build_phase之后执行
    virtual function void connect_phase(m_seqr.seq_item_export);
        if (is_active == UVM_ACTIVE)
            m_driv.seq_item_port.connect(m_seqr.seq_item_export);
    endfunction
endclass