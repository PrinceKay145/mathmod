using DifferentialEquations
using Plots

a=0.01
b=0.02
N=20000
I=99
R=5
S=N-I-R
u0=[S,I,R]
t0=0
tmax=100
tspan=(t0,tmax)
#когда I(t)<=I
function F(du, u, p, t)
    S, I, R = u
    du[1]=-a*u[1]
    du[2]=a*u[1]-b*u[2]
    du[3]=b*u[2]
end
prob1 = ODEProblem(F, u0, tspan)
sol1= solve(prob1)

plot(sol1.t, sol1[1, :], lab="S(t)")
plot!(sol1.t, sol1[2,:], lab="I(t)")
p1=plot!(sol1.t, sol1[3,:], lab=lab="R(t)", title ="Модель эпидемии №1" )
savefig("Jlab61.png")

function F2(du, u, p, t)
    du[1]=0
    du[2]=-b*u[2]
    du[3]=b*u[2]
end

prob2=ODEProblem(F2, u0, tspan)
sol2=solve(prob2)

plot(sol2.t, sol2[1, :], lab="S(t)")
plot!(sol2.t, sol2[2,:], lab="I(t)")
p1=plot!(sol2.t, sol2[3,:], lab=lab="R(t)", title ="Модель эпидемии №2" )
savefig("Jlab62.png")