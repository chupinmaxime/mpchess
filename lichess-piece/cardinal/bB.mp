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
drawoptions (withcolor (0.901961,0.901961,0.901961));
linecap := butt;
linejoin := mitered;
fill (74.097702,114.484001)..controls (74.097702,112.688004) and (72.652298,111.230003)..(70.867203,111.230003)
	..controls (69.082001,111.230003) and (67.632797,112.688004)..(67.632797,114.484001)
	..controls (67.632797,116.285004) and (69.082001,117.741997)..(70.867203,117.741997)
	..controls (72.652298,117.741997) and (74.097702,116.285004)..(74.097702,114.484001)
	--cycle;
fill (74.097702,114.484001)--cycle;
pickup pencircle scaled 3.968500bp;
draw (60.472698,75.785202)--(81.257797,75.785202);
draw (70.867203,85.230499)--(70.867203,66.089798);
endfig;
end
