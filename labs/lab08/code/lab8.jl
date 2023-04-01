using DifferentialEquations
using Plots

#define the variables needed in the equations
p_cr = 15
N= 17
q=1
M1=2.5
M2=1.5
tau1=11
tau2=15
p1=8
p2=6

a1=p_cr/(tau1*tau1*p1*p1*N*q)
a2=p_cr/(tau2*tau2*p2*p2*N*q)
b=p_cr/(tau1*tau1*p1*p1*tau2*tau2*p2*p2*N*q)
c1=(p_cr-p1)/(tau1*tau1*p1*p1)
c2=(p_cr-p2)/(tau2*tau2*p2*p2)

# Define the function for the differential equation 
function F(dm,m,p,t)
    dm[1]=m[1]-(b/c1)*m[1]*m[2]-(a1/c1)*m[1]*m[1]
    dm[2]=(c2/c1)*m[2]-(b/c1)*m[1]*m[2]-(a2/c1)*m[2]*m[2]
end

prob1=ODEProblem(F,[M1,M2],(0,30))
sol1 = solve(prob1, Tsit5(), reltol=1e-8, abstol=1e-8)
plot(
    sol1, 
    title="Lab 8", 
    xlabel="t", 
    ylabel="m", 
    label=["m1" "m2"]
)

function F2(dm,m,p,t)
    dm[1]=m[1]-((b/c1)+0.001)*m[1]*m[2]-(a1/c1)*m[1]*m[1]
    dm[2]=(c2/c1)*m[2]-(b/c1)*m[1]*m[2]-(a2/c1)*m[2]*m[2]
end

prob2=ODEProblem(F2,[M1,M2],(0,30))
sol2 = solve(prob2, Tsit5(), reltol=1e-8, abstol=1e-8)
plot(
    sol2, 
    title="Lab 8", 
    xlabel="t", 
    ylabel="m", 
    label=["m1" "m2"]
)