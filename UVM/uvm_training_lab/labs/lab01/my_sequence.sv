// sequence 从uvm_sequence扩展
class my_sequence extends uvm_sequence #(my_transaction); //参数化的类，指定，该sequence所产生的transaction类型
    `uvm_object_utils(my_sequence)
    function new(string name = "my_sequence");
        super.new(name);
    endfunction
    /* body()任务是sequence中最重要的一个方法，作用是控制和产生transaction序列 */
    virtual task body();
        //控制平台何时结束
        if (starting_phase != null)
            starting_phase.raise_objection(this);
        //uvm_do，产生transaction，每调用一次产生一个transaction
        // req是指向产生的事务对象的指针
        repeat(10) begin
            `uvm_do(req)
        end
        #100;
        if (starting_phase != null)
            starting_phase.drop_objection(this);
    endtask
endclass