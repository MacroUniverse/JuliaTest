function my_func()
	c = f1(1, 2)
	println(c)
end

function f1(x, y)
    return (x + y)^2 + sin(x*y);
end

function sin_approx(x, terms)
	result = 0
	sign = 1
	for n in 0:terms-1
		term = sign*x^(2n+1)/factorial(2n+1)
		result += term
		sign *= -1
	end
	return result
end

function f2(a)
	return a.^2 + sin.(a)
end
