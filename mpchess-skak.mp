% This is `skak30.mf' version 1.0 as of 7/99
% based on original work by Piet Tutelaers
% Modified by Torben Hoffmann: smaller pieces and nicer looking knight

% Parameters needed for a 30 points chess font. 
% A complete chess diagram is 240 X 240 points.


M=1; % number of squares
d:=1pt/M;   % size per square
lift=0;
figshift:=0;
u:=d;
fine:=1/100*d; thin:=1/90*d; thick:=1/36*d; border:=1/20*d;
show thin;

pen fine_pen, border_pen, thin_pen, thick_pen,hairline_pen;
pickup pencircle scaled 1.5; hairline_pen:=currentpen ; %for drawing king's cross
pickup pencircle scaled 2.5; fine_pen:=currentpen ; % for drawing dark squares
pickup pencircle scaled 1.8; border_pen:=currentpen ; % for border ofboard
pickup pencircle scaled 0.7; thin_pen:=currentpen ; % for drawing pieces
pickup pencircle scaled 0.8; thick_pen:=currentpen; % for drawing inside pieces
light=0; dark=1;% white=0; black=1;


% This is `skakbase.mf' version 1.0 as of 6/99
% based on original work by Piet Tutelaers
% Modified by Torben Hoffmann: smaller pieces and nicer looking knight

% In this file all pieces are defined.
% The points defining a piece are all in the unitsquare
%   (0,0)--(0,1)--(1,1)--cycle.


def _chess_g(expr x)   = (.5+(x-.5)*.87) enddef;
def _chess_f(expr x,y) = (_chess_g(x)+figshift,_chess_g(y)+lift) enddef;

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

def opr(suffix $) = (_chess_g(x$+thick/d), y$) enddef; % one point right
def opl(suffix $) = (_chess_g(x$-thick/d), y$) enddef; % one point left
def opu(suffix $) = (x$, _chess_g(y$+thick/d)) enddef; % one point up
def opd(suffix $) = (x$, _chess_g(y$-thick/d)) enddef; % one point down
def opur(suffix $) = _chess_f(x$+thick/d,y$+thick/d) enddef;
    % one point up and right 
def opul(suffix $) = _chess_f(x$-thick/d,y$+thick/d) enddef;
    % one point up and left 



vardef _skak_K(expr D, col, row,wb) =
  clearxy;
  path cross_bar, crown, crown_top, crown_left, crown_right, crown_lower,
      crown_top_inner, crown_left_inner, crown_right_inner;
  def moved = scaled D shifted (col*D, row*D) enddef;
      
  pickup hairline_pen;
% draw cross 
  z1=_chess_f(.5,.96); z2=_chess_f(.5,.8); z11=_chess_f(.42,.9); reflect(11);
