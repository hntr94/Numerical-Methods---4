function [x_larg, y_larg] = spline1(x,y)

	% citim fiecare vector de elemente, precum si valorile acestora
	
	nr = length(x);
	%obtinem linspace pentru x
	x_larg = linspace(x(1),x(end),100);

	% calculam coeficientii liniari pentru intervalul dat
	for i = 1:nr-1
		a(i) = (y(i+1) - y(i))/(x(i+1) - x(i));
		b(i) = y(i) - a(i)*x(i);
	end

	% in functie de conitiile puse pentru interval se obtine valoare functiei intr-un punct	
	for i = 1:100	
		y_larg(i) = a(1) * x_larg(i) + b(1);
	end

endfunction
