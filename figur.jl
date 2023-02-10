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
Ax = 1.0 # x coordinate A annotation
dAx = 0.5 # x coordinate equations

fun = exp
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

annotate!(dAx, h*.75, "dA = f(x)dx", fsiz)
annotate!(dAx, h*.6, "A(x) = ∫dA = ∫f(x)dx", fsiz)
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


# savefig("integral.png")
