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
fill (19.250000,7.917970)..controls (22.527300,7.917970) and (22.671900,5.488280)..(22.671900,3.679690)
	--(5.632810,3.679690)..controls (5.632810,5.519530) and (5.777340,7.917970)..(9.054690,7.917970)
	--cycle;
fill (19.250000,7.917970)--cycle;
drawoptions (withcolor (0.000000,0.000000,0.000000));
pickup pencircle scaled 1.174850bp;
draw (19.250000,7.917970)..controls (22.527300,7.917970) and (22.671900,5.488280)..(22.671900,3.679690)
	--(5.632810,3.679690)..controls (5.632810,5.519530) and (5.777340,7.917970)..(9.054690,7.917970)
	--cycle;
draw (19.250000,7.917970);
drawoptions (withcolor (1.000000,1.000000,1.000000));
pickup pencircle scaled 0.000000bp;
fill (19.257799,8.000000)--(9.082030,8.000000)..controls (9.218750,11.593800) and (13.515600,13.503900)..(13.710900,15.234400)
	..controls (13.906300,16.968800) and (13.031300,17.414101)..(13.031300,17.414101)
	..controls (13.031300,17.414101) and (12.433600,15.332000)..(11.668000,14.906300)
	..controls (10.902300,14.480500) and (9.125000,14.078100)..(9.125000,14.078100)
	..controls (9.125000,14.078100) and (7.875000,13.031200)..(7.140630,13.105500)
	..controls (6.406250,13.175800) and (5.773440,14.812500)..(5.773440,14.812500)
	--(8.273440,18.515600)--(9.539060,21.140600)--(10.734400,22.355499)
	--(11.246100,24.136700)--(12.683600,22.570299)..controls (20.597700,22.570299) and (22.316401,13.070300)..(19.257799,8.000000)
	--cycle;
fill (19.257799,8.000000)--cycle;
drawoptions (withcolor (0.000000,0.000000,0.000000));
pickup pencircle scaled 1.174850bp;
draw (19.257799,8.000000)--(9.082030,8.000000)..controls (9.218750,11.593800) and (13.515600,13.503900)..(13.710900,15.234400)
	..controls (13.906300,16.968800) and (13.031300,17.414101)..(13.031300,17.414101)
	..controls (13.031300,17.414101) and (12.433600,15.332000)..(11.668000,14.906300)
	..controls (10.902300,14.480500) and (9.125000,14.078100)..(9.125000,14.078100)
	..controls (9.125000,14.078100) and (7.875000,13.031200)..(7.140630,13.105500)
	..controls (6.406250,13.175800) and (5.773440,14.812500)..(5.773440,14.812500)
	--(8.273440,18.515600)--(9.539060,21.140600)--(10.734400,22.355499)
	--(11.246100,24.136700)--(12.683600,22.570299)..controls (20.597700,22.570299) and (22.316401,13.070300)..(19.257799,8.000000)
	--cycle;
draw (19.257799,8.000000);
endfig;
end
