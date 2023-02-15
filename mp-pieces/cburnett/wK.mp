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
pickup pencircle scaled 1.125000bp;
linejoin := mitered;
draw (16.875000,25.027300)--(16.875000,29.250000);
draw (15.000000,27.750000)--(18.750000,27.750000);
drawoptions (withcolor (1.000000,1.000000,1.000000));
pickup pencircle scaled 0.000000bp;
linecap := butt;
fill (16.875000,15.000000)..controls (16.875000,15.000000) and (20.250000,20.625000)..(19.125000,22.875000)
	..controls (19.125000,22.875000) and (18.375000,24.750000)..(16.875000,24.750000)
	..controls (15.375000,24.750000) and (14.625000,22.875000)..(14.625000,22.875000)
	..controls (13.500000,20.625000) and (16.875000,15.000000)..(16.875000,15.000000)
	--cycle;
drawoptions (withcolor (0.000000,0.000000,0.000000));
pickup pencircle scaled 1.125000bp;
draw (16.875000,15.000000)..controls (16.875000,15.000000) and (20.250000,20.625000)..(19.125000,22.875000)
	..controls (19.125000,22.875000) and (18.375000,24.750000)..(16.875000,24.750000)
	..controls (15.375000,24.750000) and (14.625000,22.875000)..(14.625000,22.875000)
	..controls (13.500000,20.625000) and (16.875000,15.000000)..(16.875000,15.000000);
drawoptions (withcolor (1.000000,1.000000,1.000000));
pickup pencircle scaled 0.000000bp;
linecap := rounded;
linejoin := rounded;
fill (8.625000,6.000000)..controls (12.750000,3.375000) and (20.250000,3.375000)..(24.375000,6.000000)
	--(24.375000,11.250000)..controls (24.375000,11.250000) and (31.125000,14.625000)..(28.875000,19.125000)
	..controls (25.875000,24.000000) and (18.750000,21.750000)..(16.875000,16.125000)
	--(16.875000,13.500000)--(16.875000,16.125000)..controls (14.250000,21.750000) and (7.125000,24.000000)..(4.875000,19.125000)
	..controls (2.625000,14.625000) and (8.625000,11.625000)..(8.625000,11.625000)
	--cycle;
fill (8.625000,6.000000)--cycle;
drawoptions (withcolor (0.000000,0.000000,0.000000));
pickup pencircle scaled 1.125000bp;
draw (8.625000,6.000000)..controls (12.750000,3.375000) and (20.250000,3.375000)..(24.375000,6.000000)
	--(24.375000,11.250000)..controls (24.375000,11.250000) and (31.125000,14.625000)..(28.875000,19.125000)
	..controls (25.875000,24.000000) and (18.750000,21.750000)..(16.875000,16.125000)
	--(16.875000,13.500000)--(16.875000,16.125000)..controls (14.250000,21.750000) and (7.125000,24.000000)..(4.875000,19.125000)
	..controls (2.625000,14.625000) and (8.625000,11.625000)..(8.625000,11.625000)
	--cycle;
draw (8.625000,6.000000);
draw (8.625000,11.250000)..controls (12.750000,13.500000) and (20.250000,13.500000)..(24.375000,11.250000);
draw (8.625000,8.625000)..controls (12.750000,10.875000) and (20.250000,10.875000)..(24.375000,8.625000);
draw (8.625000,6.000000)..controls (12.750000,8.250000) and (20.250000,8.250000)..(24.375000,6.000000);
endfig;
end
