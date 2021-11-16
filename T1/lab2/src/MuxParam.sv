module MuxParam #(parameter type T = logic, parameter SEL = 2)(Entry, Select, Sal);
input T Entry[2**SEL];
input [SEL-1:0] Select;
output T Sal;

assign Sal = Entry[Select];

endmodule