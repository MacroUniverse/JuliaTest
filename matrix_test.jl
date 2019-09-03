println("hello!")
A = Array{Float64,2}(undef, 2, 3)
## undef 是 UndefInitializer 类型的 object， {...} 里面的是模板， () 里面的是 constructor 的参数（？）

print(1, " + ", 2, " = ", 1 + 2) # 没有自动换行
println(1, " + ", 2, " = ", 1 + 2) # 有自动换行


Vector{Float64}(undef, 5)

a3 = Int64[]
zeros(2, 2)
zeros(Float64, 2, 2)
a7 = [1,2,3] # Array{Int64, 1}
a8 = [1 2 3] # 二维 Array{Int64, 2}
a6 = [1 2 3; 4 5 6] # Array{Int64, 2}
LinRange(0, 3, 10) ## 得到 LinRange 类型
range(0.1, 1.1, length = 7)
B = [A; A]
A .= 2
A .+ 3
A .+= 3
A .* B
A = rand(3, 4)
A = rand(Float64, 3, 4)
A = rand(ComplexF64, 3, 4)
rand(3, 6) .+ [1 2 3] # 每一行都加上 [1 2 3]
sum(A,3) # 对某个维度求和
sum(A,(1,3)) # 对指定的多个维度求和
maximum(A) # 求所有元的最大值
maximum(A,2) # 对某个维度求最大值
findmax(A) # 找到最大的元素
isempty(A)

a4 = 1:20 # 这是一个 range 而不是 array
a5 = [2^i for i = 1:10]

Diagonal([1 2 3]) # 错误！ [1 2 3] 是二维数组
Diagonal([1, 2, 3]) # 生成对角矩阵

summary(A) # 返回对变量的描述
show(A) # 在输出流显示变量值
str = repr(A) # 将任意变量转换为字符串， 使用 show() 函数实现
typeof(str)
inv(A)
tmp = eigen(A)
V = tmp.vectors
D = tmp.values

# slicing
m4[:,:,1]


# 循环, 可以用 continue 和 break
for i = 1:10
	print(i, ",")
end
for i in A
    print(i, ", ")
end
println(i)

# 矩阵运算
# 需要 using LinearAlgebra

A = rand(3, 3)
B = rand(3, 3)
println(A * B)
det(A)
A'