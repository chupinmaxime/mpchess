%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                        mpchess.mp                          %%
%%              draw chessboards with metapost                %%
%%                    notezik@gmail.com                       %%
%%                Version 0.7 (juillet   2023)                %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% This work may be distributed and/or modified under the conditions of
% the LaTeX Project Public License, either version 1.3c of this license
% or (at your option) any later version.  The latest version of this
% license is in http://www.latex-project.org/lppl.txt
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%input format;
input hatching;
input mpchess-pieces; % piece of mpchess package
input mpchess-cburnett; % piece of lichess cburnett
input mpchess-skak; % piece of skak package
input mpchess-chessboard;
input mpchess-pgn;
input mpchess-fen;
input fiziko;

if not known mplib: input latexmp fi;

warningcheck:=0;



% pieces
picture _chess_bB, _chess_bK, _chess_bN,_chess_bP, _chess_bQ, _chess_bR;
picture _chess_wB, _chess_wK, _chess_wN,_chess_wP, _chess_wQ, _chess_wR;

% coordinates font
string _coords_font;
_coords_font:=defaultfont;

% chose the font to write coordinates on board
def set_coordinates_font(expr f)=
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

boolean _chess_players_side;
_chess_players_side:=false;
def set_players_side=
    _chess_players_side:=true;
enddef;

% boolean to choose if we print coordinates
boolean _chess_print_coords,_chess_coords_inout;
_chess_print_coords:=true;
_chess_coords_inout:=true; %true for inside
def hide_coordinates=
    _chess_print_coords:=false;
enddef;

def show_coordinates=
    _chess_print_coords:=true;
enddef;

def set_coordinates_position(expr s)=
    if(s="inside"):
        _chess_coords_inout:=true;
    elseif(s="outside"):
        _chess_coords_inout:=false;
    fi
enddef;




% boolean for white or black to move
boolean _white_to_move;
_white_to_move:=true;

def set_black_to_move=
    _white_to_move:=false;
enddef;    

def set_white_to_move=
    _white_to_move:=true;
enddef;    

% boolean to show a mark to indicate whos to move
boolean _show_whos_to_move;
_show_whos_to_move:=true;

def show_whos_to_move=
    _show_whos_to_move:=true;
enddef;

def hide_whos_to_move=
    _show_whos_to_move:=false;
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


% macro to get thi ith char of a string
vardef _get_char(expr s,i)=
    save output;
    string output;
    output:=substring(i,i+1) of s;
    output
enddef;

% size of the chessboard
numeric _chessSize;
_chessSize:=8;

def set_backboard_size(expr w)=
    _chessSize:=w;
enddef;


def get_backboard_size=
    _chessSize
enddef;

% unit default
numeric _chessWidth,_chessSquareU;
_chessWidth:=5cm;
_chessSquareU:=_chessWidth/_chessSize;

def set_backboard_width(expr w)=
    _chessWidth:=w;
enddef;


def get_square_dim=
    _chessSquareU
enddef;

def get_backboard_width=
    _chessWidth
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

color _chess_main_lines_color;
_chess_main_lines_color:=0.3[_blackColorSquare,black];

def set_main_lines_color(expr c)=
    _chess_main_lines_color:=c;
enddef;


picture _blackSquarePic, _whiteSquarePic;
picture _blackSquareColoredPic, _whiteSquareColoredPic;
picture _blackSquareClassicalPic, _whiteSquareClassicalPic;

def _wood_draw(expr N,d,p,c,_SquareUnit)=
    save _up_wood,_down_wood;
    path _up_wood,_down_wood;  
    fill unitsquare scaled _SquareUnit withcolor c;
    for i=1 upto N-1:
        _up_wood:=(i/N+uniformdeviate(d),0.0+0.5p/_SquareUnit)*_SquareUnit--(i/N,0.0+0.5p/_SquareUnit)*_SquareUnit--(i/N,0.5)*_SquareUnit--(i/N+uniformdeviate(d),0.7+uniformdeviate(.3)-p/_SquareUnit)*_SquareUnit--cycle;
        fill _up_wood  withcolor ((0.9+uniformdeviate
        .25)[white,c]);
        _down_wood:=((i-1)/N+uniformdeviate(d)+0.5/N,1.0-0.5p/_SquareUnit)*_SquareUnit--((i-1)/N+0.5/N,1.0-0.5p/_SquareUnit)*_SquareUnit--((i-1)/N+0.5/N,0.5)*_SquareUnit--((i-1)/N+uniformdeviate(d)+0.5/N,0.3-uniformdeviate(.3)+p/_SquareUnit)*_SquareUnit--cycle;
        fill _down_wood withcolor ((0.9+uniformdeviate
        .25)[white,c]);
    endfor;
