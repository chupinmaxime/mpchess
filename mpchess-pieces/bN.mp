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
fill (19.257799,9.101560)--(9.082030,9.101560)..controls (9.218750,12.449200) and (13.515600,14.226600)..(13.710900,15.843800)
	..controls (13.906300,17.457001) and (13.031300,17.875000)..(13.031300,17.875000)
	..controls (13.031300,17.875000) and (12.433600,15.933600)..(11.668000,15.535200)
	..controls (10.902300,15.136700) and (9.125000,14.765600)..(9.125000,14.765600)
	..controls (9.125000,14.765600) and (7.875000,13.789100)..(7.140630,13.855500)
	..controls (6.406250,13.925800) and (5.773440,15.449200)..(5.773440,15.449200)
	--(8.273440,18.898399)--(9.539060,21.347700)--(10.734400,22.476601)
	--(11.246100,24.136700)--(12.683600,22.675800)..controls (20.597700,22.675800) and (22.316401,13.824200)..(19.257799,9.101560)
	--cycle;
fill (19.257799,9.101560)--cycle;
endfig;
end
