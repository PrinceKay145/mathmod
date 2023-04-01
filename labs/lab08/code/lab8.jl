using DifferentialEquations
using Plots

p_cr = 15
tau1= 11
tau2=14
p1=8
p2=6
q=1
N=17

d=0.001
M1=2.5
M2=1.5
u0=[M1, ]
a1 = p_cr/(tau1*tau1*p1*p1*N*q)
a2 = p_cr/(tau2*tau2*p2*p2*N*q)
b = p_cr/(tau1*tau1*tau2*tau2*p1*p1*p2*p2*N*q)
c1 = (p_cr-p1)/(tau1*p1)
c2 = (p_cr-p2)/(tau2*p2)

function F(dm, m, p, t)
    dm[1]=m[1]-(b/c1)*m[1]*m[2]-(a1/c1)*m[1]*m[1]
    dm[2]=(c1/c2)*m[2]-(b/c1)*m[1]*m[2]-(a2/c1)*m[2]*m[2]
end

tspan = (0.0, 30.0)
prob = ODEProblem(F, u0, tspan)
sol = solve(prob, Tsit5(), reltol=1e-8, abstol=1e-8)
plot(
    sol, 
    title="Lab 8", 
    xlabel="t", 
    ylabel="m", 
    label=["m1" "m2"]
)