using DifferentialEquations
using Plots
N=500
n=5
u0=[n]
t0=0
tmax=30
tspan=(t0,tmax)
function F(du, u, p, t)
    du[1]=(0.55+0.0001*u[1])*(N-u[1])
end
prob=ODEProblem(F, u0, tspan)
sol=solve(prob)
plot(sol, title= "Эффективность рекламы №1", lab="n(t)", linewidth=2)
savefig("../report/image/JLab71.png")