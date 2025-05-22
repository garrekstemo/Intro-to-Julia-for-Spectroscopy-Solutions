using Test

# Exercises

# Create an array of 5 random numbers between 1 and 20.
rand(1:20, 5)

# Create a 2D array of random numbers between 1 and 20 with 2 rows and 3 columns.
rand(1:20, 2, 3)

# Use a comprehension to create an array of numbers 1 to 100 that are divisible by 7.
[x for x in 1:100 if x % 7 == 0]

##
# Problems

# Problem 1

# Set every other number to zero
v = collect(1:10)
v[2:2:end] = zeros(Int, length(v)÷2)
v


## Problem 2

# Write a function that removes the middle element of an array if the length is odd, 
# or the two middle elements if the length is even.

function remove_middle(arr)
    n = length(arr)
    if n % 2 == 0
        return vcat(arr[1:n÷2-1], arr[n÷2+2:end])
    else
        return vcat(arr[1:n÷2], arr[n÷2+2:end])
    end
end

arr = [1, 2, 3, 4, 5, 6]
n = length(arr)
vcat(arr[1:n÷2-1], arr[n÷2+2:end])

@test remove_middle([1, 2, 3, 4, 5]) == [1, 2, 4, 5]
@test remove_middle([1, 2, 3, 4, 5, 6]) == [1, 2, 5, 6]
