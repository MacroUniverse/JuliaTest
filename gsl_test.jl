#################
# 7.33 Examples #
#################

using GSL

# from SLISC/test/test_gsl.h
two_ja = 1; two_ma = 1; two_jb = 1; two_mb = -1;
two_jc = 0; two_mc = 0;

# should be 1/sqrt(2) = 0.707107...
ret = sf_coupling_3j(two_ja, two_jb, two_jc, two_ma, two_mb, two_mc);
println(ret)
if abs(ret - 1. / sqrt(2)) > 1e-14
	println("failed!")
end

# {ja jb jc
#  jd je jf
#  jg jh ji}
two_ja = 6; two_jb = 4; two_jc = 2;
two_jd = 8; two_je = 2; two_jf = 4;
two_jg = 0; two_jh = 6; two_ji = 4;

# should be 0
ret = sf_coupling_9j(two_ja, two_jb, two_jc, two_jd, two_je, two_jf,
	two_jg, two_jh, two_ji);
if (abs(ret) > 1e-14)
	println("failed!")
end

# test associated legendre polynomial for multiple l
# (for every l < lmax, 0 < m < l)
#https://www.gnu.org/software/gsl/doc/html/specfunc.html#c.gsl_sf_legendre_array
# same as Wolfram Alpha
lmax = 3;
n = sf_legendre_array_n(lmax);
legen_arr = zeros(n);
legen_arr = sf_legendre_array(GSL_SF_LEGENDRE_NONE, lmax, 0.6);
ret = legen_arr[sf_legendre_array_index(3, 2)];
if (abs(ret - 5.76) > 1e-14)
	println("failed!");
end

# test associated legendre polynomial single value
# https://www.gnu.org/software/gsl/doc/html/specfunc.html#c.gsl_sf_legendre_Plm
# same as Wolfram Alpha
l = 3; m = 2;
if (abs(sf_legendre_Plm(l, m, 0.4) - 5.04) > 1e-13)
	println("failed!");
end
if (abs(sf_legendre_Plm(l, m, -0.2) + 2.88) > 1e-13)
	println("failed!");
end
if (abs(sf_legendre_Plm(l, m, 0.6) - 5.76) > 1e-13)
	println("failed!");
end
l = 5;  m = 3;
if (abs(sf_legendre_Plm(l, m, 0.4) + 17.7840597569846238) > 1e-13)
	println("failed!");
end
if (abs(sf_legendre_Plm(l, m, -0.2) - 31.6042964572856770) > 1e-13)
	println("failed!");
end
if (abs(sf_legendre_Plm(l, m, 0.6) + 60.2112) > 1e-13)
	println("failed!");
end

# test hydrogen radial function (normalized)
# int |R|^2 r^2 dr = 1
n = 1; l = 0; Z = 1.37;
Nr = 50;
r = zeros(Nr); linspace(r, 0.1, 10);
for i = 1:Nr
	R0 = 2 * Z^1.5 * exp(-Z * r[i]);
	R = sf_hydrogenicR(n, l, Z, r[i]);
	if (abs(R - R0) > 1e-9)
		println("failed!");
	end
end

n = 3; l = 1; Z = 1.37;
Nr = 50;
r = zeros(Nr); linspace(r, 0.1, 10);
for i = 1:Nr
	R0 = 8/(27 * sqrt(6)) * Z^1.5 * (1 - Z*r[i]/6) * Z * r[i] * exp(-Z * r[i]/3);
	R = sf_hydrogenicR(n, l, Z, r[i]);
	if (abs(R - R0) > 1e-9)
		println("failed!");
	end
end

# test coulomb function
# scaled, asymptotic -> sin()
# tested with coulomb1_sym in MyMatlabLibrary (arbitrary precision)
F = zeros(4); G = zeros(4);
lmin = 0; kmax = 3.; eta = 1.; rho = 2.6;
# see also sf_coulomb_wave_FG_array
F_exponent = 0.;
ret = sf_coulomb_wave_F_array(lmin, kmax, eta, rho, F, F_exponent);
if (ret == GSL_EOVRFLW)
	println("failed!")
end
if (abs(F[1] - 0.938149544359976) > 1e-15)
	println("failed!")
end
if (abs(F[2] - 0.623001859914959) > 1e-15)
	println("failed!")
end
if (abs(F[3] - 0.292126432552811) > 1e-15)
	println("failed!")
end
if (abs(F[4] - 0.103105785225698) > 1e-15)
	println("failed!")
end
