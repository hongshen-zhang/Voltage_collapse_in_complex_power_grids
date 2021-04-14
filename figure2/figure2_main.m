%Recurrent figure 2
[Ybus_all,B_LL,B_LG,V_load_star,Q_cirt,Q_load] = makeNeeds(case57);

num = 50;
B = zeros(num);
G = zeros(num);
link = zeros(num);
for i_loop = 1 : 50
    for j_loop = 1 : 50
        if Q_cirt(i_loop,j_loop) ~= 0
            B(i_loop,j_loop) = 1;
        end
    end
end

modules = simple_spectral_partitioning(B,[50]);
list = modules{1};
list = flip(list)

for i_loop = 1 : 50
    for j_loop = 1 : 50
        G(i_loop,j_loop) = Q_cirt(list(i_loop),list(j_loop));
        link(i_loop,j_loop) = B(list(i_loop),list(j_loop));
    end
end

figure(1);
HA = heatmap(link);

HA.Colormap = parula(64);


figure(2)
HA = heatmap(abs(G));

HA.Colormap = parula(20);

figure(3)
HA = heatmap(abs(inv(G)));

HA.Colormap = parula(20);

