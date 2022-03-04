
set(0,'DefaultFigureWindowStyle','docked')
clc 
clear
R1=1;
R2=2;
L=0.2;
R3=10;
a=100;
R4=0.1;
R0=1000;
G1=1/R1;
G2=1/R2;
G3=1/R3;
G4=1/R4;
G0=1/R0;
w=pi;
n=100;
std=0.05;
Cap=0.25 +randn(n,1)*0.5;
V_3=zeros(100,1);
V_5=zeros(100,1);
V1=1;
n=100;
w=pi;
for i=1:n
    G= [ G1 -G1 0 0 0 1 0;
        1 0 0 0 0 0 0; 
        -G1 G1+G2 0 0 0 0 1;
        0 0 -G3 0 0 0 1;
        0 0 0 -G4 G4+G0 0 0;
        0 0 a*G3 -1 0 0 0;
        0 1 -1 0 0 0 0];
    C= [ Cap(i) -Cap(i) 0 0 0 0 0;
        0 0 0 0 0 0 0;
        -Cap(i) Cap(i) 0 0 0 0 0;
        0 0 0 0 0 0 0;
        0 0 0 0 0 0 0;
        0 0 0 0 0 0 0;
        0 0 0 0 0 0 L];
    F= [0; V1; 0; 0;0;0;0];
    H=G+j.*w.*C;
    V=H\F;
    V_3(i)=V(3,:);
    V_5(i)=V(5,:);
end
gain=20*log10(real(V_5)/V1);
figure (4)
hist(Cap,10)
xlabel('C')
ylabel('number')
figure (5) 
hist(gain,10)
xlabel('Vo/Vi')
ylabel('number')