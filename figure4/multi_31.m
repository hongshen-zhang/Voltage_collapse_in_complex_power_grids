function [mpc_load] = multi_31(mpc)

mpc_load = mpc;

%part 1
num_for_load = length(mpc.bus(:,1));
for loop = 1 : num_for_load
    mpc_load.bus(loop,3) =  mpc_load.bus(loop,3) * 0.7; 
    mpc_load.bus(loop,4) = mpc_load.bus(loop,4) * 3.1;
    mpc_load.bus(loop,10) = 345;
end

%part 2
num_for_gen = length(mpc.gen(:,1));

for loop = 1 : num_for_gen
    mpc_load.gen(loop,2) =  mpc_load.gen(loop,2) * 0.7;
    mpc_load.gen(loop,3) = mpc_load.bus(loop,3) * 3.1;
end


end