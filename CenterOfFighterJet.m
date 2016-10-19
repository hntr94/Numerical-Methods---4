function ff = CenterOfFighterJet(path)
	x = [];
	y = [];	
	z = [];

	
	V = [];
	for i = 1:7
		name = strcat('date',num2str(i-1),'.in');
		f(i) = fopen(name,'r');
	end

	for i = 2:7
		tline = fgetl(f(i-1));
		initials = str2num(tline);
		z1 = initials(3);
		surface1 = Trapez(x,y,num2str(i-2));
		
		tline = fgetl(f(i));
		initials = str2num(tline);
		z2 = initials(3);
		surface2 = Trapez(x,y,num2str(i-1));

		V(i) = volume(surface1, surface2, z1, z2);
	end	

	Vf = sum(V);
	printf("Volume of plane: %.3f\n", Vf);
	
	ro = [];
	M = [];
	d = fopen('densitati.in','r');
	for i = 1:6
		tline = fgetl(d);
		initials = str2num(tline);
		ro(i) = initials(1);		
		
		M(i) = V(i+1) * ro(i);
		[t u v] = CenterOfMass(x,y,z,num2str(i-1));
		[a b c] = CenterOfMass(x,y,z,num2str(i));
		G(i,1:3) = [(t+a)/2 (u+b)/2 (v+c)/2];
	end
	mass = sum(M);
	printf("Mass of plane: %.3f\n",mass);
	%G
	
	[x1] = (G(1,:)*M(1) + G(2,:)*M(2) + G(3,:)*M(3) + G(4,:)*M(4) + G(5,:)*M(5) + G(6,:)*M(6))/mass;

	printf("Center of mass: x = %.3f y = %.3f z = %.3f\n",x1(1),x1(2),x1(3));

	fclose(d);
	for i = 1:7
		fclose(f(i));		
	end	
end
	
