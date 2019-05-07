% clear all
% close all
% clc

M=10;   %mass of the cart          [kg]
m=2;    %mass of the pendulum      [kg]
l=1;    %lenght                    [m]
ra=10;  %armature resistance       [ohm]
rr=.1;  %radius of the wheels      [m]
ke=2;   %constant                  [N*m/A]
kc=2;   %constant                  [V*s/rad]
g=9.81;

%% Time based linearization

% Run simulink openloop

A = pendulum_openloop_anim_Timed_Based_Linearization.a;
B = pendulum_openloop_anim_Timed_Based_Linearization.b;
C = pendulum_openloop_anim_Timed_Based_Linearization.c;
D = pendulum_openloop_anim_Timed_Based_Linearization.d;


%% 

poles = eig(A)

reachability_rank = rank(ctrb(A,B))

P = [-2 -2.5 -3 -4];

K_pp = place(A,B,P)

%%

rank([A, B; C D])

A_int = [A, zeros(4,1);-C(1,:), 0]

B_int = [B;0]

K_pp_int = place(A_int,B_int,[-2 -2.5 -3 -4 -10])

%%

Q = diag([0.1 10 0.1 10 10])
R = 1e-3;

K_LQ = lqr(A_int,B_int,Q,R);

%%

Q_var = diag([10,10,10,10]);
R_var = diag([10,10]);

L = (lqr(A',C',Q_var,R_var))'

A_kalman = A - L*C;

B_kalman = [L B-L*D];

C_kalman = eye(4);

D_kalman = zeros(4,3);


