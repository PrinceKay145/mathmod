model lab6
parameter Real a=0.01;
parameter Real b=0.02;
parameter Real N=20000;

Real I;
Real R;
Real S;
initial equation
I=99;
R=5;
S=N-I-R;

equation
der(S)=-a*S;
der(I)=a*S-b*I;
der(R)=b*I;
end lab6;
