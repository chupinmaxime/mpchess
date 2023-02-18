numeric _chessSize;
_chessSize:=8;

def set_chessboardSize(expr w)=
    _chessSize:=w;
enddef;




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
    chessboard[0][4][1]:=_intWQueen;
    chessboard[0][4][8]:=_intBQueen;
    chessboard[0][5][1]:=_intWKing;
    chessboard[0][5][8]:=_intBKing;
    fi
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
    for i:=1 upto _chessSize:
        for j:=1 upto _chessSize:
            show chessboard[k][i][j];
            if(chessboard[k][i][j] <> 0):
                draw ( _int_to_piece(chessboard[k][i][j]) shifted ((i-1)*_chessSquareU,(j-1)*_chessSquareU));
            fi
        endfor;
    endfor;
enddef; 

def _build_chessboard_from_pgn(expr s)=

enddef;

vardef _pawn_candidate(expr istart, jstart,iend,jend,wb)=
    % i int from letter, column
    % j int for line
    % return true if (istart,jstart) to (iend,jend)
    % is a possible mvt
    % wb is "white" or "black"
    save output;
    boolean output;
    output = false;
    if((iend<=_chessSize) and (iend>=0) and (iend<=_chessSize) and (iend>=0)):
    if(wb="white"):
        if(jend=4): % on the line that allow 2 square move
            if(((jstart=3) or (jstart=2)) and (iend=istart)):
                output:=true;
            fi
            if((jstart=3) and ((istart=iend+1) or (istart=iend-1))): %capture
                output:=true;
            fi
        else:
            if((jstart=jend-1) and (istart=iend)): % straight move
                output:=true;
            fi
            if((jstart=jend-1) and ((istart=iend+1) or (istart=iend-1))): % capture
                output:=true;
            fi
        fi
    else:
        if(jend=5): % on the line that allow 2 square move
            if(((jstart=6) or (jstart=7)) and (iend=istart)):
                output:=true;
            fi
            if((jstart=6) and ((istart=iend+1) or (istart=iend-1))): %capture
                output:=true;
            fi
        else:
            if((jstart=jend+1) and (istart=iend)): % straight move
                output:=true;
            fi
            if((jstart=jend+1) and ((istart=iend+1) or (istart=iend-1))): % capture
                output:=true;
            fi
        fi
    fi
    fi
    output
enddef;
