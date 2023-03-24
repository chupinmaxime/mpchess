% Converted from PostScript(TM) to MetaPost by pstoedit
% MetaPost backend contributed by Scott Pakin <scott+ps2ed_AT_pakin.org>
% pstoedit is Copyright (C) 1993 - 2020 Wolfgang Glunz <wglunz35_AT_pstoedit.net>

% Generate structured PostScript
prologues := 1;

% Display a given string with its *baseline* at a given location
% and with a given rotation angle
vardef showtext(expr origin)(expr angle)(expr string) =
  draw string infont defaultfont scaled defaultscale
    rotated angle shifted origin;
enddef;

beginfig(1);
drawoptions (withcolor (1.000000,1.000000,1.000000));
linejoin := mitered;
fill (16.875000,27.000000)..controls (15.218800,27.000000) and (13.875000,25.656300)..(13.875000,24.000000)
	..controls (13.875000,23.332001) and (14.093800,22.718800)..(14.460900,22.214800)
	..controls (12.996100,21.375000) and (12.000000,19.808599)..(12.000000,18.000000)
	..controls (12.000000,16.476601) and (12.703100,15.121100)..(13.808600,14.226600)
	..controls (11.558600,13.433600) and (8.250000,10.066400)..(8.250000,4.125000)
	--(25.500000,4.125000)..controls (25.500000,10.066400) and (22.191401,13.433600)..(19.941401,14.226600)
	..controls (21.046900,15.121100) and (21.750000,16.476601)..(21.750000,18.000000)
	..controls (21.750000,19.808599) and (20.753901,21.375000)..(19.289101,22.214800)
	..controls (19.656300,22.718800) and (19.875000,23.332001)..(19.875000,24.000000)
	..controls (19.875000,25.656300) and (18.531300,27.000000)..(16.875000,27.000000)
	--cycle;
fill (16.875000,27.000000)--cycle;
drawoptions (withcolor (0.000000,0.000000,0.000000));
pickup pencircle scaled 1.125000bp;
draw (16.875000,27.000000)..controls (15.218800,27.000000) and (13.875000,25.656300)..(13.875000,24.000000)
	..controls (13.875000,23.332001) and (14.093800,22.718800)..(14.460900,22.214800)
	..controls (12.996100,21.375000) and (12.000000,19.808599)..(12.000000,18.000000)
	..controls (12.000000,16.476601) and (12.703100,15.121100)..(13.808600,14.226600)
	..controls (11.558600,13.433600) and (8.250000,10.066400)..(8.250000,4.125000)
	--(25.500000,4.125000)..controls (25.500000,10.066400) and (22.191401,13.433600)..(19.941401,14.226600)
	..controls (21.046900,15.121100) and (21.750000,16.476601)..(21.750000,18.000000)
	..controls (21.750000,19.808599) and (20.753901,21.375000)..(19.289101,22.214800)
	..controls (19.656300,22.718800) and (19.875000,23.332001)..(19.875000,24.000000)
	..controls (19.875000,25.656300) and (18.531300,27.000000)..(16.875000,27.000000)
	--cycle;
draw (16.875000,27.000000);
endfig;
end
