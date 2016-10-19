function [x0 y0 z0] = CenterOfMass(x,y,z,i)
	f = fopen(strcat('date',num2str(i),'.in'));
	while ~feof(f)
		tline = fgetl(f);
		initials = str2num(tline);
		%initials
		x(i) = initials(1);
		y(i) = initials(2);
		z(i) = initials(3);
		i = i+1;
	end	
	x0 = mean(x);
	y0 = mean(y);
	z0 = mean(z);
end
