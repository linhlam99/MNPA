set(0,'DefaultFigureWindowStyle','docked')
R1=1;
C=0.25;
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
G= [ G1 -G1 0 0 0 1 0;
    1 0 0 0 0 0 0; 
    -G1 G1+G2 0 0 0 0 1;
    0 0 -G3 0 0 0 1;
    0 0 0 -G4 G4+G0 0 0;
    0 0 a*G3 -1 0 0 0;
    0 1 -1 0 0 0 0];
C= [ C -C 0 0 0 0 0;
    0 0 0 0 0 0 0;
    -C C 0 0 0 0 0;
    0 0 0 0 0 0 0;
    0 0 0 0 0 0 0;
    0 0 0 0 0 0 0;
    0 0 0 0 0 0 L];
V_3=zeros(100,1);
V_5=zeros(100,1);
V1=linspace(-10,10,100);
for i=1:100
    F= [0; V1(i); 0; 0;0;0;0];
    H=G+j.*w.*C;
    V=H\F;
    V_3(i)=V(3,:);
    V_5(i)=V(5,:);
end
figure (1)
plot(V1,real(V_3))
hold on
plot(V1,real(V_5))
legend('V3','V0')
xlabel('Vin')
ylabel('V')