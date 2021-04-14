%Test for table 1
clear all
clear
casename = case9;
%casename = case14;
%casename = case24_ieee_rts;
%casename = case30;
%casename = case39;
%casename = case57;
%casename = case118;
%casename = case300;
%casename = case2383wp;

mpc = ext2int(casename);
mpopt = mpoption;
mpopt = mpoption(mpopt,'PF_DC',0,'OUT_ALL',0,'VERBOSE',0);
mpc_high = high_vol(mpc);
loop_time = 1000;

sum_exact = 0;
sum_predict = 0;
count_num = 0;
for loop = 1 : loop_time
    mpc_rnd = realization_rnd(mpc_high);
    results = runpf(mpc_rnd,mpopt);
    if results.success == 1
        count_num = count_num + 1;
        [Ybus,B_LL,B_LG,V_load_star,Q_cirt,Q_load] = makeNeeds(mpc_rnd);
        sum_exact = sum_exact + exactCal(results,mpc_rnd,V_load_star);
        delta = max(abs(inv(Q_cirt) *Q_load.'));
        sum_predict = sum_predict + (1 - sqrt(1 - delta))/2;
    end
end

exact = sum_exact / count_num
predict = sum_predict / count_num
accuracy = abs(exact - predict) / exact

