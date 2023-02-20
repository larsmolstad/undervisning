using Plots
fsiz = 10
x = range(0,10, length=100)
p1 = plot(x, (x .+ 1).^2, title="Positiv derivert,\n positiv andrederivert")
p2 = plot(x, -(-x .+ 11).^2, title="Positiv derivert,\n negativ andrederivert")
p3 = plot(x, (-x .+ 11).^2, title="Negativ derivert,\n positiv andrederivert")
p4 = plot(x, - (x .+ 1).^2, title="Negativ derivert,\n negativ andrederivert")
plot(p1, p2, p3, p4,legend=false, titlefontsize=fsiz)

#savefig("deriverte.png")

a = 1.5 # beginning of dx
b = 1.6 # end of dx
c = (a + b)/2
Ax = .7 # x coordinate A annotation
dAx = 1.1 # x coordinate for equations
dAyrel = [.6, .75] .+ .2 # relative y coordinates for equations

fun = exp
fun = x->1/(x*.2+1)^2*10
#fun = x->3*cos(x-.5)+3
x = collect(range(0, 2, length= 100))
y = fun.(x)
x2 = collect(range(0, a, length=100))
y2 = fun.(x2)
x3 = collect(range(a, b, length=100))
y3 = fun.(x3)

h = maximum(y)

plot(x,y, label="f(x)")
plot!(x2, y2, fillrange = 0, fillalpha = 0.35, c = 1, label="A(x)")
plot!(x3, y3, fillrange = 0, fillalpha = 0.35, c = 2, label="dA")

plot!([a, b], [0, 0], label="", color=:black)
plot!([a, a], [0, fun(a)], label="", color=:black)
plot!([b, b], [0, fun(b)], label="", color=:black)
x3 = range(a, b, length=100)
plot!(x3, fun.(x3), label="", color=:black)

annotate!(dAx, h*dAyrel[2], "dA = f(x)dx", fsiz)
annotate!(dAx, h*dAyrel[1], "A(x) = ∫dA = ∫f(x)dx", fsiz)
annotate!(Ax, fun(Ax)*.6, "A", fsiz)
annotate!(c, fun(c)/2, "dA", fsiz)
plot!([b, b] .+ 0.15, [0, fun(c)/2 - .3],  color=:black, label="")
plot!([b, b] .+ 0.15, [fun(c)/2 + .3, fun(c)], color=:black, label="")
annotate!(b + .15, fun(c)/2, "f(x)", fsiz)
plot!([b, b + .15], [fun(c), fun(c)], line=:dash, color=:black, label="")
plot!([b, b + .15], [0, 0], line=:dash, color=:black, label="")
z = fun(c) + .8
plot!([a, a], [fun(a), z], line=:dash, color=:black, label="")
plot!([b, b], [fun(b), z], line=:dash, color=:black, label="", xlabel="x")
annotate!(c, z, "dx", fsiz)
display(plot!())


#savefig("integral.png")

#--
x = collect(range(0, 2, length= 100))
y = x*0 .+ 10
y[x.>1.0] .= 5
plot(x,y, label="F", ylabel="F [N]", xlabel="x [m]")
plot!(x, y, fillrange = 0, fillalpha = 0.35, c = 1, label="W(x)")
plot!([1, 1], [0,5], linestyle=:dash, color=:blue, label="")
annotate!(0.5, 6.0, "10N * 1m \n\n = 10J   ", 8)
annotate!(1.5, 3.0, "5N * 1m \n\n = 5J   ", 8)
p1 = plot!()

x = range(x[1], x[end], length=8)
y = 10b^2 ./((x.+b).^2)
x2 = x .+ x[2] .- x[1]
y2 = y
x = [x x2]'[:]
y = [y y2]'[:]
plot(x,y)
plot(x,y, label="F", xlabel="x [m]")
plot!(x,y, fillrange=0, fillalpha = 0.35, c = 3, label="W(x)")
annotate!(0.8, 3.0, " W = ∑F(x)Δx", fsiz)
p2 = plot!()

x = collect(range(0, 2, length= 100))
b = 1+sqrt(2)
y = 10b^2 ./((x.+b).^2)
plot(x,y, label="F", xlabel="x [m]")
plot!(x,y, fillrange=0, fillalpha = 0.35, c = 2, label="W(x)")
annotate!(0.7, 3.0, " W = ∫F(x)dx", fsiz)
p3 = plot!()

using Plots.PlotMeasures
plot(p1, p2, p3, size=(800, 300), left_margin=5mm, bottom_margin=5mm,
     layout=(1,3))
savefig("work_sum.png")
#--