%  cutdraw (z1--z2) moved; cutdraw (z11--z11') moved;
    draw (z1--z2) moved; draw (z11--z11') moved;
% top part of crown
  z3=_chess_f(.5,.38); z21=_chess_f(.475,.5); z22=_chess_f(.45,.575); z23=_chess_f(.45,.775);
  reflect(21,22,23);
  crown_top= ((z3..z21..z22..z23..z2..z23'..z22'..z21'..z3) & cycle);
% left and right part
  z31=z21; z32=z22; z33=_chess_f(.32,.67); z34=_chess_f(.13,.69); z35=_chess_f(.07,.55);
  z36=_chess_f(.13,.45); z37=_chess_f(.2,.34);
  reflect(31, 32, 33, 34, 35, 36, 37);
  crown_left=(z3..z31..z33..z34..z35..z36..z37);
  crown_right=(z37'..z36'..z35'..z34'..z33'..z31'..z3);
% lower part of the crown
%  z6=_chess_f(.5,.095); z61=_chess_f(.27,.12); z62=_chess_f(.2,.15); z63=_chess_f(.21,.23);
  z6=_chess_f(.5,.095); z61=(x62,.09); z62=_chess_f(.2,.15); z63=_chess_f(.21,.23); 
  reflect(61, 62, 63);
%  crown_lower= ((z37--z63) & (z63--z62) & (z62..z61..z6..z61'..z62') &
  crown_lower= ((z37--z63) & (z63--z62) & (z62..controls z61 and z61'..z62') &
   (z62'--z63') & (z63'--z37') & (z37'..z3..z37) & cycle);
% draw contour of crown
  
  crown= crown_left & z37..z3..z37' & crown_right & cycle;
  %if background=dark: erase fill crown moved;
  %  erase fill crown_top moved;
  %  erase fill crown_lower moved;fi;
  
  if wb="black":
     fill crown moved;  fill crown_top moved;
     z121=_chess_f(.5,.5); z123=_chess_f(.45,.675); z102=_chess_f(.5,.77);
     reflect(123);
     crown_top_inner = (z121{curl 0}..z123..z102..z123'..{curl 0}z121 & cycle);
     z131=_chess_f(.45,.5); z133=_chess_f(.32,.64); z134=_chess_f(.13,.66); z135=_chess_f(.10,.55);
     z136=_chess_f(.16,.45); z137=_chess_f(.22,.4); z103=_chess_f(.475,.44);
     crown_left_inner= ((z103..z131..z133..z134..z135..z136..z137)
        & (z137..{right}z103) & cycle);
     crown_right_inner=crown_left_inner reflectedabout (z1,z2);
     pickup thin_pen;
     draw crown_top_inner moved withcolor white;
     draw crown_left_inner moved withcolor white;
     draw crown_right_inner moved withcolor white;
     filldraw crown_lower moved ;
  else: 
    fill crown_lower moved withcolor white;
    draw crown_lower moved; 
  fi;
% draw inner parts
    
  z4=_chess_f(.5,.28); z5=_chess_f(.5,.21);
  if wb="white":
    fill crown moved withcolor white;  fill crown_top moved withcolor white;
     draw (z37..z3..z37') moved;
     draw (z63..z4..z63') moved;
     draw (z62..z5..z62') moved;
     draw crown moved;  draw crown_top moved;
  else: pickup thick_pen;
    draw crown moved;  draw crown_top moved;
    draw (opr(37)..z3..opl(37')) moved withcolor white;
    draw (opr(63)..z4..opl(63')) moved withcolor white;
    draw (opr(62)..z5..opl(62')) moved withcolor white;
  fi;
  
enddef;

vardef _skak_Q(expr D, col, row,wb) =
pickup hairline_pen;
  clearxy;
  path crown_top, crown, crown_lower;
  def moved = scaled D shifted (col*D, row*D) enddef;
  
  %pickup thin_pen;
% top part of crown
  z1=_chess_f(.5,.92); z2=_chess_f(.5,.5); z11=_chess_f(.42,.46); z12=_chess_f(.275,.88);
  z13=_chess_f(.25,.44); z14=_chess_f(.075,.8); z15=_chess_f(.125,.4); 
  reflect(11,12,13,14,15);
  crown_top = (z15'--z14'--z13'--z12'--z11'--z1--z11--z12--z13--z14--z15);
% lower part of the crown
%  z6=_chess_f(.5,.0775); z61=_chess_f(.25,.1); z62=_chess_f(.18,.125); z63=_chess_f(.22,y62+1/3(y15-y62));
  z6=_chess_f(.5,.0775); z61=_chess_f(.18,0.05); z62=_chess_f(.18,.125); z63=(_chess_g(.22)+figshift,y62+1/3(y15-y62));
  z64=(_chess_g(.19)+figshift,y62+2/3(y15-y62)); z65=(_chess_g(.15)+figshift,y64+1/3(y15-y64)); 
  reflect(61,62,63,64,65);
%  crown_lower= ((z15--z64) & (z64--z63) & (z63--z62) &
  crown_lower= ((z15..z65..z64) & (z64..z63..z62) &
    (z62..controls z61 and z61'..z62') &
    (z62'..z63'..z64') & (z64'..z65'..z15'));
% draw contour of crown
  crown= (crown_top & crown_lower & cycle);
  
  if wb="white": 
    fill crown moved withcolor white;
    draw crown moved;
     forsuffixes $:=1,12,12',14,14':
        erase fill (fullcircle scaled .1 shifted z$) moved; 
        draw (fullcircle scaled .1 shifted z$) moved; endfor;
  else: 
    fill crown moved;
    forsuffixes $:=1,12,12',14,14':
    fill (fullcircle scaled .1 shifted z$) moved; endfor; fi;
% draw inner parts
    z3=(.5+figshift,y5+(y64-y62)); z4=(.5+figshift,y5+(y63-y62)); z5=_chess_f(.5,.17); 
    z67=(x62,y62+.7(y62-y61));
    reflect(67);
  if wb="white": draw (z64..z3..z64') moved; draw (z63..z4..z63') moved;
%     draw (z62..z5..z62') moved;
    draw (z62..controls z67 and z67'..z62') moved;
     z21=z11; z22=_chess_f(.325,.475); z23=z13; z24=_chess_f(.175,.44); z25=z15;
     reflect(21,22,23,24,25);
     draw ((z2..z21..z22) & (z22..z23..z24) & (z24--z25)) moved;
     draw ((z2..z21'..z22') & (z22'..z23'..z24') & (z24'--z25')) moved;
  else: 
    pickup thick_pen;
    erase draw (opr(64)..z3..opl(64')) moved;
    erase draw (opr(63)..z4..opl(63')) moved;
    z72=_chess_f(.25,.14); z73=(x72+0.08,y72+.9(y67-y62));
    reflect(72,73);
%   erase draw (opr(62)..z5..opl(62')) moved;
    erase draw (z72..controls z73 and z73'..z72') moved;
  fi;
enddef;

vardef _skak_N(expr D, col, row,wb) =
  clearxy;
  path knight, ear, eye, nose, mouth, neck;
  def moved = scaled D shifted (col*D, row*D) enddef;
  
  pickup hairline_pen;
% the knight's contour
  z1=_chess_f(.5,.82); z2=_chess_f(.5,.075); z11=_chess_f(.45,.93); z12=_chess_f(.375,.85);
  z13=_chess_f(.25,.925);
  z14=_chess_f(.26,.8); z15=_chess_f(.22,.75); z16=_chess_f(.18,.7); z17=_chess_f(.18,.66); z18=_chess_f(.07,.42);
  z19=_chess_f(.07,.36); z20=_chess_f(.14,.3); z21=_chess_f(.17,.3); z22=_chess_f(.175,.275);
  z23=_chess_f(.225,.28);
  z24=_chess_f(.29,.38); z25=_chess_f(.41,.46); z26=_chess_f(.49,.51); z27=_chess_f(.435,.295);
%  z28=_chess_f(.32,.165);
%  z29=(.31,y2); z30=(.93,y2); z31=(.87,.5); z32=(.7,.78);
  z28=_chess_f(.34,.18);
  z29=(_chess_g(.33)+figshift,y2); z30=(_chess_g(.92)+figshift,y2); z31=_chess_f(.85,.5); z32=_chess_f(.73,.72);
  knight = ((z1--z11--z12--z13--z14) &
     (z14..z15..z16..z17..z18..z19..z20..z21) &
     (z21..z22..z23..z24..z25..z26) &
     (z26..z27..z28..z29) & (z29--z30) &
     (z30..z31..z32..z1) &cycle);
% draw contour of knight
  if wb="white": erase fill knight moved;
     draw knight moved;
  else: fill knight moved; fi;
% draw inner parts
  z4=_chess_f(.22,.62); z41=_chess_f(.25,.67); z42=_chess_f(.29,.705); z43=_chess_f(.31,.7); z44=_chess_f(.3,.68);
  eye = (z4..z41..z42..z43 & z43..z44..z4 & cycle);
  z5=_chess_f(.1,.36); z51=_chess_f(.1,.39); z52=_chess_f(.135,.43); z53=_chess_f(.15,.4); z54=_chess_f(.13,.38);
  nose = (z5..z51..z52..z53..z54..z5 &cycle);
  if wb="white": z21'=_chess_f(.2,.34); draw (z21'--z21) moved; %mouth
     z26'=_chess_f(.54,.63); draw (z26'..z26{z24-z26}) moved; %neck
     draw (z12--z14) moved; % ear
     fill eye moved; fill nose moved;
  else: erase fill eye moved; erase fill nose moved; fi;
%  z30'=z30 + _chess_f(-thick#/d#,thick#/d#); pickup thick_pen
  z30'=opul(30); pickup thick_pen
     erase draw (.4[opd(1),z1]..opd(32)..1/2[opl(31),z31]..1/2[z30',z30]) moved; % mane 
enddef;

vardef _skak_B(expr D, col, row,wb) =
  clearxy;
  path top, hat, brim, mitre, stole;
  def moved = scaled D shifted (col*D, row*D) enddef;

  pickup hairline_pen;
% the top circle
  z1=_chess_f(.5,.85); z2=_chess_f(.5,.8);
  top = (fullcircle scaled .1 shifted z1);
  if wb="white": erase fill top moved; draw top moved;
  else: fill top moved; fi;
% the hat
  z3=_chess_f(.5,.43); z21=_chess_f(.27,.57); z31=_chess_f(.35,.4); reflect(21,31);
  hat = (z31'..z21'..z2{(-1,1)}) & (z2{(-1,-1)}..z21..z31);
% the brim
  z4=_chess_f(.5,.33); z5=_chess_f(.5,.23);
  z41=_chess_f(.32,.28); reflect(41);
  brim = ((z31--z41) & (z41..z5..z41') & (z41'--z31'));
% the stole
  z6=_chess_f(.5,.15); z7=_chess_f(.5,.3); z61=_chess_f(.44,.12); z62=_chess_f(.25,.1); z63=_chess_f(.15,.05);
  z64=_chess_f(.09,.11); z65=_chess_f(.25,.18); z66=_chess_f(.44,.2);
  reflect(61,62,63,64,65,66);
  stole = ((z7..z66..z65..z64) & (z64--z63) & (z63..z62..z61..z6) &
     (z6..z61'..z62'..z63') & (z63'--z64') & (z64'..z65'..z66'..z7) &cycle);
% the mitre
  mitre = (hat & brim & cycle);
  
  if wb="black": fill mitre moved; fill stole moved;
  else: 
  draw stole moved;
  erase fill stole moved;
  draw stole moved; 
  
  draw mitre moved; 
  erase fill mitre moved;
  draw mitre moved;
  fi; 
  
% inner parts of mitre
  center_:=_chess_g(.59); width:=_chess_g(.065);
  if wb="white":  draw (z31..z3..z31') moved;  draw (z41..z4..z41') moved;
     draw (_chess_f(.5,center_-width)--_chess_f(.5,center_+width)) moved;
     draw (_chess_f(.5-width,center_)--_chess_f(.5+width,center_)) moved;
  else: pickup thick_pen;
     erase cutdraw (opr(31)..z3..opl(31')) moved;
     erase cutdraw (opr(41)..z4..opl(41')) moved;
     erase cutdraw (_chess_f(.5,center_-width)--_chess_f(.5,center_+width)) moved;
     erase cutdraw (_chess_f(.5-width,center_)--_chess_f(.5+width,center_)) moved;
  fi;
enddef;


  def _skak_rookscale(expr x) = .5+(x-.5)*.95 enddef;
  def _skak_j(expr x,y) = (_skak_rookscale(x)+figshift,_skak_rookscale(y)) enddef;

vardef _skak_R(expr D, col, row,wb) =
  clearxy;
  path rook;
  def moved = scaled D shifted (col*D, row*D) enddef;
  
  pickup hairline_pen;
% top part of rook
  z1=_skak_j(.5,.86); y15=y14=y11=y1; x15=x16=_skak_rookscale(.21)+figshift; 
  x19=x20=_skak_rookscale(.225)+figshift; y13=y12=_skak_rookscale(.8);
  y16=_skak_rookscale(.725); y17=_skak_rookscale(.65); y18=_skak_rookscale(.35); y19=_skak_rookscale(.26); y20=y21=_skak_rookscale(.175); y22=_skak_rookscale(.1);
  x22=x21=_skak_rookscale(.175)+figshift; x17=x18=_skak_rookscale(.31)+figshift; 
  x13=x14=_skak_rookscale(.325)+figshift; x11=x12=_skak_rookscale(.43)+figshift;
  z2=_skak_j(.5,.1);
  reflect(11,12,13,14,15,16,17,18,19,20,21,22);
  rook = (z11--z12--z13--z14--z15--z16--z17--z18--z19--z20--z21--z22--z22'
     --z21'--z20'--z19'--z18'--z17'--z16'--z15'--z14'--z13'--z12'--z11'--cycle);
% draw contour of rook
 
  if wb="white": fill rook moved withcolor white; draw rook moved; else: fill rook moved; fi;
% draw inner parts
  if wb="white": draw (z16--z16') moved; draw (z17--z17') moved;
     draw (z18--z18') moved; draw (z19--z19') moved;
     draw (z20--z20') moved;
  else: pickup thick_pen;
     erase draw (opr(16)--opl(16')) moved;
     erase draw (opr(17)--opl(17')) moved;
     erase draw (opr(18)--opl(18')) moved;
     erase draw (opr(19)--opl(19')) moved;
     erase draw (opr(20)--opl(20')) moved; fi;
  enddef;

  vardef _skak_p(expr D, col, row,wb) =
  clearxy;
  path pawn;
  def moved = scaled D shifted (col*D, row*D) enddef;

  pickup hairline_pen;
% the pawn's contour
%  z1=(.5,.9); z2=(.5,.1); z11=(.41,.85); z12=(.46,.73); z13=(.32,.6);
%  z14=(.41,.46); z15=(.3,.4); z16=(.2,.1);

  z1=_chess_f(.5,.9);
  z2=_chess_f(.5,.1); z11=_chess_f(.41,.85); z12=_chess_f(.46,.73); z13=_chess_f(.32,.6);
  z14=_chess_f(.41,.46); z15=_chess_f(.3,.4);  z16=_chess_f(.2,.1);
  reflect(11,12,13,14,15,16);
  pawn = ((z12'..z11'..z1..z11..z12) &
     (z12..z13..z14) &
     (z14..z15..z16) &
     (z16--z16') &
     (z16'..z15'..z14') &
     (z14'..z13'..z12') & cycle);

% draw contour of pawn
  
  if wb="black": fill pawn moved;
  else: fill pawn moved withcolor white; draw pawn moved; fi; 
enddef;

picture _chess_skak_bB,_chess_skak_bK,_chess_skak_bN,_chess_skak_bP,_chess_skak_bQ,_chess_skak_bR;
picture _chess_skak_wB,_chess_skak_wK,_chess_skak_wN,_chess_skak_wP,_chess_skak_wQ,_chess_skak_wR;

_chess_skak_bB:=image(_skak_B(2cm,0,0,"black"));
_chess_skak_bK:=image(_skak_K(2cm,0,0,"black"));
_chess_skak_bN:=image(_skak_N(2cm,0,0,"black"));
_chess_skak_bP:=image(_skak_p(2cm,0,0,"black"));
_chess_skak_bQ:=image(_skak_Q(2cm,0,0,"black"));
_chess_skak_bR:=image(_skak_R(2cm,0,0,"black"));

_chess_skak_wB:=image(_skak_B(2cm,0,0,"white"));
_chess_skak_wK:=image(_skak_K(2cm,0,0,"white"));
_chess_skak_wN:=image(_skak_N(2cm,0,0,"white"));
_chess_skak_wP:=image(_skak_p(2cm,0,0,"white"));
_chess_skak_wQ:=image(_skak_Q(2cm,0,0,"white"));
_chess_skak_wR:=image(_skak_R(2cm,0,0,"white"));