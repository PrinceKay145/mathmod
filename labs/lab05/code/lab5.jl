using DifferentialEquations
using Plots

x0=6
y0=11

u0=[x0,y0]

t0=0
tmax=50
tspan =(t0,tmax)
t= collect(LinRange(t0,tmax,500))
function F(du, u, p, t)
    du[1]=-0.12*u[1]+0.041*u[1]*u[2]
    du[2]=0.32*u[2]-0.029*u[1]*u[2]
end

prob = ODEProblem(F, u0, tspan)
sol = solve(prob, saveat=t)

plt1 = plot( t,sol[1, :],
    title="Модель хищник-жертва",
    xaxis="время",
    yaxis="число жертв",
    label="x(t)", 
    linewidth=3
    )
savefig(plt1, "lab51.png")
plt2 = plot( t,sol[2, :],
    title="Модель хищник-жертва",
    xaxis="время",
    yaxis="число хищников",
    # xlabel = "t",
    # ylabel = "y(t)", 
    label="y(t)", 
    linewidth=3
    )
savefig(plt2, "lab52.png")
plt3 = plot(sol, idxs=(1,2),
    title="Модель хищник-жертва",
    xaxis="число жертв",
    yaxis="число хищников",
    label="y(x)", 
    linewidth=3
    )
savefig(plt3, "lab53.png")