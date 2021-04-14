function [delta] = exactCal(sol,mpc,V_load_star)
delta = 0;
which_load = 0;
for loop = 1 : length(mpc.bus(:,1))
    if mpc.bus(loop,2) == 1
        which_load = which_load + 1;
        delta_tem = abs((sol.bus(loop,8) - V_load_star(which_load))/V_load_star(which_load));
        if delta_tem > delta
            delta = delta_tem;
        end
    end
end
end
