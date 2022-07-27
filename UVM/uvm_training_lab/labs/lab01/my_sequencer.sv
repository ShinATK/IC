typedef uvm_sequencer #(my_transaction) my_sequence;

//从uvm_sequencer扩展
// #(my_transaction)，参数化的类，
// 一般需要指定sequencer传递的transaction类型，
// 表示一种sequencer对应一种类型的transaction