enddef;

def _buildColoredSquare(expr _SquareUnit,_BlackColor,_WhiteColor)=
    if(_chess_board_type="flat"):
        _blackSquarePic:=image(
            fill unitsquare scaled _SquareUnit withcolor _BlackColor;
        );
        _whiteSquarePic:=image(
            fill unitsquare scaled _SquareUnit withcolor _WhiteColor;
        );
    elseif(_chess_board_type="pyramidal"):
        _blackSquarePic:=image(
            fill unitsquare scaled _SquareUnit withcolor _BlackColor;
            fill (1,0)--(1,1)--(0.5,0.5)--cycle scaled _SquareUnit withcolor
            0.97[black,_BlackColor];
            fill (0,1)--(0,0)--(0.5,0.5)--cycle scaled _SquareUnit withcolor
            0.97[white,_BlackColor];
        );
        _whiteSquarePic:=image(
            fill unitsquare scaled _SquareUnit withcolor _WhiteColor;
            fill (1,0)--(1,1)--(0.5,0.5)--cycle scaled _SquareUnit withcolor
            0.97[black,_WhiteColor];
            fill (0,1)--(0,0)--(0.5,0.5)--cycle scaled _SquareUnit withcolor
            0.97[white,_WhiteColor];
        );
    elseif(_chess_board_type="wood"):
    _N_wood:=20;
    _deviate_wood:=0.02;
    _pencile_wood:=0.7pt;
    path _up_wood,_down_wood,_q,_p;
        _blackSquarePic:=image(
            _wood_draw(_N_wood,_deviate_wood,_pencile_wood,_BlackColor,_SquareUnit);
        );
        _whiteSquarePic:=image(_wood_draw(_N_wood,_deviate_wood,_pencile_wood,_WhiteColor,_SquareUnit);
        );
    fi
enddef;

def _buildClassicalSquare(expr _SquareUnit)=
    _blackSquarePic:=image(
        hatchfill (unitsquare  scaled _SquareUnit) withcolor (white) withcolor (45,0.65*_SquareUnit/6 bp,-0.2bp);
    );
    _whiteSquarePic:=image(
        fill unitsquare scaled _SquareUnit withcolor white;
    );
enddef;

% default theme lichess blue
_blackSquarePic:=_blackSquareColoredPic;
_whiteSquarePic:=_whiteSquareColoredPic;

def set_color_theme(expr t)=
    _chessTheme := t; 
    if(t="BlueLichess"):
        _chess_board_type:="flat";
        _blackColorSquare:=(0.549,0.6353,0.6784);
        _whiteColorSquare:=(0.8706,0.8912,0.902);
    elseif(t="BrownLichess"):
        _chess_board_type:="flat";
        _blackColorSquare:=(0.709803922,0.5333,0.3882);
        _whiteColorSquare:=(0.941176471,0.850980392,0.709803922);
    elseif(t="GreenLichess"):
        _chess_board_type:="flat";
        _blackColorSquare:=(0.5255,0.651,0.4);
        _whiteColorSquare:=(1.0,1.0,0.8666);
    elseif(t="PinkPyramidalLichess"):
        _chess_board_type:="pyramidal";
        _blackColorSquare:=(0.949,0.451,0.451);
        _whiteColorSquare:=(0.9294,0.9333,0.73333);
    elseif(t="Wood"):
        _chess_board_type:="wood";
        _blackColorSquare:=(0.4902,0.3569,0.2118);
        _whiteColorSquare:=(0.8039,0.7843,0.7725);
    elseif(t="Classical"):
        _blackColorSquare:=black;
        _whiteColorSquare:=black;
    fi
enddef;

def set_white_squares_color(expr c)=
    _whiteColorSquare:=c;
enddef;

def set_black_squares_color(expr c)=
    _blackColorSquare:=c;
enddef;

