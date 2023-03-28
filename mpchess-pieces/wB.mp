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
fill (19.277300,7.957030)..controls (19.894501,8.785160) and (22.925800,14.222700)..(16.992201,19.761700)
	..controls (16.992201,19.761700) and (14.613300,16.679701)..(14.218800,12.121100)
	--(12.765600,12.125000)..controls (12.738300,16.308599) and (15.839800,20.640600)..(15.839800,20.640600)
	..controls (18.335899,25.343800) and (10.136700,25.359400)..(12.398400,20.640600)
	..controls (5.476560,14.945300) and (8.558590,8.679690)..(9.070310,7.957030)
	--cycle;
fill (19.277300,7.957030)--cycle;
drawoptions (withcolor (0.000000,0.000000,0.000000));
pickup pencircle scaled 1.174850bp;
draw (19.277300,7.957030)..controls (19.894501,8.785160) and (22.925800,14.222700)..(16.992201,19.761700)
	..controls (16.992201,19.761700) and (14.613300,16.679701)..(14.218800,12.121100)
	--(12.765600,12.125000)..controls (12.738300,16.308599) and (15.839800,20.640600)..(15.839800,20.640600)
	..controls (18.335899,25.343800) and (10.136700,25.359400)..(12.398400,20.640600)
	..controls (5.476560,14.945300) and (8.558590,8.679690)..(9.070310,7.957030)
	--cycle;
draw (19.277300,7.957030);
endfig;
end
