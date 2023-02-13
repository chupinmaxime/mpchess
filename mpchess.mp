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
if not known mplib: input latexmp fi;

warningcheck:=0;

% integer correspondance :
integer _intWPawn:=1;
integer _intBPawn:=-1;
integer _intWKnight:=2;
integer _intBKnight:=-2;
integer _intWBishop:=3;
integer _intBBishop:=-3;
integer _intWRook:=4;
integer _intBRook:=-4;
integer _intWQueen:=5;
integer _intBQueen:=-5;
integer _intWKing:=6;
integer _intBKing:=-6;

% unit 
_chessSquareU:=0.3cm;
_chessSize:=8;
% the chessboard
% chessboard[step][1-8][1-8] corresponding to step/A-H/1-8
% array 8x8 for each step of the game
numeric chessboard[][][];  

% set the starting board
def init_chessboard =
    if(_chessSize=8):
    for i:=1 upto 8:
        for j:=1 upto 8:
         chessboard[0][i][j]:=0;
        endfor;
    endfor;
    for i:=1 upto 8:
        chessboard[0][i][2]:=_intWPawn;
        chessboard[0][i][7]:=_intBPawn;
    endfor;
    chessboard[0][1][1]:=_intWRook;chessboard[0][8][1]:=_intWRook;
    chessboard[0][1][8]:=_intBRook;chessboard[0][8][8]:=_intBRook; 
    chessboard[0][2][1]:=_intWKnight;chessboard[0][7][1]:=_intWKnight;
    chessboard[0][2][8]:=_intBKnight;chessboard[0][7][8]:=_intBKnight; 
    chessboard[0][3][1]:=_intWBishop;chessboard[0][6][1]:=_intWBishop;
    chessboard[0][3][8]:=_intBBishop;chessboard[0][6][8]:=_intBBishop;
    chessboard[0][4][1]=_intWQueen;
    chessboard[0][4][8]=_intBQueen;
    chessboard[0][5][1]=_intWKing;
    chessboard[0][5][8]=_intBKing;
    fi
enddef;

% color of black and white square
color _blackSquare,_whiteSquare;
_blackSquare:=(0.549,0.6353,0.6784);
_whiteSquare:=(0.8706,0.8912,0.902);

picture _blackSquarePic, _whiteSquarePic;

_blackSquarePic:=image(
    fill unitsquare scaled _chessSquareU withcolor _blackSquare;
);

_whiteSquarePic:=image(
    fill unitsquare scaled _chessSquareU withcolor _whiteSquare;
);


picture backboard;
def init_backboard =
backboard:=image(
    for i:=1 upto _chessSize:
        for j:=1 upto _chessSize:
            if(odd((i-1)*_chessSize+j+i)):
                draw _blackSquarePic
                 shifted ((j-1)*_chessSquareU,(i-1)*_chessSquareU)  ;
            else:
                draw _whiteSquarePic shifted ((j-1)*_chessSquareU,(i-1)*_chessSquareU) ;
            fi
        endfor;
    endfor;
);
enddef;