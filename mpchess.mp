%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                        mpchess.mp                          %%
%%              draw chessboards with metapost                %%
%%                chupin@ceremade.dauphine.fr                 %%
%%                Version 0.1 (Février 2023)                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% This work may be distributed and/or modified under the conditions of
% the LaTeX Project Public License, either version 1.3c of this license
% or (at your option) any later version.  The latest version of this
% license is in http://www.latex-project.org/lppl.txt
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

input format;
input hatching;
input cburnett; % piece of lichess cburnett
input mpchess-chessboard;
input latexmp;
if not known mplib: input latexmp fi;

warningcheck:=0;

% pieces
picture _chess_bB, _chess_bK, _chess_bN,_chess_bP, _chess_bQ, _chess_bR;
picture _chess_wB, _chess_wK, _chess_wN,_chess_wP, _chess_wQ, _chess_wR;

% coordinates font
string _coords_font;
_coords_font:=defaultfont;

def set_coords_font(expr f)=
    _coords_font:=f ;
enddef;

% player name
string _chess_white_player, _chess_black_player;
_chess_white_player:="";
_chess_black_player:="";

def set_white_player(expr s)=
    _chess_white_player:=s;
enddef;


def set_black_player(expr s)=
    _chess_black_player:=s;
enddef;

% boolean to choose the side view
boolean _chess_view_wb;
_chess_view_wb := true; % true for white

def set_black_view=
    _chess_view_wb := false;
enddef;

def set_white_view=
    _chess_view_wb := true;
enddef;

% boolean to choose if we print coordinates
boolean _chess_print_coords;
_chess_print_coords:=true;

def set_no_coords=
    _chess_print_coords:=false;
enddef;

def set_coords=
    _chess_print_coords:=true;
enddef;

% integer correspondance :
_intWPawn:=1;
_intBPawn:=-1;
_intWKnight:=2;
_intBKnight:=-2;
_intWBishop:=3;
_intBBishop:=-3;
_intWRook:=4;
_intBRook:=-4;
_intWQueen:=5;
_intBQueen:=-5;
_intWKing:=6;
_intBKing:=-6;

% unit default
numeric _chessWidth,_chessSquareU;
_chessWidth:=5cm;
_chessSquareU:=_chessWidth/_chessSize;

def set_backboardWidth(expr w)=
    _chessWidth:=w;
enddef;

% theme 
string _chessTheme;
% default
_chessTheme := "BlueLichess";

% color of black and white square
color _blackColorSquare,_whiteColorSquare;
% default
_blackColorSquare:=(0.549,0.6353,0.6784);
_whiteColorSquare:=(0.8706,0.8912,0.902);

% reset backboard
def reset_backboard=
    _chessWidth:=5cm;
    _chessSize:=8;
    _chessSquareU:=_chessWidth/_chessSize;
    _chessTheme := "BlueLichess";
    _blackColorSquare:=(0.549,0.6353,0.6784);
    _whiteColorSquare:=(0.8706,0.8912,0.902);
enddef;




picture _blackSquarePic, _whiteSquarePic;
picture _blackSquareColoredPic, _whiteSquareColoredPic;
picture _blackSquareClassicalPic, _whiteSquareClassicalPic;

def _buildColoredSquare(expr _SquareUnit,_BlackColor,_WhiteColor)=
    _blackSquarePic:=image(
        fill unitsquare scaled _SquareUnit withcolor _BlackColor;
    );
    _whiteSquarePic:=image(
        fill unitsquare scaled _SquareUnit withcolor _WhiteColor;
    );
enddef;

def _buildClassicalSquare(expr _SquareUnit)=
    _blackSquarePic:=image(
        hatchfill (unitsquare  scaled _SquareUnit) withcolor (white) withcolor (45,0.4*_SquareUnit/6 bp,-0.2bp);
    );
    _whiteSquarePic:=image(
        fill unitsquare scaled _SquareUnit withcolor white;
    );
enddef;

% default theme lichess blue
_blackSquarePic:=_blackSquareColoredPic;
_whiteSquarePic:=_whiteSquareColoredPic;

