clear
clc
close all

% Define model constants
g = 0;      % gravity
m = 1;      % mass of manipulators
m1 = 5;
l = 1;      % length of manipulators
l1 = 2;
k = 0;      % coefficient of friction

stp = 10;    % step input magnitude
stp_start = 5;
stp_end = 25;
torque_ratio = 5/8;

Kl = 0.4;
Kr = 1.1*Kl;

Tr = 2.5;
Tl = 2.5;

b = ((Tl^2 + Tr^2)*Kl*Kr)/4;

alpha = 4

Bl = sqrt(b)*alpha;
Br = Bl*1;

4*Bl*Br == ((Tl^2 + Tr^2)*Kl*Kr)

% Bl = 1;
% Br = Kl/Kr;

% Dynamics:
A = [[0 1],
    [-(g/l) (-k/m)]];

B = [0,
    (1/(m*l^2))];

C = [[1 0],
    [0 1]];

D = [0,
    0];

A1 = [[0 1],
    [(-g/l1) (-k/m1)]];

B1 = [0,
    (1/m*l1^2)];

C1 = [[1 0],
    [0 1]];

D1 = [0,
    0];

sys = ss(A, B, C, D);