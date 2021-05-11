function [mpc_load] = high_vol(mpc)
mpc_load = mpc;
%part 1
mpc_load.bus(:,3) = 0;
%part 2
mpc_load.gen(:,2) = 0;
mpc_load.gen(:,9) = 0;
mpc_load.gen(:,10) = 0;
end