def usetheme(expr t)=
    _chessTheme := t; 
    if(t="BlueLichess"):
        _blackColorSquare:=(0.549,0.6353,0.6784);
        _whiteColorSquare:=(0.8706,0.8912,0.902);
    fi
enddef;

def set_whiteColor(expr c)=
    _whiteColorSquare:=c;
enddef;

def set_blackColor(expr c)=
    _blackColorSquare:=c;
enddef;

_chess_bB:=_chess_cburnett_bB;
_chess_bK:=_chess_cburnett_bK;
_chess_bN:=_chess_cburnett_bN;
_chess_bP:=_chess_cburnett_bP;
_chess_bQ:=_chess_cburnett_bQ;
_chess_bR:=_chess_cburnett_bR;


_chess_wB:=_chess_cburnett_wB;
_chess_wK:=_chess_cburnett_wK;
_chess_wN:=_chess_cburnett_wN;
_chess_wP:=_chess_cburnett_wP;
_chess_wQ:=_chess_cburnett_wQ;
_chess_wR:=_chess_cburnett_wR;


def init_piece(expr w)=
    begingroup
    bboxmargin:=0pt;
    _chess_marginBottom:=0.15w;
    % the queen as reference
    %bQ
    _chess_bQ_width:=abs((urcorner _chess_bQ)-(ulcorner _chess_bQ));
    ratio:= (0.8w/_chess_bQ_width);
    _chess_bQ:=((_chess_bQ shifted -(llcorner _chess_bQ-(bboxmargin,bboxmargin))) scaled  ratio );
    _chess_bQ_width_new:=abs((urcorner _chess_bQ)-(ulcorner _chess_bQ));
    _chess_bQ:= _chess_bQ shifted ((w-_chess_bQ_width_new)*0.5,_chess_marginBottom) ;
    %bB
    _chess_bB:=((_chess_bB shifted -(llcorner _chess_bB-(bboxmargin,bboxmargin))) scaled ratio );
    _chess_bB_width:=abs((urcorner _chess_bB)-(ulcorner _chess_bB));
    _chess_bB:=_chess_bB shifted ((w-_chess_bB_width)*0.5,_chess_marginBottom) ;
    %bK
    _chess_bK:=((_chess_bK shifted -(llcorner _chess_bK-(bboxmargin,bboxmargin))) scaled ratio );
    _chess_bK_width:=abs((urcorner _chess_bK)-(ulcorner _chess_bK));
    _chess_bK:=_chess_bK shifted ((w-_chess_bK_width)*0.5,_chess_marginBottom) ;
    %bN
    _chess_bN:=((_chess_bN shifted -(llcorner _chess_bN-(bboxmargin,bboxmargin))) scaled ratio );
    _chess_bN_width:=abs((urcorner _chess_bN)-(ulcorner _chess_bN));
    _chess_bN:=_chess_bN shifted ((w-_chess_bN_width)*0.5,_chess_marginBottom) ;
    %bP
    _chess_bP:=((_chess_bP shifted -(llcorner _chess_bP-(bboxmargin,bboxmargin))) scaled ratio );
    _chess_bP_width:=abs((urcorner _chess_bP)-(ulcorner _chess_bP));
    _chess_bP:=_chess_bP shifted ((w-_chess_bP_width)*0.5,_chess_marginBottom) ;
    %bR
    _chess_bR:=((_chess_bR shifted -(llcorner _chess_bR-(bboxmargin,bboxmargin))) scaled ratio );
    _chess_bR_width:=abs((urcorner _chess_bR)-(ulcorner _chess_bR));
    _chess_bR:=_chess_bR shifted ((w-_chess_bR_width)*0.5,_chess_marginBottom) ;
    %wQ
    _chess_wQ:=((_chess_wQ shifted -(llcorner _chess_wQ-(bboxmargin,bboxmargin))) scaled ratio );
    _chess_wQ_width:=abs((urcorner _chess_wQ)-(ulcorner _chess_wQ));
    _chess_wQ:=_chess_wQ shifted ((w-_chess_wQ_width)*0.5,_chess_marginBottom) ;
    %wB
    _chess_wB:=((_chess_wB shifted -(llcorner _chess_wB-(bboxmargin,bboxmargin))) scaled ratio );
    _chess_wB_width:=abs((urcorner _chess_wB)-(ulcorner _chess_wB));
    _chess_wB:=_chess_wB shifted ((w-_chess_wB_width)*0.5,_chess_marginBottom) ;
    %wK
    _chess_wK:=((_chess_wK shifted -(llcorner _chess_wK-(bboxmargin,bboxmargin))) scaled ratio );
    _chess_wK_width:=abs((urcorner _chess_wK)-(ulcorner _chess_wK));
    _chess_wK:=_chess_wK shifted ((w-_chess_wK_width)*0.5,_chess_marginBottom) ;
    %wN
    _chess_wN:=((_chess_wN shifted -(llcorner _chess_wN-(bboxmargin,bboxmargin))) scaled ratio );
    _chess_wN_width:=abs((urcorner _chess_wN)-(ulcorner _chess_wN));
    _chess_wN:=_chess_wN shifted ((w-_chess_wN_width)*0.5,_chess_marginBottom) ;
    %wP
    _chess_wP:=((_chess_wP shifted -(llcorner _chess_wP-(bboxmargin,bboxmargin))) scaled ratio );
    _chess_wP_width:=abs((urcorner _chess_wP)-(ulcorner _chess_wP));
    _chess_wP:=_chess_wP shifted ((w-_chess_wP_width)*0.5,_chess_marginBottom) ;
    %wR
    _chess_wR:=((_chess_wR shifted -(llcorner _chess_wR-(bboxmargin,bboxmargin))) scaled ratio );
    _chess_wR_width:=abs((urcorner _chess_wR)-(ulcorner _chess_wR));
    _chess_wR:=_chess_wR shifted ((w-_chess_wR_width)*0.5,_chess_marginBottom) ;
    endgroup
