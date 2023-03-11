model Mlab5

Real x(start =6);
Real y(start =11);

equation
der(x) = -0.12*x+0.041*x*y;
der(y) = 0.32*y-0.029*x*y;
end Mlab5;
