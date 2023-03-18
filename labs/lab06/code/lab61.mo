model lab61
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
der(S)=0;
der(I)=-b*I;
der(R)=b*I;
end lab61;