enddef;

def _int_to_letter_w(expr i)=
    if(i=1):
        "a"
    elseif(i=2):
        "b"
    elseif(i=3):
        "c"
    elseif(i=4):
        "d"
    elseif(i=5):
        "e"
    elseif(i=6):
        "f"
    elseif(i=7):
        "g"
    elseif(i=8):
        "h"
    fi
enddef;

def _int_to_letter_b(expr i)=
    if(i=1):
        "h"
    elseif(i=2):
        "g"
    elseif(i=3):
        "f"
    elseif(i=4):
        "e"
    elseif(i=5):
        "d"
    elseif(i=6):
        "c"
    elseif(i=7):
        "b"
    elseif(i=8):
        "a"
    fi
enddef;


def _int_to_str_w(expr i)=
    if(i=1):
        "1"
    elseif(i=2):
        "2"
    elseif(i=3):
        "3"
    elseif(i=4):
        "4"
    elseif(i=5):
        "5"
    elseif(i=6):
        "6"
    elseif(i=7):
        "7"
    elseif(i=8):
        "8"
    fi
enddef;


def _int_to_str_b(expr i)=
    if(i=1):
        "8"
    elseif(i=2):
        "7"
    elseif(i=3):
        "6"
    elseif(i=4):
        "5"
    elseif(i=5):
        "4"
    elseif(i=6):
        "3"
    elseif(i=7):
        "2"
    elseif(i=8):
        "1"
    fi
enddef;

picture backboard;

def init_backboard =
_chessSquareU:=_chessWidth/_chessSize;
init_piece(_chessSquareU);
if(_chessTheme="Classical"):
    _buildClassicalSquare(_chessSquareU);
else: % colored themes
    _buildColoredSquare(_chessSquareU,_blackColorSquare,_whiteColorSquare);