_chess_bB:=_chess_mpchess_bB;
_chess_bK:=_chess_mpchess_bK;
_chess_bN:=_chess_mpchess_bN;
_chess_bP:=_chess_mpchess_bP;
_chess_bQ:=_chess_mpchess_bQ;
_chess_bR:=_chess_mpchess_bR;


_chess_wB:=_chess_mpchess_wB;
_chess_wK:=_chess_mpchess_wK;
_chess_wN:=_chess_mpchess_wN;
_chess_wP:=_chess_mpchess_wP;
_chess_wQ:=_chess_mpchess_wQ;
_chess_wR:=_chess_mpchess_wR;

def set_pieces_theme(expr t)=
    if(t="mpchess"):
        _chess_bB:=_chess_mpchess_bB;
        _chess_bK:=_chess_mpchess_bK;
        _chess_bN:=_chess_mpchess_bN;
        _chess_bP:=_chess_mpchess_bP;
        _chess_bQ:=_chess_mpchess_bQ;
        _chess_bR:=_chess_mpchess_bR;


        _chess_wB:=_chess_mpchess_wB;
        _chess_wK:=_chess_mpchess_wK;
        _chess_wN:=_chess_mpchess_wN;
        _chess_wP:=_chess_mpchess_wP;
        _chess_wQ:=_chess_mpchess_wQ;
        _chess_wR:=_chess_mpchess_wR;
    elseif(t="cburnett"):
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
    elseif(t="skak"):
        _chess_bB:=_chess_skak_bB;
        _chess_bK:=_chess_skak_bK;
        _chess_bN:=_chess_skak_bN;
        _chess_bP:=_chess_skak_bP;
        _chess_bQ:=_chess_skak_bQ;
        _chess_bR:=_chess_skak_bR;


        _chess_wB:=_chess_skak_wB;
        _chess_wK:=_chess_skak_wK;
        _chess_wN:=_chess_skak_wN;
        _chess_wP:=_chess_skak_wP;
        _chess_wQ:=_chess_skak_wQ;
        _chess_wR:=_chess_skak_wR;    
    fi
enddef;


def _init_piece(expr w)=
    begingroup
    bboxmargin:=0pt;
    _chess_marginBottom:=0.13w;
    % the queen and king as reference
    %bQ
    _chess_bQ_width:=abs((urcorner _chess_bQ)-(ulcorner _chess_bQ));
    _chess_bQ_height:=abs((urcorner _chess_bQ)-(lrcorner _chess_bQ));
    _chess_bK_width:=abs((urcorner _chess_bK)-(ulcorner _chess_bK));
    _chess_bK_height:=abs((urcorner _chess_bK)-(lrcorner _chess_bK));
    _chess_max_wh:=max(_chess_bQ_height,_chess_bQ_width,_chess_bK_height,_chess_bK_width);
    ratio:= (0.8w/_chess_max_wh);
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


vardef _chess_get_img_w(expr im)=
    save width;
    numeric width;
    width:=abs(ulcorner im-urcorner im);
    width 
enddef;

vardef _chess_get_img_h(expr im)=
    save height;
    numeric height;
    height:=abs(ulcorner im-llcorner im) ;
    height 
enddef;

_chess_eps_cadre := 0.05;

def set_border_width(expr c)=
    _chess_eps_cadre := c;    
enddef;


vardef _chess_build_playername(expr str)=
    save _player_img,output;
    picture _player_img,output;
    _player_img:=image(draw textext(str));
    output:=image(
        linecap:=butt;
        linejoin:=mitered;
    _tmp:=_chess_get_img_h(_player_img);
    fill (0-_chess_eps_cadre,0)*_chessSquareU--(_chessSize+_chess_eps_cadre,0)*_chessSquareU--((_chessSize+_chess_eps_cadre)*_chessSquareU,1.8*_tmp)--(0-_chess_eps_cadre*_chessSquareU,1.8*_tmp)--cycle withcolor black;
    draw (0-_chess_eps_cadre,0)*_chessSquareU--(_chessSize+_chess_eps_cadre,0)*_chessSquareU--((_chessSize+_chess_eps_cadre)*_chessSquareU,1.8*_tmp)--(0-_chess_eps_cadre*_chessSquareU,1.8*_tmp)--cycle withcolor black withpen pencircle scaled (0.1*_chessSquareU);
    draw _player_img shifted (0.15*_chessSquareU,0.4*_tmp) withcolor white;
    );
    output
