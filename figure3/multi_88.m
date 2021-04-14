function [mpc_load] = multi_88(mpc)

mpc_load = mpc;

%part 1
num_for_load = length(mpc.bus(:,1));
for loop = 1 : num_for_load
    mpc_load.bus(loop,3) = mpc_load.bus(loop,3) * 0.7; 
    mpc_load.bus(loop,10) = 345;
end

end