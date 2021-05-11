%Here is one example that test the result of high_voltage network result
mpc = case9;
node_test = [5,7,9];

for loop = 1 : length(node_test)
    exact = Binary_exact_lambda(mpc,node_test(loop))
    exact_high = Binary_exact_lambda(high_vol(mpc),node_test(loop))
    predict_high = Binary_high_lambda(high_vol(mpc),node_test(loop))
    error_high = abs(exact_high - predict_high)/exact_high
    error = abs(exact - predict_high)/exact
end