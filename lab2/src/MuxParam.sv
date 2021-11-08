module MuxParam #(parameter type T = logic, parameter SEL = 2, INPUTS = 2**SEL )(Entry, Select, Sal);
input T Entry[INPUTS];
input [SEL-1:0] Select;
output T Sal;

assign Sal = Entry[Select];

endmodule