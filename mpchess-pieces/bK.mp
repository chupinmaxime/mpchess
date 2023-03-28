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
fill (12.972700,25.609400)--(12.972700,24.281300)--(11.339800,24.281300)
	--(11.339800,22.222700)--(12.972700,22.222700)..controls (12.972700,20.625000) and (12.539100,20.914101)..(11.347700,20.253901)
	..controls (3.992190,22.917999) and (-0.011719,14.625000)..(8.492190,9.007810)
	--(19.800800,9.042970)..controls (28.468800,14.628900) and (24.375000,22.917999)..(17.019501,20.214800)
	..controls (15.617200,20.906300) and (15.363300,20.515600)..(15.363300,22.222700)
	--(17.027300,22.222700)--(17.027300,24.281300)--(15.363300,24.281300)
	--(15.363300,25.609400)--cycle;
fill (18.843800,17.230499)..controls (20.804701,17.054701) and (21.562500,14.839800)..(16.441401,11.679700)
	--(16.441401,16.105499)..controls (17.390600,16.968800) and (17.949200,17.312500)..(18.843800,17.230499)
	--cycle;
fill (9.828130,17.207001)..controls (10.656300,17.183599) and (11.054700,16.828100)..(11.882800,16.074200)
	--(11.882800,11.644500)..controls (6.761720,14.808600) and (7.519530,17.023399)..(9.484380,17.199200)
	..controls (9.593750,17.210899) and (9.710940,17.210899)..(9.828130,17.210899)
	--cycle;
fill (9.828130,17.207001)--cycle;
endfig;
end
