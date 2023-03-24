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
linecap := butt;
fill (6.750000,4.500000)--(27.000000,4.500000)--(27.000000,6.750000)
	--(6.750000,6.750000)--cycle;
fill (9.000000,6.750000)--(9.000000,9.750000)--(24.750000,9.750000)
	--(24.750000,6.750000)--cycle;
fill (8.250000,23.250000)--(8.250000,27.000000)--(11.250000,27.000000)
	--(11.250000,25.500000)--(15.000000,25.500000)--(15.000000,27.000000)
	--(18.750000,27.000000)--(18.750000,25.500000)--(22.500000,25.500000)
	--(22.500000,27.000000)--(25.500000,27.000000)--(25.500000,23.250000)
	--cycle;
drawoptions (withcolor (0.000000,0.000000,0.000000));
pickup pencircle scaled 1.125000bp;
draw (6.750000,4.500000)--(27.000000,4.500000)--(27.000000,6.750000)
	--(6.750000,6.750000)--cycle;
draw (9.000000,6.750000)--(9.000000,9.750000)--(24.750000,9.750000)
	--(24.750000,6.750000)--cycle;
draw (8.250000,23.250000)--(8.250000,27.000000)--(11.250000,27.000000)
	--(11.250000,25.500000)--(15.000000,25.500000)--(15.000000,27.000000)
	--(18.750000,27.000000)--(18.750000,25.500000)--(22.500000,25.500000)
	--(22.500000,27.000000)--(25.500000,27.000000)--(25.500000,23.250000);
drawoptions (withcolor (1.000000,1.000000,1.000000));
pickup pencircle scaled 0.000000bp;
linecap := rounded;
fill (25.500000,23.250000)--(23.250000,21.000000)--(10.500000,21.000000)
	--(8.250000,23.250000)--cycle;
drawoptions (withcolor (0.000000,0.000000,0.000000));
pickup pencircle scaled 1.125000bp;
draw (25.500000,23.250000)--(23.250000,21.000000)--(10.500000,21.000000)
	--(8.250000,23.250000);
drawoptions (withcolor (1.000000,1.000000,1.000000));
pickup pencircle scaled 0.000000bp;
linecap := butt;
linejoin := mitered;
fill (23.250000,21.000000)--(23.250000,11.625000)--(10.500000,11.625000)
	--(10.500000,21.000000)--cycle;
drawoptions (withcolor (0.000000,0.000000,0.000000));
pickup pencircle scaled 1.125000bp;
draw (23.250000,21.000000)--(23.250000,11.625000)--(10.500000,11.625000)
	--(10.500000,21.000000);
drawoptions (withcolor (1.000000,1.000000,1.000000));
pickup pencircle scaled 0.000000bp;
linecap := rounded;
linejoin := rounded;
fill (23.250000,11.625000)--(24.375000,9.750000)--(9.375000,9.750000)
	--(10.500000,11.625000)--cycle;
drawoptions (withcolor (0.000000,0.000000,0.000000));
pickup pencircle scaled 1.125000bp;
draw (23.250000,11.625000)--(24.375000,9.750000)--(9.375000,9.750000)
	--(10.500000,11.625000);
linejoin := mitered;
draw (8.250000,23.250000)--(25.500000,23.250000);
endfig;
end
