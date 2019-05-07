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

A = pendulum_openloop_anim_Timed_Based_Linearization.a;
B = pendulum_openloop_anim_Timed_Based_Linearization.b;
C = pendulum_openloop_anim_Timed_Based_Linearization.c;
D = pendulum_openloop_anim_Timed_Based_Linearization.d;


poles = eig(A)

reachability_rank = rank(ctrb(A,B))