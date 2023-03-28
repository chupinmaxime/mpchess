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
linejoin := mitered;
fill (14.156300,20.671900)..controls (12.527300,20.671900) and (11.203100,19.347700)..(11.203100,17.718800)
	..controls (11.203100,16.894501) and (11.550800,16.109400)..(12.156300,15.550800)
	--(10.480500,14.832000)--(10.480500,13.085900)--(12.460900,13.089800)
	..controls (11.296900,5.554690) and (7.957030,7.871090)..(7.957030,3.695310)
	--(20.449200,3.695310)..controls (20.449200,7.929690) and (17.027300,5.371090)..(15.855500,13.093800)
	--(17.835899,13.125000)--(17.835899,14.859400)--(16.179701,15.566400)
	..controls (16.773399,16.125000) and (17.109400,16.902300)..(17.109400,17.718800)
	..controls (17.109400,19.351601) and (15.789100,20.671900)..(14.156300,20.671900)
	--cycle;
fill (14.156300,20.671900)--cycle;
drawoptions (withcolor (0.000000,0.000000,0.000000));
pickup pencircle scaled 1.133860bp;
draw (14.156300,20.671900)..controls (12.527300,20.671900) and (11.203100,19.347700)..(11.203100,17.718800)
	..controls (11.203100,16.894501) and (11.550800,16.109400)..(12.156300,15.550800)
	--(10.480500,14.832000)--(10.480500,13.085900)--(12.460900,13.089800)
	..controls (11.296900,5.554690) and (7.957030,7.871090)..(7.957030,3.695310)
	--(20.449200,3.695310)..controls (20.449200,7.929690) and (17.027300,5.371090)..(15.855500,13.093800)
	--(17.835899,13.125000)--(17.835899,14.859400)--(16.179701,15.566400)
	..controls (16.773399,16.125000) and (17.109400,16.902300)..(17.109400,17.718800)
	..controls (17.109400,19.351601) and (15.789100,20.671900)..(14.156300,20.671900)
	--cycle;
draw (14.156300,20.671900);
endfig;
end
