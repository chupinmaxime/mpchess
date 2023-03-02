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

%input format;
input hatching;
input cburnett; % piece of lichess cburnett
input mpchess-chessboard;
input mpchess-pgn;
input mpchess-fen;
%input mp-tool;
input latexmp;

if not known mplib: input latexmp fi;

warningcheck:=0;

% pieces
picture _chess_bB, _chess_bK, _chess_bN,_chess_bP, _chess_bQ, _chess_bR;
picture _chess_wB, _chess_wK, _chess_wN,_chess_wP, _chess_wQ, _chess_wR;

% coordinates font
string _coords_font;
_coords_font:=defaultfont;

% chose the font to write coordinates on board
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

boolean _chess_players_side;
_chess_players_side:=false;
def set_players_side=
    _chess_player_side:=true;
enddef;

% boolean to choose if we print coordinates
boolean _chess_print_coords,_chess_coords_inout;
_chess_print_coords:=true;
_chess_coords_inout:=true; %true for inside
def set_no_coords=
    _chess_print_coords:=false;
enddef;

def set_coords=
    _chess_print_coords:=true;
enddef;

def set_coords_inside=
    _chess_coords_inout:=true;
enddef;

def set_coords_outside=
    _chess_coords_inout:=false;
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
boolean show_whos_to_move;
show_whos_to_move:=true;



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
    _chess_print_coords:=true;
    _chess_coords_inout:=true;
    _chess_view_wb := true; % true for white
    _chess_players_side:=false;
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
    elseif(t="Classical"):
        _blackColorSquare:=black;
        _whiteColorSquare:=black;
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

vardef _chess_build_playername(expr str)=
    save _player_img,output;
    picture _player_img,output;
    _player_img:=image(draw textext(str));
    output:=image(
    _tmp:=_chess_get_img_h(_player_img);
    fill (0,0)--(_chessSquareU*_chessSize,0)--(_chessSquareU*_chessSize,1.8*_tmp)--(0,1.8*_tmp)--cycle withcolor black;
    draw (0,0)--(_chessSquareU*_chessSize,0)--(_chessSquareU*_chessSize,1.8*_tmp)--(0,1.8*_tmp)--cycle withcolor black;
    draw _player_img shifted (0.15*_chessSquareU,0.4*_tmp) withcolor white;
    );
    output
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
picture _wplayer_img,_bplayer_img;

backboard:=image(
    for i:=1 upto _chessSize:
        for j:=1 upto _chessSize:
            if(odd((i-1)*_chessSize+j+i)):
                draw _whiteSquarePic
                 shifted ((j-1)*_chessSquareU,(i-1)*_chessSquareU)  ;
            else:
                draw _blackSquarePic shifted ((j-1)*_chessSquareU,(i-1)*_chessSquareU) ;
            fi
            if(_chess_print_coords and (_chessSize=8)):
                if(_chess_coords_inout):
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
                else:
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
                        draw _letter_img scaled (0.2*_chessSquareU/_lettre_width) shifted  ((j-1)*_chessSquareU+0.5*(_chessSquareU-_lettre_width),(i-1)*_chessSquareU-0.3*_chessSquareU) withcolor black;
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
                        draw _letter_img scaled (0.2*_chessSquareU/_lettre_width) shifted  ((j-1)*_chessSquareU-0.3*_chessSquareU,(i-1)*_chessSquareU+0.5*(_chessSquareU-_lettre_height)) withcolor black;
                    fi
                fi
            fi
        endfor;
    endfor;
    draw (0,0)--(_chessSize,0)*_chessSquareU--(_chessSize,_chessSize)*_chessSquareU--(0,_chessSize)*_chessSquareU--cycle;
    if(_chess_view_wb):
        if(_chess_white_player<>""):
            if((not _chess_coords_inout) or _chess_players_side):
                label.urt(textext(_chess_white_player),(_chessSize*_chessSquareU,0));
            else:
                draw _chess_build_playername(_chess_white_player) shifted (0,-_chess_get_img_h(_chess_build_playername(_chess_white_player)));
            fi
        fi
        if(_chess_black_player<>""):
            if((not _chess_coords_inout) or _chess_players_side):
                label.lrt(textext(_chess_black_player),(_chessSize*_chessSquareU,_chessSize*_chessSquareU));
            else:
                draw _chess_build_playername(_chess_black_player) shifted (0,_chessSquareU*_chessSize);
            fi
        fi
    else: % black view
        if(_chess_black_player<>""):
            if((not _chess_coords_inout) or _chess_players_side):
                label.urt(textext(_chess_black_player),(_chessSize*_chessSquareU,0));
            else:
                draw _chess_build_playername(_chess_black_player) shifted (0,-_chess_get_img_h(_chess_build_playername(_chess_black_player)));
            fi
        fi
        if(_chess_white_player<>""):
            if((not _chess_coords_inout) or _chess_players_side):
                label.lrt(textext(_chess_white_player),(_chessSize*_chessSquareU,_chessSize*_chessSquareU));
            else:
                draw _chess_build_playername(_chess_white_player) shifted (0,_chessSquareU*_chessSize);
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

boolean _show_last_move;
color _chess_last_move_color;

_chess_last_move_color:=(0.6078,0.7803,0);

_show_last_move:=false;

def show_last_move=
    _show_last_move:=true;
enddef;

def set_color_last_move(expr c)=
    _chess_last_move_color:=c;
enddef;

def _draw_last_move(expr k)=
    if(k>0):
     for i:=1 upto _chessSize:
        for j:=1 upto _chessSize:
            if(chessboard_table[k][i][j]<>chessboard_table[k-1][i][j]):
                _chess_color_square(_chess_last_move_color,i,j);
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
    draw backboard;
    if(_show_last_move):
        _draw_last_move(k);
    fi
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
    if(show_whos_to_move):
        if(_chess_view_wb): %white side 
        show "coucou";
        show _white_to_move;
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

vardef color_square(expr c,s)=
    % c: color
    % s: algebraic notation for a square (ex: e5)
    save _i,_j;
    _i:=_lettre_to_int(_get_char(s,0));
    _j:=_str_to_int(_get_char(s,1));
    path ss;
    ss:=(unitsquare scaled _chessSquareU) shifted ((_i-1)*_chessSquareU,(_j-1)*_chessSquareU);
    transparence(ss,c,0.41);
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
    show "test";
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