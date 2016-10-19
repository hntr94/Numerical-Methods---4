function I = Trapez(x,y,m)
	x = [];
	y = [];
	i =1;
	I = 0;
	f = fopen(strcat('date',m,'.in'),'r');
	while ~feof(f)
		tline = fgetl(f);
		initials = str2num(tline);
		%initials
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
		suma = 0;
		if x(i) ~= x(i+1)
			[xl yl] = spline1(x(i:i+1),y(i:i+1));
			h = (x(i+1) - x(i)) / 100;
		
			for j = 1:99
				suma = suma + yl(j);
			end
			%suma
			area = h/2 * (y(i) + y(i+1) + 2 * suma);
		end
	%area
	I = I + area;				
	
	end
	I = abs(I);
	
	fclose(f);
%	i
%	I = 0;
end
