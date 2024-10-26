  input mpchess
  


  beginfig(1);
  init_backboard;
  draw backboard;
  endfig;

  beginfig(2);
  set_color_theme("Dotted");
  init_backboard;
  draw backboard;
  endfig;


def buildUserSquare(expr _SquareUnit)=
    _blackSquarePic:=image(
        fill (unitsquare scaled _SquareUnit) withcolor red;
    );
    _whiteSquarePic:=image(
        fill unitsquare scaled _SquareUnit withcolor green;
    );
enddef;
beginfig(3);
set_color_theme("User");
init_backboard;
draw backboard;
endfig;

end.