function linspace(x, a, b)
	N = length(x)
	dx = (b - a)/(N - 1)
	x0 = a - dx;
	for i = 1:N
		x[i] = x0 + dx*i
	end
end