fi
picture _letter_img;
backboard:=image(
    for i:=1 upto _chessSize:
        for j:=1 upto _chessSize:
            if(odd((i-1)*_chessSize+j+i)):
                draw _whiteSquarePic
                 shifted ((j-1)*_chessSquareU,(i-1)*_chessSquareU)  ;
            else:
                draw _blackSquarePic shifted ((j-1)*_chessSquareU,(i-1)*_chessSquareU) ;
            fi
            if(_chess_print_coords):
                if(i=1): % lettre on first line
                    _letter_img:=image(
                        if(_chess_view_wb):
                            draw _int_to_letter_w(j) infont _coords_font;
                        else:
                            draw _int_to_letter_b(j) infont _coords_font;
                        fi
                    );
                    if(j=1):
                    _lettre_width:=abs(urcorner _letter_img-ulcorner _letter_img);
                    _lettre_height:=abs(urcorner _letter_img-lrcorner _letter_img);
                    fi
                    draw _letter_img scaled (0.1*_chessSquareU/_lettre_width) shifted  ((j-1)*_chessSquareU+0.8*_chessSquareU,(i-1)*_chessSquareU+0.05*_chessSquareU) ;
                fi
                if(j=1):
                    _letter_img:=image(
                        if(_chess_view_wb):
                            draw _int_to_str_w(i) infont _coords_font;
                        else:
                            draw _int_to_str_b(i) infont _coords_font;
                        fi
                    );
                    if(i=1):
                    _lettre_width:=abs(urcorner _letter_img-ulcorner _letter_img);
                    _lettre_height:=abs(urcorner _letter_img-lrcorner _letter_img);
                    fi
                    draw _letter_img scaled (0.1*_chessSquareU/_lettre_width) shifted  ((j-1)*_chessSquareU+0.05*_chessSquareU,(i-1)*_chessSquareU+0.8*_chessSquareU) ;
                fi
                
            fi
        endfor;
    endfor;
    draw (0,0)--(_chessSize,0)*_chessSquareU--(_chessSize,_chessSize)*_chessSquareU--(0,_chessSize)*_chessSquareU--cycle;
    if(_chess_view_wb):
        if(_chess_white_player<>""):
            label.urt(textext(_chess_white_player),(_chessSize*_chessSquareU,0));
        fi
        if(_chess_black_player<>""):
            label.lrt(textext(_chess_black_player),(_chessSize*_chessSquareU,_chessSize*_chessSquareU));
        fi
    else:
        if(_chess_black_player<>""):
            label.urt(textext(_chess_black_player),(_chessSize*_chessSquareU,0));
        fi
        if(_chess_white_player<>""):
            label.lrt(textext(_chess_white_player),(_chessSize*_chessSquareU,_chessSize*_chessSquareU));
        fi
    fi
);
enddef;

def _int_to_piece(expr i)=
    if(i=_intWPawn):
        _chess_wP
    elseif(i=_intBPawn):
        _chess_bP
    elseif(i=_intWKnight):
        _chess_wN
    elseif(i=_intBKnight):
        _chess_bN
    elseif(i=_intWBishop):
        _chess_wB
    elseif(i=_intBBishop):
        _chess_bB
    elseif(i=_intWRook):
        _chess_wR
    elseif(i=_intBRook):
        _chess_bR
    elseif(i=_intWQueen):
        _chess_wQ
    elseif(i=_intBQueen):
        _chess_bQ
    elseif(i=_intWKing):
        _chess_wK
    elseif(i=_intBKing):
        _chess_bK
    fi
enddef;

def _draw_step_chessboard(expr k) =
    pair shiftPiece;
    for i:=1 upto _chessSize:
        for j:=1 upto _chessSize:
            if(chessboard[k][i][j] <> 0):
                if(_chess_view_wb):
                    shiftPiece:=((i-1)*_chessSquareU,(j-1)*_chessSquareU);
                else:
                    shiftPiece:=((_chessSize-i)*_chessSquareU,(_chessSize-j)*_chessSquareU);
                fi
                draw ( _int_to_piece(chessboard[k][i][j]) shifted shiftPiece);
            fi
        endfor;
    endfor;
enddef; 