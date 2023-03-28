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
drawoptions (withcolor (0.000000,0.000000,0.007843));
linecap := butt;
linejoin := mitered;
fill (19.250000,7.917970)..controls (22.527300,7.917970) and (22.671900,5.488280)..(22.671900,3.679690)
	--(5.632810,3.679690)..controls (5.632810,5.519530) and (5.777340,7.917970)..(9.054690,7.917970)
	--cycle;
fill (19.250000,7.917970)--cycle;
fill (19.277300,8.980470)..controls (19.894501,9.753910) and (22.925800,14.847700)..(16.992201,20.039101)
	..controls (16.992201,20.039101) and (14.613300,17.152300)..(14.218800,12.882800)
	--(12.765600,12.882800)..controls (12.738300,16.804701) and (15.839800,20.863300)..(15.839800,20.863300)
	..controls (18.335899,25.269501) and (10.136700,25.285200)..(12.398400,20.863300)
	..controls (5.476560,15.527300) and (8.558590,9.656250)..(9.070310,8.980470)
	--cycle;
fill (19.277300,8.980470)--cycle;
endfig;
end
