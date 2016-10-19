function [x0,y0] = CentroidOfSurface(x,y)
	x = [];
	y = [];
	i =1;
	f = fopen('contur.in','r');
	while ~feof(f)
		%fscanf(f,"%f %f\n",x[i], y[i] );
		tline = fgetl(f);
		initials = str2num(tline);
		%initials
		x(i) = initials(1);
		y(i) = initials(2);
		i = i+1;
	end
	%sum_x = sum(x);
	%sum_y = sum(y);

	A = x(1:end-1).*y(2:end)-x(2:end).*y(1:end-1);
	As = sum(A)/2;
	x0 = (sum((x(2:end)+x(1:end-1)).*A)*1/6)/As;
	y0 = (sum((y(2:end)+y(1:end-1)).*A)*1/6)/As;

	fclose(f);
	
	%x1 = sum_x / length(x);
	%y1 = sum_y / length(y);
end
