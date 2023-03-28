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
fill (19.851601,7.921880)--(18.125000,17.140600)--(10.199200,17.140600)
	--(8.492190,7.921880)--cycle;
fill (19.851601,7.921880)--cycle;
drawoptions (withcolor (0.000000,0.000000,0.000000));
pickup pencircle scaled 1.174850bp;
draw (19.851601,7.921880)--(18.125000,17.140600)--(10.199200,17.140600)
	--(8.492190,7.921880)--cycle;
draw (19.851601,7.921880);
drawoptions (withcolor (1.000000,1.000000,1.000000));
pickup pencircle scaled 0.000000bp;
fill (19.609400,21.625000)--(17.171900,22.253901)--(16.644501,21.011700)
	--(15.648400,21.019501)--(15.648400,22.785200)--(12.597700,22.738300)
	--(12.597700,21.019501)--(11.710900,21.019501)--(11.074200,22.253901)
	--(8.683590,21.382799)..controls (8.683590,21.382799) and (8.660160,17.046900)..(9.914060,17.070299)
	--(18.378901,17.070299)..controls (19.628901,17.070299) and (19.609400,21.625000)..(19.609400,21.625000)
	--cycle;
fill (19.609400,21.625000)--cycle;
drawoptions (withcolor (0.000000,0.000000,0.000000));
pickup pencircle scaled 1.174850bp;
draw (19.609400,21.625000)--(17.171900,22.253901)--(16.644501,21.011700)
	--(15.648400,21.019501)--(15.648400,22.785200)--(12.597700,22.738300)
	--(12.597700,21.019501)--(11.710900,21.019501)--(11.074200,22.253901)
	--(8.683590,21.382799)..controls (8.683590,21.382799) and (8.660160,17.046900)..(9.914060,17.070299)
	--(18.378901,17.070299)..controls (19.628901,17.070299) and (19.609400,21.625000)..(19.609400,21.625000)
	--cycle;
draw (19.609400,21.625000);
endfig;
end
