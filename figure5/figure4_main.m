%Test for figure 3
clear all
clear
%casename = case9;
%casename = case9;
%casename = case14;
%casename = case24_ieee_rts;
%casename = case30;
casename = case39;
%casename = case57;
%casename = case118;
%casename = case300;

mpc = ext2int(casename);
mpopt = mpoption;
mpopt = mpoption(mpopt,'PF_DC',0,'OUT_ALL',0,'VERBOSE',0);
mpc_high = multi_88(mpc);

%[Ybus,B_LL,B_LG,V_load_star,Q_cirt,Q_load] = makeNeeds(mpc_lam);

multi_lam = 0:0.02:3.4;
for loop = 1 : length(multi_lam)
    mpc_lam = lambda_multi(mpc_high,multi_lam(loop));
    [Ybus,B_LL,B_LG,V_load_star,Q_cirt,Q_load] = makeNeeds(mpc_lam);
    delta_plot(loop)= max(abs(inv(Q_cirt) * (Q_load.')));
    delta_minus = (1 - sqrt(1-delta_plot(loop)))/2;
    theo(loop) = (1 - delta_minus);
    results = runpf(mpc_lam,mpopt);
    %lam_collapse = 1 / Delta - 1;
end

multi_lam_plus = 0:0.02:3.4;
for loop = 1 : length(multi_lam_plus)
    mpc_lam = lambda_multi(mpc_high,multi_lam_plus(loop));
    [Ybus,B_LL,B_LG,V_load_star,Q_cirt,Q_load] = makeNeeds(mpc_lam);
    results = runpf(mpc_lam,mpopt);
    point_cri = 12;
    real(loop) = results.bus(point_cri,8) / mpc.bus(point_cri,8);
    %lam_collapse = 1 / Delta - 1;
end


theo = theo / theo(1);
real = real / real(1);

figure(1)
plot([1:length(multi_lam)] / length(multi_lam_plus),theo,'r.',[1:length(multi_lam_plus)] / length(multi_lam_plus),real,'k',[1:length(multi_lam)] / length(multi_lam_plus),delta_plot,'b-');

