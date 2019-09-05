# benchmark: single core  free propagation is only about 1/5 slower than C++ code on Mission (using test 18.chap4.3_4x144_dt0.01)

using LinearAlgebra
using Dates

function free_prop(Psi, prop1, prop2, wsp1, wsp2)
	Nr1 = size(Psi, 1)
	Nr2 = size(Psi, 2)
	Npw = size(Psi, 3)
	# prop x
	for j = 1:Nr2
		wsp1 = prop1 * Psi[:, j, :]
		Psi[:, j, :] = wsp1
	end
	# prop y
	for i = 1:Nr1
		wsp2 = prop2 * Psi[i, :, :]
		Psi[i, :, :] = wsp2
	end
end

function main()
#params
	Nfe1 = 144; Nfe2 = 144
	Ngs1 = 4; Ngs2 = 4
	Nr1 = Nfe1 * (Ngs1 - 1) - 1
	Nr2 = Nfe2 * (Ngs2 - 1) - 1
	Npw = 23
	Nt = 1000

	Psi = rand(ComplexF64, Nr1, Nr2, Npw)
	prop1 = rand(Float64, Nr1, Nr1)
	prop2 = rand(Float64, Nr2, Nr2)
	wsp1 = zeros(Nr1)
	wsp2 = zeros(Nr2)

	timer_beg = time();
	for it = 1:Nt
		println(it)
		free_prop(Psi, prop1, prop2, wsp1, wsp2)
		timer_end = time();
		println("timer: ", timer_end - timer_beg)
		timer_beg = timer_end;
	end
	println(hash(Psi))
end

main()
