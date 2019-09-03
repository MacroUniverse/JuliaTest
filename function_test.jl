# arguments can be changed
function fun(A)
A = A .+ 1;
end

A = rand(2, 2)
fun(A)
println(A)
