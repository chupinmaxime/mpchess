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
linecap := butt;
linejoin := mitered;
fill (19.250000,7.917970)..controls (22.527300,7.917970) and (22.671900,5.488280)..(22.671900,3.679690)
	--(5.632810,3.679690)..controls (5.632810,5.519530) and (5.777340,7.917970)..(9.054690,7.917970)
	--cycle;
fill (19.250000,7.917970)--cycle;
fill (18.890600,9.101560)--(9.410160,9.101560)..controls (9.539060,12.566400) and (13.539100,14.410200)..(13.722700,16.085899)
	..controls (13.906300,17.757799) and (13.089800,18.187500)..(13.089800,18.187500)
	..controls (13.089800,18.187500) and (12.531300,16.175800)..(11.820300,15.765600)
	..controls (11.109400,15.355500) and (9.449220,14.968800)..(9.449220,14.968800)
	..controls (9.449220,14.968800) and (8.289060,13.957000)..(7.601560,14.027300)
	..controls (6.917970,14.097700) and (6.332030,15.675800)..(6.332030,15.675800)
	--(8.656250,19.253901)--(9.835940,21.785200)--(10.949200,22.957001)
	--(11.425800,24.675800)--(12.765600,23.164101)..controls (20.140600,23.164101) and (21.738300,13.992200)..(18.890600,9.101560)
	--cycle;
fill (18.890600,9.101560)--cycle;
endfig;
end
