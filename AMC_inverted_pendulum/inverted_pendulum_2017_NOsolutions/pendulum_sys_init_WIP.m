clear all
close all
clc

M=10;   %mass of the cart          [kg]
m=2;    %mass of the pendulum      [kg]
l=1;    %lenght                    [m]
ra=10;  %armature resistance       [ohm]
rr=.1;  %radius of the wheels      [m]
ke=2;   %constant                  [N*m/A]
kc=2;   %constant                  [V*s/rad]
g=9.81;

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
sim("pendulum_openloop_anim", 1);

A = pendulum_openloop_anim_Timed_Based_Linearization.a;
B = pendulum_openloop_anim_Timed_Based_Linearization.b;
C = pendulum_openloop_anim_Timed_Based_Linearization.c;
D = pendulum_openloop_anim_Timed_Based_Linearization.d;


poles = eig(A)

reachability_rank = rank(ctrb(A,B))

%% Pole Placement

P = [-2, -3, -4, -5]; % poles;

K = place(A, B, P);

%% Enlarged System

P = [-1, -1.2, -1.3, -1.4, -5];

Zero = zeros(length(A));
Atilde = [A, Zero(:, 1); -C(1, :), 0];
Btilde = [B;0];

Ktilde = place(Atilde, Btilde, P);