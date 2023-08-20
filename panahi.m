%%% HW3 - BSS - Erfan Panahi 810198369
clc
clear

%% Problem 1.
s1 = unifrnd(-3,3,[1,1000]);
s2 = unifrnd(-2,2,[1,1000]);
s1 = s1 - mean(s1);
s2 = s2 - mean(s2);
fprintf("E(s1) = %f \nE(s2) = %f\n",mean(s1),mean(s2));
S = [s1;s2];
A = [1 -2;
     2 -1;
     3 -2];
X = A * S;
x1 = X(1,:);
x2 = X(2,:);
x3 = X(3,:);

%% Part a)
figure(1)
scatter3(x1,x2,x3);
title('3-D scatter plot of observations','Interpreter','latex');
xlabel('$x_1$','Interpreter','latex');
ylabel('$x_2$','Interpreter','latex');
zlabel('$x_3$','Interpreter','latex');
Rx = X * X';
[U ,D] = eig(Rx)

%% Part b)
DD = [D(1,1),D(2,2),D(3,3)];
DDsorted = sort(DD);
d1 = DDsorted(3);
d2 = DDsorted(2);
d3 = DDsorted(1);
i = find(DD == DDsorted);
u1 = U(:,i(3));
u2 = U(:,i(2));
u3 = U(:,i(1));
% A
u3TX = u3' * X;
var_u3X = var(u3TX)
% B
u3TA = u3' * A
% C
C = [u1 u2]\A

%% Part c)
B = ([d1 0 ; 0 d2])^(-1/2) * [u1 u2]'
Z = B * X;
Rz = Z * Z'
figure(2)
subplot(2,1,1);
plot(Z(1,:));
title('$z_1(t)$','Interpreter','latex');
xlabel('$z_1(t)$','Interpreter','latex');
ylabel('t','Interpreter','latex');
subplot(2,1,2);
plot(Z(2,:));
title('$z_2(t)$','Interpreter','latex');
xlabel('$z_2(t)$','Interpreter','latex');
ylabel('t','Interpreter','latex');

%% Part d)
[Q,G,V] = svd(X);
Q
U_ = [u1 u2 u3]
D_ = [d1 0 0;0 d2 0;0 0 d3];

%% Part e)
F = S * Z'

%% Part f)
Znew2d = [u1';u2']*X;
Ratio2 = (d1+d2)/(d1+d2+d3);
figure(3)
scatter(Znew2d(1,:),Znew2d(2,:));
title('Scatter plot ($z_2$ in terms of $z_1$) - (Reduced to two dimensions)','Interpreter','latex');
xlabel('$z_1$','Interpreter','latex');
ylabel('$z_2$','Interpreter','latex');
fprintf("Energy Ratio (Reduced to two dimensions): %f%%\n",Ratio2*100);

Znew1d = u1'*X;
Ratio1 = d1/(d1+d2+d3);
figure(4)
plot(Znew1d);
title('Time plot ($z_1$ in terms of $time$) - (Reduced to one dimension)','Interpreter','latex');
xlabel('$time$','Interpreter','latex');
ylabel('$z_1$','Interpreter','latex');
fprintf("Energy Ratio (Reduced to one dimension): %f%%\n",Ratio1*100);






