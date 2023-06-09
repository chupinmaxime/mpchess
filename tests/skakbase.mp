% This is `skakbase.mf' version 1.0 as of 6/99
% based on original work by Piet Tutelaers
% Modified by Torben Hoffmann: smaller pieces and nicer looking knight

% In this file all pieces are defined.
% The points defining a piece are all in the unitsquare
%   (0,0)--(0,1)--(1,1)--cycle.


def g(expr x)   = (.5+(x-.5)*.87) enddef;
def f(expr x,y) = (g(x)+figshift,g(y)+lift) enddef;

def dark_square(expr D) =
  clearit; L:=min(D/4, 9); delta:=1/L;
  pickup fine_pen;
  for i=1 upto min(D/4,9):
     draw (0,delta*i*D)--(D-delta*i*D,D);
     draw (delta*i*D,0)--(D,D-delta*i*D);
     endfor;
  draw (0,0)--(D,D);
  enddef;
  
def erase_square(expr D, col, row) =
  currentpicture:=board;
  erase fill (0,0)--(0,1)--(1,1)--(1,0)--cycle scaled D shifted(col*D, row*D);
  board:=currentpicture;
  enddef;
  
def empty_board(expr D) =
   picture board; path border;
   border = ((0,0)--(1,0)--(1,1)--(0,1)--cycle);
   dark_square(D); board:=nullpicture;
   for i=0 upto M-1:
   for j=0 upto M-1:
      if not odd(i+j): addto board also currentpicture shifted (D*i,D*j) fi;
      endfor
      endfor;
   clearit;
   pickup border_pen;
   draw  border scaled (M*D);
   addto board also currentpicture;
   currentpicture:=board;
   enddef;
   
% def reflect(text t) =
%    forsuffixes $=t: z$'=z$ reflectedabout (z1,z2); endfor;
%    enddef;
def reflect(text t) =
   forsuffixes $=t: x$'=1-x$+2figshift; y$'=y$; endfor;
   enddef;

def opr(suffix $) = (g(x$+thick#/d#), y$) enddef; % one point right
def opl(suffix $) = (g(x$-thick#/d#), y$) enddef; % one point left
def opu(suffix $) = (x$, g(y$+thick#/d#)) enddef; % one point up
def opd(suffix $) = (x$, g(y$-thick#/d#)) enddef; % one point down
def opur(suffix $) = f(x$+thick#/d#,y$+thick#/d#) enddef;
    % one point up and right 
def opul(suffix $) = f(x$-thick#/d#,y$+thick#/d#) enddef;
    % one point up and left 



vardef K(expr D, col, row) =
  clearxy;
  path cross_bar, crown, crown_top, crown_left, crown_right, crown_lower,
      crown_top_inner, crown_left_inner, crown_right_inner;
  def moved = scaled D shifted (col*D, row*D) enddef;
      
  %pickup hairline_pen;
% draw cross 
  z1=f(.5,.96); z2=f(.5,.8); z11=f(.42,.9); reflect(11);
%  cutdraw (z1--z2) moved; cutdraw (z11--z11') moved;
    draw (z1--z2) moved; draw (z11--z11') moved;
% top part of crown
  z3=f(.5,.38); z21=f(.475,.5); z22=f(.45,.575); z23=f(.45,.775);
  reflect(21,22,23);
  crown_top= ((z3..z21..z22..z23..z2..z23'..z22'..z21'..z3) & cycle);
% left and right part
  z31=z21; z32=z22; z33=f(.32,.67); z34=f(.13,.69); z35=f(.07,.55);
  z36=f(.13,.45); z37=f(.2,.34);
  reflect(31, 32, 33, 34, 35, 36, 37);
  crown_left=(z3..z31..z33..z34..z35..z36..z37);
  crown_right=(z37'..z36'..z35'..z34'..z33'..z31'..z3);
% lower part of the crown
%  z6=f(.5,.095); z61=f(.27,.12); z62=f(.2,.15); z63=f(.21,.23);
  z6=f(.5,.095); z61=(x62,.09); z62=f(.2,.15); z63=f(.21,.23); 
  reflect(61, 62, 63);
%  crown_lower= ((z37--z63) & (z63--z62) & (z62..z61..z6..z61'..z62') &
  crown_lower= ((z37--z63) & (z63--z62) & (z62..controls z61 and z61'..z62') &
   (z62'--z63') & (z63'--z37') & (z37'..z3..z37) & cycle);
% draw contour of crown
  pickup thin_pen;
  crown= crown_left & z37..z3..z37' & crown_right & cycle;
  if background=dark: erase fill crown moved;
    erase fill crown_top moved;
    erase fill crown_lower moved;fi;
  draw crown moved;  draw crown_top moved;
  if color=black: 
     z121=f(.5,.5); z123=f(.45,.675); z102=f(.5,.77);
     reflect(123);
     crown_top_inner = (z121{curl 0}..z123..z102..z123'..{curl 0}z121 & cycle);
     z131=f(.45,.5); z133=f(.32,.64); z134=f(.13,.66); z135=f(.10,.55);
     z136=f(.16,.45); z137=f(.22,.36); z103=f(.475,.4);
     crown_left_inner= ((z103..z131..z133..z134..z135..z136..z137)
        & (z137..{right}z103) & cycle);
     crown_right_inner=crown_left_inner reflectedabout (z1,z2);
     fill crown_top_inner moved;
     fill crown_left_inner moved;
     fill crown_right_inner moved;
     fill crown_lower moved;
  else: draw crown_lower moved;
  fi;
% draw inner parts
  z4=f(.5,.28); z5=f(.5,.21);
  if color=white:
     draw (z37..z3..z37') moved;
     draw (z63..z4..z63') moved;
     draw (z62..z5..z62') moved;
  else: pickup thick_pen;
     erase draw (opr(37)..z3..opl(37')) moved;
     erase draw (opr(63)..z4..opl(63')) moved;
     erase draw (opr(62)..z5..opl(62')) moved;
  fi;
  enddef;
  
vardef Q(expr D, col, row) =
  clearxy;
  path crown_top, crown, crown_lower;
  def moved = scaled D shifted (col*D, row*D) enddef;
  
  pickup thin_pen;
% top part of crown
  z1=f(.5,.92); z2=f(.5,.5); z11=f(.42,.46); z12=f(.275,.88);
  z13=f(.25,.44); z14=f(.075,.8); z15=f(.125,.4); 
  reflect(11,12,13,14,15);
  crown_top = (z15'--z14'--z13'--z12'--z11'--z1--z11--z12--z13--z14--z15);
% lower part of the crown
%  z6=f(.5,.0775); z61=f(.25,.1); z62=f(.18,.125); z63=f(.22,y62+1/3(y15-y62));
  z6=f(.5,.0775); z61=f(.18,0.05); z62=f(.18,.125); z63=(g(.22)+figshift,y62+1/3(y15-y62));
  z64=(g(.19)+figshift,y62+2/3(y15-y62)); z65=(g(.15)+figshift,y64+1/3(y15-y64)); 
  reflect(61,62,63,64,65);
%  crown_lower= ((z15--z64) & (z64--z63) & (z63--z62) &
  crown_lower= ((z15..z65..z64) & (z64..z63..z62) &
    (z62..controls z61 and z61'..z62') &
    (z62'..z63'..z64') & (z64'..z65'..z15'));
% draw contour of crown
  crown= (crown_top & crown_lower & cycle);
  if background=dark:
     if color=white: erase fill crown moved; fi; fi;
  if color=white: draw crown moved;
     forsuffixes $:=1,12,12',14,14':
        erase fill (fullcircle scaled .1 shifted z$) moved; 
        draw (fullcircle scaled .1 shifted z$) moved; endfor;
  else: fill crown moved;
     forsuffixes $:=1,12,12',14,14':
        fill (fullcircle scaled .1 shifted z$) moved; endfor; fi;
% draw inner parts
    z3=(.5+figshift,y5+(y64-y62)); z4=(.5+figshift,y5+(y63-y62)); z5=f(.5,.17); 
    z67=(x62,y62+.7(y62-y61));
    reflect(67);
  if color=white: draw (z64..z3..z64') moved; draw (z63..z4..z63') moved;
%     draw (z62..z5..z62') moved;
    draw (z62..controls z67 and z67'..z62') moved;
     z21=z11; z22=f(.325,.475); z23=z13; z24=f(.175,.44); z25=z15;
     reflect(21,22,23,24,25);
     draw ((z2..z21..z22) & (z22..z23..z24) & (z24--z25)) moved;
     draw ((z2..z21'..z22') & (z22'..z23'..z24') & (z24'--z25')) moved;
  else: pickup thick_pen;
     erase draw (opr(64)..z3..opl(64')) moved;
     erase draw (opr(63)..z4..opl(63')) moved;
     z72=f(.25,.14); z73=(x72+0.08,y72+.9(y67-y62));
     reflect(72,73);
%    erase draw (opr(62)..z5..opl(62')) moved;
     erase draw (z72..controls z73 and z73'..z72') moved;
  fi;
  enddef;
  
  
vardef N(expr D, col, row) =
  clearxy;
  path knight, ear, eye, nose, mouth, neck;
  def moved = scaled D shifted (col*D, row*D) enddef;
  
  pickup thin_pen;
% the knight's contour
  z1=f(.5,.82); z2=f(.5,.075); z11=f(.45,.93); z12=f(.375,.85);
  z13=f(.25,.925);
  z14=f(.26,.8); z15=f(.22,.75); z16=f(.18,.7); z17=f(.18,.66); z18=f(.07,.42);
  z19=f(.07,.36); z20=f(.14,.3); z21=f(.17,.3); z22=f(.175,.275);
  z23=f(.225,.28);
  z24=f(.29,.38); z25=f(.41,.46); z26=f(.49,.51); z27=f(.435,.295);
%  z28=f(.32,.165);
%  z29=(.31,y2); z30=(.93,y2); z31=(.87,.5); z32=(.7,.78);
  z28=f(.34,.18);
  z29=(g(.33)+figshift,y2); z30=(g(.92)+figshift,y2); z31=f(.85,.5); z32=f(.73,.72);
  knight = ((z1--z11--z12--z13--z14) &
     (z14..z15..z16..z17..z18..z19..z20..z21) &
     (z21..z22..z23..z24..z25..z26) &
     (z26..z27..z28..z29) & (z29--z30) &
     (z30..z31..z32..z1) &cycle);
% draw contour of knight
  if color=white: erase fill knight moved;
     draw knight moved;
  else: fill knight moved; fi;
% draw inner parts
  z4=f(.22,.62); z41=f(.25,.67); z42=f(.29,.705); z43=f(.31,.7); z44=f(.3,.68);
  eye = (z4..z41..z42..z43 & z43..z44..z4 & cycle);
  z5=f(.1,.36); z51=f(.1,.39); z52=f(.135,.43); z53=f(.15,.4); z54=f(.13,.38);
  nose = (z5..z51..z52..z53..z54..z5 &cycle);
  if color=white: z21'=f(.2,.34); draw (z21'--z21) moved; %mouth
     z26'=f(.54,.63); draw (z26'..z26{z24-z26}) moved; %neck
     draw (z12--z14) moved; % ear
     fill eye moved; fill nose moved;
  else: erase fill eye moved; erase fill nose moved; fi;
%  z30'=z30 + f(-thick#/d#,thick#/d#); pickup thick_pen
  z30'=opul(30); pickup thick_pen
     erase draw (.4[opd(1),z1]..opd(32)..1/2[opl(31),z31]..1/2[z30',z30]) moved; % mane 
  enddef;
  
vardef B(expr D, col, row) =
  clearxy;
  path top, hat, brim, mitre, stole;
  def moved = scaled D shifted (col*D, row*D) enddef;

  pickup thin_pen;
% the top circle
  z1=f(.5,.85); z2=f(.5,.8);
  top = (fullcircle scaled .1 shifted z1);
  if color=white: erase fill top moved; draw top moved;
  else: fill top moved; fi;
% the hat
  z3=f(.5,.43); z21=f(.27,.57); z31=f(.35,.4); reflect(21,31);
  hat = (z31'..z21'..z2{(-1,1)}) & (z2{(-1,-1)}..z21..z31);
% the brim
  z4=f(.5,.33); z5=f(.5,.23);
  z41=f(.32,.28); reflect(41);
  brim = ((z31--z41) & (z41..z5..z41') & (z41'--z31'));
% the stole
  z6=f(.5,.15); z7=f(.5,.3); z61=f(.44,.12); z62=f(.25,.1); z63=f(.15,.05);
  z64=f(.09,.11); z65=f(.25,.18); z66=f(.44,.2);
  reflect(61,62,63,64,65,66);
  stole = ((z7..z66..z65..z64) & (z64--z63) & (z63..z62..z61..z6) &
     (z6..z61'..z62'..z63') & (z63'--z64') & (z64'..z65'..z66'..z7) &cycle);
% the mitre
  mitre = (hat & brim & cycle);
  if background=dark:
     if color=white: erase fill mitre moved;  
        erase fill stole moved; fi; fi;
  if color=black: fill mitre moved; fill stole moved;
  else: draw mitre moved; draw stole moved;
     erase fill mitre moved; draw mitre moved; fi; 
  
% inner parts of mitre
  center:=g(.59); width:=g(.065);
  if color=white:  draw (z31..z3..z31') moved;  draw (z41..z4..z41') moved;
     draw (f(.5,center-width)--f(.5,center+width)) moved;
     draw (f(.5-width,center)--f(.5+width,center)) moved;
  else: pickup thick_pen;
     erase cutdraw (opr(31)..z3..opl(31')) moved;
     erase cutdraw (opr(41)..z4..opl(41')) moved;
     erase cutdraw (f(.5,center-width)--f(.5,center+width)) moved;
     erase cutdraw (f(.5-width,center)--f(.5+width,center)) moved;
  fi;
  enddef;
  
vardef p(expr D, col, row) =
  clearxy;
  path pawn;
  def moved = scaled D shifted (col*D, row*D) enddef;

  pickup thin_pen;
% the pawn's contour
%  z1=(.5,.9); z2=(.5,.1); z11=(.41,.85); z12=(.46,.73); z13=(.32,.6);
%  z14=(.41,.46); z15=(.3,.4); z16=(.2,.1);

  z1=f(.5,.9);
  z2=f(.5,.1); z11=f(.41,.85); z12=f(.46,.73); z13=f(.32,.6);
  z14=f(.41,.46); z15=f(.3,.4);  z16=f(.2,.1);
  reflect(11,12,13,14,15,16);
  pawn = ((z12'..z11'..z1..z11..z12) &
     (z12..z13..z14) &
     (z14..z15..z16) &
     (z16--z16') &
     (z16'..z15'..z14') &
     (z14'..z13'..z12') & cycle);

% draw contour of pawn
  if background=dark:
     if color=white: erase fill pawn moved;  fi; fi;
  if color=black: fill pawn moved;
  else: draw pawn moved; fi; 
  enddef;

% the rook should be shrunk slightly less than the other pieces  
%def g(expr x)   = .5+(x-.5)*.9 enddef;
  def rookscale(expr x) = .5+(x-.5)*.95 enddef;
  def j(expr x,y) = (rookscale(x)+figshift,rookscale(y)) enddef;


vardef R(expr D, col, row) =
  clearxy;
  path rook;
  def moved = scaled D shifted (col*D, row*D) enddef;
  
  pickup thin_pen;
% top part of rook
  z1=j(.5,.86); y15=y14=y11=y1; x15=x16=rookscale(.21)+figshift; 
  x19=x20=rookscale(.225)+figshift; y13=y12=rookscale(.8);
  y16=rookscale(.725); y17=rookscale(.65); y18=rookscale(.35); y19=rookscale(.26); y20=y21=rookscale(.175); y22=rookscale(.1);
  x22=x21=rookscale(.175)+figshift; x17=x18=rookscale(.31)+figshift; 
  x13=x14=rookscale(.325)+figshift; x11=x12=rookscale(.43)+figshift;
  z2=j(.5,.1);
  reflect(11,12,13,14,15,16,17,18,19,20,21,22);
  rook = (z11--z12--z13--z14--z15--z16--z17--z18--z19--z20--z21--z22--z22'
     --z21'--z20'--z19'--z18'--z17'--z16'--z15'--z14'--z13'--z12'--z11'--cycle);
% draw contour of rook
  if background=dark:
     if color=white: erase fill rook moved; fi; fi;
  if color=white: draw rook moved; else: fill rook moved; fi;
% draw inner parts
  if color=white: draw (z16--z16') moved; draw (z17--z17') moved;
     draw (z18--z18') moved; draw (z19--z19') moved;
     draw (z20--z20') moved;
  else: pickup thick_pen;
     erase draw (opr(16)--opl(16')) moved;
     erase draw (opr(17)--opl(17')) moved;
     erase draw (opr(18)--opl(18')) moved;
     erase draw (opr(19)--opl(19')) moved;
     erase draw (opr(20)--opl(20')) moved; fi;
  enddef;


  




