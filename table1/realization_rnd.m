function [mpc_rnd] = realization_rnd(mpc)

mpc_rnd = mpc;
count_P_im = 0;
count_Q_im = 0;

%part 1
num_for_load = length(mpc.bus(:,1));
rnd_load_num = round(0.3 * num_for_load);
load_rnd_index = 1:length(mpc.bus(:,1));
rnd_ind = randperm(numel(load_rnd_index));
choose_load_ind = load_rnd_index(rnd_ind(1:rnd_load_num));
mul_load_rnd = normrnd(0,0.5,[rnd_load_num,1]);


for loop = 1 : num_for_load
    [li,loc] = ismember(loop,choose_load_ind);
    if (li == 1)
        %mpc_rnd.bus(loop,3) = mpc_rnd.bus(loop,3) * (1+mul_load_rnd(loc));
        %count_P_im = count_P_im + mpc_rnd.bus(loop,3) * mul_load_rnd(loc);
        mpc_rnd.bus(loop,4) = mpc_rnd.bus(loop,4) * (1+mul_load_rnd(loc));
        count_Q_im = count_Q_im + mpc_rnd.bus(loop,4) * mul_load_rnd(loc);
    end
    %mpc_rnd.bus(loop,3) = 0;
    %mpc_rnd.bus(loop,4) = abs(mpc_rnd.bus(loop,4));
    %mpc_rnd.bus(loop,5) = 0;
    %mpc_rnd.bus(loop,6) = 0;
    %mpc_rnd.bus(loop,8) = 1;
    %mpc_rnd.bus(loop,9) = 0;
    %mpc_rnd.bus(loop,10) = 345;
    %mpc_rnd.bus(loop,9) = 0;
    %mpc_rnd.bus(loop,12) = 2;
    %mpc_rnd.bus(loop,13) = 0.1;
end

%part 2
num_for_gen = length(mpc.gen(:,1));
rnd_gen_num = round(0.3 * num_for_gen);
gen_rnd_index = 1:length(mpc.gen(:,1));
rnd_ind = randperm(numel(gen_rnd_index));
choose_gen_ind = gen_rnd_index(rnd_ind(1:rnd_gen_num));
mul_gen_rnd = normrnd(0,0.3,[rnd_gen_num,1]);

for loop = 1 : num_for_gen
    [li,loc] = ismember(loop,choose_gen_ind);
    if (li == 1)
        mpc_rnd.gen(loop,2) = mpc_rnd.gen(loop,2) * (1+mul_gen_rnd(loc));
        count_P_im = count_P_im - mpc_rnd.gen(loop,2) * mul_gen_rnd(loc);
    end
    %mpc_rnd.gen(loop,2) = 0;
    %mpc_rnd.gen(loop,4) = 300;
    %mpc_rnd.gen(loop,5) = -300;
    %mpc_rnd.gen(loop,10) = 10;
end

%part 3
P_uni = count_P_im / (num_for_gen - rnd_gen_num);
Q_uni = count_Q_im / (num_for_gen - rnd_gen_num);

for loop = 1 : num_for_gen
    [li,~] = ismember(loop,choose_gen_ind);
    if (li == 0)
        %mpc_rnd.gen(loop,2) = mpc_rnd.gen(loop,2) + P_uni;
        mpc_rnd.gen(loop,3) = mpc_rnd.gen(loop,3) + Q_uni;
    end
    %mpc_rnd.gen(loop,6) = 1.1;
end

%num_for_branch = length(mpc.branch(:,1));
%for loop = 1 : num_for_branch
%    mpc_rnd.branch(loop,5) = 0;
%    mpc_rnd.branch(loop,9) = 0;
%end

end