function I = Simpson(x,y,m)
	x = [];
	y = [];
	i =1;
	I = 0;
	name = strcat('date',m,'.in');
	f = fopen(name,'r');
	while ~feof(f)
		tline = fgetl(f);
		initials = str2num(tline);
		x(i) = initials(1);
		y(i) = initials(2);
		z = initials(3);
		i = i+1;
	end
	n = length(x);	
	for i = 1:n-1
		area=0;
		xl = [];
		yl = [];
		suma1 = suma2 = 0;
		if x(i) ~= x(i+1)
			[xl yl] = spline1(x(i:i+1),y(i:i+1));
			h = (x(i+1) - x(i)) / 100;
		
			for j = 1:99
				if 2*j - 1 <= 100
					suma1 = suma1 + yl(j);
				end
				suma2 = suma2 + yl(j);
			end
			area = h/3 * (y(i) + y(i+1) + 4 * suma1 + suma2);
		end

	I = I + area;				
	
	end
	I = abs(I);
	fclose(f);

end
