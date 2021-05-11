function [result] = Binary_high_lambda(mpc,node)
%__________________________________________________________________________
%This part test the exact lambda for casename = mpc and node_index = node
%Use Binary_exact_lambda(case9,5) to start
%__________________________________________________________________________

iter = 50;
upper = 1000;
lower = 0;

for loop = 1 : iter
    test = (upper + lower) / 2;
    mpc_mul = multi_one_node(mpc,node,test);
    success = high_vol_test(mpc_mul);
    if success == 1
        lower = test;
    else 
        upper = test;
    end
end
result = (upper + lower) / 2;
end