enddef;

picture backboard;

string _chess_board_type; % define flat color or "pyramidal" like lichess

% default value flat
_chess_board_type:="flat";

vardef set_board_type(expr s) =
    _chess_board_type:=s;
enddef;


def init_backboard =
_chessSquareU:=_chessWidth/_chessSize;
_init_piece(_chessSquareU);
if(_chessTheme="Classical"):
    _buildClassicalSquare(_chessSquareU);
else: % colored themes
    _buildColoredSquare(_chessSquareU,_blackColorSquare,_whiteColorSquare);
fi
picture _letter_img;
picture _wplayer_img,_bplayer_img;

backboard:=image(
    linecap:=butt;
    linejoin:=mitered;
    draw (0-_chess_eps_cadre,0-_chess_eps_cadre)*_chessSquareU--(_chessSize+_chess_eps_cadre,0-_chess_eps_cadre)*_chessSquareU--(_chessSize+_chess_eps_cadre,_chessSize+_chess_eps_cadre)*_chessSquareU--(0-_chess_eps_cadre,_chessSize+_chess_eps_cadre)*_chessSquareU--cycle withpen pencircle scaled (0.1*_chessSquareU);
    for i:=1 upto _chessSize:
        for j:=1 upto _chessSize:
            if(odd((i-1)*_chessSize+j+i)):
                draw _whiteSquarePic
                 shifted ((j-1)*_chessSquareU,(i-1)*_chessSquareU)  ;
            else:
                draw _blackSquarePic shifted ((j-1)*_chessSquareU,(i-1)*_chessSquareU) ;
            fi
            if(_chess_print_coords and (_chessSize=8)):
                if(_chess_coords_inout): % coords inside the backboard
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
                        draw _letter_img scaled (0.1*_chessSquareU/_lettre_width) shifted  ((j-1)*_chessSquareU+0.8*_chessSquareU,(i-1)*_chessSquareU+0.05*_chessSquareU) withcolor ((j mod 2)*_whiteColorSquare+(1-(j mod 2))*_blackColorSquare);
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
                        draw _letter_img scaled (0.1*_chessSquareU/_lettre_width) shifted  ((j-1)*_chessSquareU+0.05*_chessSquareU,(i-1)*_chessSquareU+0.8*_chessSquareU) withcolor ((i mod 2)*_whiteColorSquare+(1-(i mod 2))*_blackColorSquare);
                    fi
                else: % coords outside the backboard
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
                        draw _letter_img scaled (0.2*_chessSquareU/_lettre_width) shifted  ((j-1)*_chessSquareU+0.5*(_chessSquareU-_lettre_width),(i-1)*_chessSquareU-0.5*_chessSquareU) withcolor black;
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
                        draw _letter_img scaled (0.2*_chessSquareU/_lettre_width) shifted  ((j-1)*_chessSquareU-0.5*_chessSquareU,(i-1)*_chessSquareU+0.5*(_chessSquareU-_lettre_height)) withcolor black;
                    fi
                fi
            fi
        endfor;
    endfor;
    if(_chess_view_wb): % white view
        if(_chess_white_player<>""): % if white player
            if((not _chess_coords_inout) or _chess_players_side): % if coord outside or option so set players to the site
                label.urt(textext(_chess_white_player),(1.05*_chessSize*_chessSquareU,0));
            else:
                draw _chess_build_playername(_chess_white_player) shifted (0,-_chess_get_img_h(_chess_build_playername(_chess_white_player))+_chess_eps_cadre*_chessSquareU);
            fi
        fi
        if(_chess_black_player<>""):
            if((not _chess_coords_inout) or _chess_players_side):
                label.lrt(textext(_chess_black_player),(1.05*_chessSize*_chessSquareU,_chessSize*_chessSquareU));
            else:
                draw _chess_build_playername(_chess_black_player) shifted (0,_chessSquareU*(_chessSize+2*_chess_eps_cadre));
            fi
        fi
    else: % black view
        if(_chess_black_player<>""):
            if((not _chess_coords_inout) or _chess_players_side):
                label.urt(textext(_chess_black_player),(1.05*_chessSize*_chessSquareU,0));
            else:
                draw _chess_build_playername(_chess_black_player) shifted (0,-_chess_get_img_h(_chess_build_playername(_chess_black_player)));
            fi
        fi
        if(_chess_white_player<>""):
            if((not _chess_coords_inout) or _chess_players_side):
                label.lrt(textext(_chess_white_player),(1.05_chessSize*_chessSquareU,_chessSize*_chessSquareU));
            else:
                draw _chess_build_playername(_chess_white_player) shifted (0,_chessSquareU*(_chessSize+_chess_eps_cadre));
            fi
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

def _triangle(expr s)=
    ((0,0)--(1,0)--(0.5,0.5)--cycle) scaled (s*_chessSquareU)
enddef;

color _chess_last_move_color;

_chess_last_move_color:=(0.6078,0.7803,0);


def set_last_move_color(expr c)=
    _chess_last_move_color:=c;
enddef;

def show_last_move(expr k)=
    if(k>0):
     for i:=1 upto _chessSize:
        for j:=1 upto _chessSize:
            if(chessboard_table[k][i][j]<>chessboard_table[k-1][i][j]):
                if(_chess_view_wb):%white side
                _chess_color_square(_chess_last_move_color,i,j);
                else:
                _chess_color_square(_chess_last_move_color,8+1-i,8+1-j);
                fi
            fi
        endfor
    endfor
    fi
enddef;


vardef _chess_build_chessboard_pic(expr k)=
    save chessboard_pic;
    save shiftPiece;
    pair shiftPiece;
    picture chessboard_pic;
    chessboard_pic:= image(
    %draw backboard;
    for i:=1 upto _chessSize:
        for j:=1 upto _chessSize:
            if(chessboard_table[k][i][j] <> 0):
                if(_chess_view_wb):
                    shiftPiece:=((i-1)*_chessSquareU,(j-1)*_chessSquareU);
                else:
                    shiftPiece:=((_chessSize-i)*_chessSquareU,(_chessSize-j)*_chessSquareU);
                fi
                draw ( _int_to_piece(chessboard_table[k][i][j]) shifted shiftPiece);
            fi
        endfor;
    endfor;
    if(_show_whos_to_move):
        if(_chess_view_wb): %white side 
            if(not _white_to_move):
                fill _triangle(0.3) rotated 180  shifted (_chessSquareU*(_chessSize+0.35),_chessSquareU*(_chessSize)+0.3*_chessSquareU)
            else:
                draw _triangle(0.35)  shifted (_chessSquareU*(_chessSize+0.3),-0.3*_chessSquareU) ;
            fi
        else: % black side
            if(_white_to_move):
                draw _triangle(0.3) rotated 180  shifted (_chessSquareU*(_chessSize+0.35),_chessSquareU*(_chessSize)+0.3*_chessSquareU)
            else:
                fill _triangle(0.35)  shifted (_chessSquareU*(_chessSize+0.3),-0.3*_chessSquareU) ;
            fi
        fi
    fi
    );
    chessboard_pic
enddef;

vardef chessboard_step(expr k) =
    save chessboard_pic;
    picture chessboard_pic;
    if((k mod 2)=0):
        set_white_to_move;
    else:
        set_black_to_move;
    fi
    chessboard_pic:=_chess_build_chessboard_pic(k);    
    chessboard_pic
enddef; 

vardef chessboard =
    save chessboard_pic;
    picture chessboard_pic;
    chessboard_pic:=_chess_build_chessboard_pic(0);    
    chessboard_pic
enddef; 


%%% colored square
picture _chess_colored_squared;
vardef color_square(expr c)(text slist)=
    % c: color
    % s: list of algebraic notation for a square (ex: "e5","f6",etc.)
    save _i,_j,_str;
    for _str = slist:
        _i:=_lettre_to_int(_get_char(_str,0));
        _j:=_str_to_int(_get_char(_str,1));
        path ss;
        if(_chess_view_wb):%white side
        ss:=(unitsquare scaled _chessSquareU) shifted
        ((_i-1)*_chessSquareU,(_j-1)*_chessSquareU);
        else:
        ss:=(unitsquare scaled _chessSquareU) shifted
        ((8+1-_i-1)*_chessSquareU,(8+1-_j-1)*_chessSquareU);
        fi
        transparence(ss,c,0.41);
    endfor
enddef;

vardef _chess_color_square(expr c,i,j)=
    % c: color
    % s: algebraic notation for a square (ex: e5)
    path ss;
    ss:=(unitsquare scaled _chessSquareU) shifted ((i-1)*_chessSquareU,(j-1)*_chessSquareU);
    transparence(ss,c,0.41);
enddef;

%% "inspired" by Thruston’s code:
% https://github.com/thruston/Drawing-with-Metapost
def transparence(expr p,c,a)=
    save shape,alpha,filler,bg,fg;
    path shape; 
    shape := p;
    alpha := a; % alpha: 0=invisible, 1=opaque
    color filler; 
    filler = c;
    picture fg, bg;
    bg = currentpicture; % capture the current drawing
    fg = image(
        for e within bg: % redraw everything in blended color
            draw e withcolor alpha[colorpart e, filler];
        endfor % and add some decorations
    );
    clip fg to shape; % now clip the fg drawing to the shape
    fill shape withcolor filler; % fill the shape
    draw fg; % and put the fg drawing on top
enddef;


% draw arrow on the board between two algebraic notation
% depending on the syntax, strat line or rectangular one
% s="a2--a4" or s="b1|-c3" or s="b1-|c3"
% allow a list of string 
_chess_arrow_width:=0.08*_chessSquareU;
_chess_arrow_head:=0.4*_chessSquareU;

def set_arrow_width(expr c)=
    _chess_arrow_width:=c*_chessSquareU;    
enddef;

def draw_arrows(expr c)(text slist)=
    save _chess_arrow,_str;
    save _i,_j,_k,_l,_vec,_ortho_vec,_unit_vec,_init,_end;
    pair _vec,_unit_vec,_ortho_vec,_init,_end;
    path _chess_arrow;
    for _str = slist:
        _i:=_lettre_to_int(_get_char(_str,0));
        _j:=_str_to_int(_get_char(_str,1));
        _k:=_lettre_to_int(_get_char(_str,4));
        _l:=_str_to_int(_get_char(_str,5));           
        if(_chess_view_wb): %white side
            _end:=(_k,_l)*_chessSquareU-(0.5,0.5)*_chessSquareU;
            _init:=(_i,_j)*_chessSquareU-(0.5,0.5)*_chessSquareU;
        else:
            _end:=(8-_k,8-_l)*_chessSquareU+(0.5,0.5)*_chessSquareU;
            _init:=(8-_i,8-_j)*_chessSquareU+(0.5,0.5)*_chessSquareU;
        fi
        if((substring (2,4) of _str)="--"):
            _vec:= _end-_init;
            _unit_vec:=_chess_unit_vec(_vec);
            _init:=_init+0.2*_chessSquareU*_unit_vec;
            _end:=_end-0.2*_chessSquareU*_unit_vec;
            _vec:= _end-_init;
            _unit_vec:=_chess_unit_vec(_vec);
            _ortho_vec:=_chess_unit_ortho_vec(_vec);
            _vec_norm:=abs(_vec);
            _chess_arrow:=_init--(_init+(_chess_arrow_width*_ortho_vec))--
            (_init+(_chess_arrow_width*_ortho_vec)+((_vec_norm-_chess_arrow_head)*_unit_vec))--
            (_init+(_chess_arrow_width*_ortho_vec)+((_vec_norm-_chess_arrow_head)*_unit_vec)+(2*_chess_arrow_width*_ortho_vec))-- 
            _end -- 
            (_init-(_chess_arrow_width*_ortho_vec)+((_vec_norm-_chess_arrow_head)*_unit_vec)-(2*_chess_arrow_width*_ortho_vec))--
            (_init-(_chess_arrow_width*_ortho_vec)+((_vec_norm-_chess_arrow_head)*_unit_vec))--
            (_init-(_chess_arrow_width*_ortho_vec))--cycle;
        elseif((substring (2,4) of _str)="|-"):
            if((xpart _end)> (xpart _init)): % to the right
                _pm_rl:=+1;
            else:
                _pm_rl:=-1;
            fi
            if((ypart _end)>(ypart _init)): % to the to
                _pm_ul:=+1;
            else:
                _pm_ul:=-1;
            fi
            _init:=(xpart _init, ypart _init+0.2*(_pm_ul*_chessSquareU));
            _end:=(xpart _end-0.2*(_pm_rl*_chessSquareU),ypart _end);
            _chess_arrow:=(_init-_pm_rl*(_chess_arrow_width,0))--
                        (xpart _init -_pm_rl*_chess_arrow_width, ypart _end + _pm_ul*_chess_arrow_width)--
                        (xpart _end-_pm_rl*_chess_arrow_head, ypart _end + _pm_ul*_chess_arrow_width)--
                        (xpart _end-_pm_rl*_chess_arrow_head, ypart _end + 3*_pm_ul*_chess_arrow_width)--
                        _end--
                        (xpart _end-_pm_rl*_chess_arrow_head, ypart _end - 3*_pm_ul*_chess_arrow_width)--
                        (xpart _end-_pm_rl*_chess_arrow_head, ypart _end - _pm_ul*_chess_arrow_width)--
                        (xpart _init +_pm_rl*_chess_arrow_width, ypart _end - _pm_ul*_chess_arrow_width) --
                         (_init+_pm_rl*(_chess_arrow_width,0))--cycle;
        elseif((substring (2,4) of _str)="-|"):
            if((xpart _end)>(xpart _init)): % to the right
                _pm_rl:=+1;
            else:
                _pm_rl:=-1;
            fi
            if((ypart _end)>(ypart _init)): % to the to
                _pm_ul:=+1;
            else:
                _pm_ul:=-1;
            fi
            _init:=(xpart _init +0.2*(_pm_rl*_chessSquareU), ypart _init);
            _end:=(xpart _end,ypart _end-0.2*(_pm_ul*_chessSquareU));
            _chess_arrow:=(_init+_pm_ul*(0,_chess_arrow_width))--
                        (xpart _end -_pm_rl*_chess_arrow_width, ypart _init + _pm_ul*_chess_arrow_width)--
                        (xpart _end -_pm_rl*_chess_arrow_width,ypart _end-_pm_ul*_chess_arrow_head)--
                        (xpart _end -3*_pm_rl*_chess_arrow_width,ypart _end-_pm_ul*_chess_arrow_head)--
                        _end--
                        (xpart _end +3*_pm_rl*_chess_arrow_width,ypart _end-_pm_ul*_chess_arrow_head)--
                        (xpart _end +_pm_rl*_chess_arrow_width,ypart _end-_pm_ul*_chess_arrow_head)--
                        (xpart _end +_pm_rl*_chess_arrow_width, ypart _init - _pm_ul*_chess_arrow_width)--
                        (_init-_pm_ul*(0,_chess_arrow_width))--cycle;
        
        fi
        %draw _chess_arrow;
        transparence(_chess_arrow,c,0.91);
    endfor
enddef;

vardef _chess_unit_ortho_vec(expr p)=
    save _out;
    pair _out;
    _out := p rotated 90 scaled (1/abs(p));
    _out
enddef;


vardef _chess_unit_vec(expr p)=
    save _out;
    pair _out;
    _out := p  scaled (1/abs(p));
    _out
enddef;


def draw_circles(expr c)(text slist)=
    save _str;
    save _i,_j;
    for _str = slist:
        _i:=_lettre_to_int(_get_char(_str,0));
        _j:=_str_to_int(_get_char(_str,1));
        if(_chess_view_wb): % white side
        draw (fullcircle scaled (0.95*_chessSquareU)) shifted
        ((_i-0.5,_j-0.5)*_chessSquareU) withpen pencircle scaled
        (0.08*_chessSquareU) withcolor c;
        else:
        draw (fullcircle scaled (0.95*_chessSquareU)) shifted
        ((8+1-_i-0.5,8+1-_j-0.5)*_chessSquareU) withpen pencircle scaled
        (0.08*_chessSquareU) withcolor c;
        fi
    endfor;
enddef;

def draw_crosses(expr c)(text slist)=
    save _str;
    save _i,_j;
    for _str = slist:
        _i:=_lettre_to_int(_get_char(_str,0));
        _j:=_str_to_int(_get_char(_str,1));
        if(_chess_view_wb):% white side
        draw (((-0.45,-0.45)--(0.45,0.45)) scaled (0.95*_chessSquareU)) shifted ((_i-0.5,_j-0.5)*_chessSquareU) withpen pencircle scaled (0.1*_chessSquareU) withcolor c;
        draw (((-0.45,0.45)--(0.45,-0.45)) scaled (0.95*_chessSquareU)) shifted
        ((_i-0.5,_j-0.5)*_chessSquareU) withpen pencircle scaled
        (0.1*_chessSquareU) withcolor c;
        else:
        draw (((-0.45,-0.45)--(0.45,0.45)) scaled (0.95*_chessSquareU)) shifted ((8+1-_i-0.5,8+1-_j-0.5)*_chessSquareU) withpen pencircle scaled (0.1*_chessSquareU) withcolor c;
        draw (((-0.45,0.45)--(0.45,-0.45)) scaled (0.95*_chessSquareU)) shifted
        ((8+1-_i-0.5,8+1-_j-0.5)*_chessSquareU) withpen pencircle scaled
        (0.1*_chessSquareU) withcolor c;
        fi
    endfor;
enddef;



% clip current chessboard to the area of type "a2-f7"
def clip_chessboard(expr s)=
    save _first_letter,_firt_nbr, _second_letter,_second_nbr,_fl,_fn,_sl,_sn,_str;
    string _first_letter,_first_nbr, _second_letter,_second_nbr,_str;
    _str:=s;
    _first_letter:=substring (0,1) of _str;
    _first_nbr:=substring (1,2) of _str;
    _second_letter:=substring (3,4) of _str;
    _second_nbr:=substring (4,5) of _str;
    _fl:=_lettre_to_int(_first_letter)-1;
    _fn:=_str_to_int(_first_nbr)-1;
    _sl:=_lettre_to_int(_second_letter);
    _sn:=_str_to_int(_second_nbr);
    clip currentpicture to (_fl,_fn)*_chessSquareU--(_fl,_sn)*_chessSquareU--(_sl,_sn)*_chessSquareU--(_sl,_fn)*_chessSquareU--cycle;
enddef;

% reset backboard
def reset_mpchess=
    _chessWidth:=5cm;
    _chessSize:=8;
    _chessSquareU:=_chessWidth/_chessSize;
    _chessTheme := "BlueLichess";
    _blackColorSquare:=(0.549,0.6353,0.6784);
    _whiteColorSquare:=(0.8706,0.8912,0.902);
    _chess_print_coords:=true;
    _chess_coords_inout:=true;
    _chess_view_wb := true; % true for white
    _chess_players_side:=false;
    _chess_eps_cadre := 0.05;
    _chess_last_move_color:=(0.6078,0.7803,0);
    _chess_arrow_width:=0.2*_chessSquareU;
    _chess_arrow_head:=0.6*_chessSquareU;
    clear_chessboard;
    _chess_wcaptures_nbr[0]:=0;
    _chess_bcaptures_nbr[0]:=0;
    set_color_theme("BlueLichess");
    set_pieces_theme("cburnett");
    _chess_white_player:="";
    _chess_black_player:="";
    _chess_arrow_width:=0.08*_chessSquareU;
    _chess_arrow_head:=0.4*_chessSquareU;
    _chess_main_lines_color:=0.3[_blackColorSquare,black];
enddef;

color _commentColor;
_commentColor:=(0.6,0.2,0.2);

def set_comment_color(expr c)=
    _commentColor:=c;
enddef;

_commentScale:=0.2;

def draw_comment(expr ind, pos)=
    save _img, _letter, _nbr;
    picture _img;
    _img:=image(
        draw textext("\bfseries"&ind);                        
    );
    _width:=abs(urcorner _img-ulcorner _img);
    _height:=abs(urcorner _img-lrcorner _img);
    _img:=image(
        fill fullcircle scaled (2*max(_width,_height)) shifted (0.5*_width,0.5*_height) withcolor 0.8[_commentColor,white];
        draw fullcircle scaled (2*max(_width,_height)) shifted (0.5*_width,0.5*_height) withcolor _commentColor;
        draw _img;
    );
    _letter:=_lettre_to_int(_get_char(pos,0));
    _nbr:=_str_to_int(_get_char(pos,1));
    if(_chess_view_wb): % white view
        draw _img scaled (_commentScale*_chessSquareU/max(_width,_height)) shifted  ((_letter)*_chessSquareU-0.15*(_chessSquareU-_width),(_nbr)*_chessSquareU-0.15*_chessSquareU);
    else:
       draw _img scaled (_commentScale*_chessSquareU/max(_width,_height)) shifted  ((8+1-_letter)*_chessSquareU-0.15*(_chessSquareU-_width),(8+1-_nbr)*_chessSquareU-0.15*_chessSquareU);
    fi
enddef;