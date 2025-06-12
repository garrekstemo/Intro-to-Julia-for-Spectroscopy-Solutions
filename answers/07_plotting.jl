# Problem: Create a 3D plot of the electric potential of a dipole using Julia and Makie.jl
# This is qualitatively the answer students should get

using GLMakie

# --------------------------------------------------------------------- #
# Solution 1
# This is a standard function with arrays for x and y.
# The output is a 2D array z.

function phi(x, y, a, q)
    z = zeros(length(x), length(y))
    for i in eachindex(x)
        for j in eachindex(y)
            z[i, j] = q / sqrt((x[i] + a)^2 + y[j]^2) - q / sqrt((x[i] - a)^2 + y[j]^2)
        end
    end
    z
end

x = y = range(-1, 1, length=200)
a_0 = 0.3
q_0 = 1
z = phi(x, y, a_0, q_0)
# --------------------------------------------------------------------- #


# --------------------------------------------------------------------- #
# Solution 2
# In this function x and y are scalars, not arrays.
# The output is a scalar.
# Then we use a comprehension to create the 2D array z.

ϕ(x, y, q, a) = q / (sqrt((x + a)^2 + y^2)) - q / (sqrt((x - a)^2 + y^2))

x = y = range(-1, 1, length=200)
a_0 = 0.1
q_0 = 1
z = [ϕ(x_i, y_i, q_0, a_0) for x_i in x, y_i in y]
# --------------------------------------------------------------------- #


fig = Figure()
ax = Axis3(fig[1, 1], title = "Electric Potential of a Dipole", xlabel = "x", ylabel = "y", zlabel = "ϕ")
surface!(x, y, z)

fig
