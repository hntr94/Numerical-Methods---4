function V = volume(surface1, surface2, z1, z2)
	V = (surface1 + surface2) * (z2 - z1) / 2;
end 
