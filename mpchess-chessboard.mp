



% the chessboard
% chessboard_table[step][1-8][1-8] corresponding to step/A-H/1-8
% array 8x8 for each step of the game
numeric chessboard_table[][][];  
numeric chessboard_number;

% set the starting board
def init_chessboard =
    for i:=0 upto 500:
        _chess_wcaptures_nbr[i]:=0;
        _chess_bcaptures_nbr[i]:=0;
    endfor
    if(_chessSize=8):
    for i:=1 upto 8:
        for j:=1 upto 8:
         chessboard_table[0][i][j]:=0;
        endfor;
    endfor;
    for i:=1 upto 8:
        chessboard_table[0][i][2]:=_intWPawn;
        chessboard_table[0][i][7]:=_intBPawn;
    endfor;
    chessboard_table[0][1][1]:=_intWRook;chessboard_table[0][8][1]:=_intWRook;
    chessboard_table[0][1][8]:=_intBRook;chessboard_table[0][8][8]:=_intBRook; 
    chessboard_table[0][2][1]:=_intWKnight;chessboard_table[0][7][1]:=_intWKnight;
    chessboard_table[0][2][8]:=_intBKnight;chessboard_table[0][7][8]:=_intBKnight; 
    chessboard_table[0][3][1]:=_intWBishop;chessboard_table[0][6][1]:=_intWBishop;
    chessboard_table[0][3][8]:=_intBBishop;chessboard_table[0][6][8]:=_intBBishop;
    chessboard_table[0][4][1]:=_intWQueen;
    chessboard_table[0][4][8]:=_intBQueen;
    chessboard_table[0][5][1]:=_intWKing;
    chessboard_table[0][5][8]:=_intBKing;
    fi
    chessboard_number:=1;
enddef;

% clear the chessboard 
def clear_chessboard =
    for k:=0 upto 500:
        for i:=0 upto 20:
            for j:=0 upto 20:
                chessboard_table[k][i][j]:=0;
            endfor
        endfor
    endfor
enddef;

% function to clear an area specified with a arg of type "a1-b6","g1-f2", etc
def clear_areas(text plist)=
    save _first_letter,_firt_nbr, _second_letter,_second_nbr,_fl,_fn,_sl,_sn,_str;
    string _first_letter,_first_nbr, _second_letter,_second_nbr,_str;
    for _str = plist:
    _first_letter:=substring (0,1) of _str;
    _first_nbr:=substring (1,2) of _str;
    _second_letter:=substring (3,4) of _str;
    _second_nbr:=substring (4,5) of _str;
    _fl:=_lettre_to_int(_first_letter);
    _fn:=_str_to_int(_first_nbr);
    _sl:=_lettre_to_int(_second_letter);
    _sn:=_str_to_int(_second_nbr);
    for i:=_fl upto _sl:
        for j:=_fn upto _sn:
            chessboard_table[0][i][j]:=0;
        endfor
    endfor
    endfor
enddef;

% function to clear squares with a arg of type "a1-b6","g1-f2", etc
def clear_squares(text plist)=
    save _first_letter,_firt_nbr,_fl,_fn,_str;
    string _first_letter,_first_nbr,_str;
    for _str = plist:
    _first_letter:=substring (0,1) of _str;
    _first_nbr:=substring (1,2) of _str;
    _fl:=_lettre_to_int(_first_letter);
    _fn:=_str_to_int(_first_nbr);
    chessboard_table[0][_fl][_fn]:=0;
    endfor
enddef;

% function to clear an area specified with a arg of type "a","c",etc
def clear_files(text plist)=
    save _letter,_l,_str;
    string _letter,_str;
    for _str = plist:
    _letter:= _str;
    _l:=_lettre_to_int(_letter);
    for j:=1 upto _chessSize:
            chessboard_table[0][_l][j]:=0;
    endfor
    endfor
enddef;

% function to clear an area specified with a arg of type "1","5",etc
def clear_ranks(text plist)=
    save _nbr,_n,_str;
    string _nbr,_str;
    for _str = plist:
    _nbr:= _str;
    _n:=_str_to_int(_nbr);
    for i:=1 upto _chessSize:
            chessboard_table[0][i][_n]:=0;
    endfor
    endfor
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
            %show chessboard_table[k][i][j];
            if(chessboard_table[k][i][j] <> 0):
                draw ( _int_to_piece(chessboard_table[k][i][j]) shifted ((i-1)*_chessSquareU,(j-1)*_chessSquareU));
            fi
        endfor;
    endfor;
enddef; 


vardef _pawn_candidate(expr istart, jstart,iend,jend,wb,capture,ambiguity)=
    % i int from letter, column
    % j int for line
    % return true if (istart,jstart) to (iend,jend)
    % is a possible mvt
    % wb is "white" or "black"
    % capture equal 1 if there is a capture
    save output;
    boolean output;
    output = false;
    if(((iend<=_chessSize) and (iend>=1) and (iend<=_chessSize) and (iend>=1))):
        if(wb="white"):        
            if(jend=4): % on the line that allow 2 square move
                if(((jstart=3) or (jstart=2)) and (iend=istart)):
                    if((ambiguity=0) or ((ambiguity<>0) and (ambiguity=istart))):
                        output:=true;
                    fi
                fi
                if(((jstart=3) and ((istart=iend+1) or (istart=iend-1))) and (capture=1)): %capture
                    if((ambiguity=0) or ((ambiguity<>0) and (ambiguity=istart))):
                        output:=true;
                    fi
                fi
            else:
                if((jstart=jend-1) and (istart=iend)): % straight move
                    if((ambiguity=0) or ((ambiguity<>0) and (ambiguity=istart))):
                        output:=true;
                    fi
                fi
                if(((jstart=jend-1) and ((istart=iend+1) or (istart=iend-1))) and (capture=1)): % capture
                    if((ambiguity=0) or ((ambiguity<>0) and (ambiguity=istart))):
                        output:=true;
                    fi
                fi
            fi
        else:
            if(jend=5): % on the line that allow 2 square move
                if(((jstart=6) or (jstart=7)) and (iend=istart)):
                    if((ambiguity=0) or ((ambiguity<>0) and (ambiguity=istart))):
                        output:=true;
                    fi
                fi
                if(((jstart=6) and ((istart=iend+1) or (istart=iend-1))) and (capture=1)): %capture
                    if((ambiguity=0) or ((ambiguity<>0) and (ambiguity=istart))):
                        output:=true;
                    fi
                fi
            else:
                if((jstart=jend+1) and (istart=iend)): % straight move
                    if((ambiguity=0) or ((ambiguity<>0) and (ambiguity=istart))):
                        output:=true;
                    fi
                fi
                if(((jstart=jend+1) and ((istart=iend+1) or (istart=iend-1))) and (capture=1)): % capture
                    if((ambiguity=0) or ((ambiguity<>0) and (ambiguity=istart))):
                        output:=true;
                    fi
                fi
            fi
        fi
    fi
    output
enddef;

vardef _bishop_candidate(expr istart, jstart,iend,jend,wb,ambiguity)=
    % i int from letter, column
    % j int for line
    % return true if (istart,jstart) to (iend,jend)
    % is a possible mvt
    % wb is "white" or "black"
    save output;
    boolean output;
    output = false;
    if((iend<=_chessSize) and (iend>=1) and (iend<=_chessSize) and (iend>=1)):
        if(abs(iend-istart)=abs(jend-jstart)):
            if((ambiguity=0) or ((ambiguity<>0) and (ambiguity=istart))):
                output:=true;
            fi
        fi
    fi
    output
enddef;

vardef _rook_candidate(expr istart, jstart,iend,jend,wb,ambiguity)=
    % i int from letter, column
    % j int for line
    % return true if (istart,jstart) to (iend,jend)
    % is a possible mvt
    % wb is "white" or "black"
    save output;
    boolean output;
    output = false;
    if((iend<=_chessSize) and (iend>=1) and (iend<=_chessSize) and (iend>=1)):
        if((iend=istart) or (jend=jstart)):
            if((ambiguity=0) or ((ambiguity<>0) and (ambiguity=istart))):
                output:=true;
            fi
        fi
    fi
    output
enddef;


vardef _queen_candidate(expr istart, jstart,iend,jend,wb)=
    % i int from letter, column
    % j int for line
    % return true if (istart,jstart) to (iend,jend)
    % is a possible mvt
    % wb is "white" or "black"
    save output;
    boolean output;
    output = false;
    if((iend<=_chessSize) and (iend>=1) and (iend<=_chessSize) and (iend>=1)):
        if((iend=istart) or (jend=jstart) or (abs(iend-istart)=abs(jend-jstart))):
            output:=true;
        fi
    fi
    output
enddef;

vardef _king_candidate(expr istart, jstart,iend,jend,wb)=
    % i int from letter, column
    % j int for line
    % return true if (istart,jstart) to (iend,jend)
    % is a possible mvt
    % wb is "white" or "black"
    save output;
    boolean output;
    output = false;
    if((iend<=_chessSize) and (iend>=1) and (iend<=_chessSize) and (iend>=1)):
        if((abs(iend-istart)<=1) and (abs(jend-jstart)<=1)):
            output:=true;
        fi
    fi
    output
enddef;

vardef _knight_candidate(expr istart, jstart,iend,jend,wb,ambiguity)=
    % i int from letter, column
    % j int for line
    % return true if (istart,jstart) to (iend,jend)
    % is a possible mvt
    % wb is "white" or "black"
    save output;
    boolean output;
    output = false;
    if((iend<=_chessSize) and (iend>=1) and (iend<=_chessSize) and (iend>=1)):
        if(((abs(iend-istart)=2) and (abs(jend-jstart)=1)) or
        ((abs(iend-istart)=1) and (abs(jend-jstart)=2))):
            if((ambiguity=0) or ((ambiguity<>0) and (ambiguity=istart))):
                output:=true;
            fi
        fi
    fi
    output
enddef;

vardef _chess_candidate(expr type, istart, jstart, iend, jend,wb,capture,ambiguity)=
    numeric _pm;
    _pm:=1;
    if(wb="black"):
        _pm:=-1;
    fi
    if(type=(_pm*_intWPawn)):
         _pawn_candidate(istart,jstart,iend,jend,wb,capture,ambiguity)
    elseif(type=_pm*_intWBishop):
        _bishop_candidate(istart,jstart,iend,jend,wb,ambiguity)
    elseif(type=_pm*_intWKing):
        _king_candidate(istart,jstart,iend,jend,wb)
    elseif(type=_pm*_intWKnight):
        _knight_candidate(istart,jstart,iend,jend,wb,ambiguity)
    elseif(type=_pm*_intWQueen):
        _queen_candidate(istart,jstart,iend,jend,wb)
    elseif(type=_pm*_intWRook):
        _rook_candidate(istart,jstart,iend,jend,wb,ambiguity)
    fi
enddef;

def _chess_copy_chessboard(expr step)=
    save i,j;
    for i:=1 upto _chessSize:
        for j:=1 upto _chessSize:
            chessboard_table[step][i][j]:=chessboard_table[step-1][i][j];
        endfor;
    endfor;
enddef;

def _chess_copy_captures(expr step)=
    save i,j;
    %show _chess_wcaptures_nbr[step-1];
    if(_chess_wcaptures_nbr[step-1]>0):
    for i:=0 upto _chess_wcaptures_nbr[step-1]-1:
        _chess_white_captures[step][i]:=_chess_white_captures[step-1][i];
    endfor;
    fi
    %show _chess_bcaptures_nbr[step-1];
    if(_chess_bcaptures_nbr[step-1]>0):
    for i:=0 upto _chess_bcaptures_nbr[step-1]-1:
        _chess_black_captures[step][i]:=_chess_black_captures[step-1][i];
    endfor;
    fi
enddef;

numeric _chess_white_captures[][],_chess_black_captures[][];
numeric _chess_wcaptures_nbr[], _chess_bcaptures_nbr[];
_chess_wcaptures_nbr[0]:=0;
_chess_bcaptures_nbr[0]:=0;

def _build_all_chessboards=
    save _wb;
    string _wb;
    init_chessboard; % k=0
    for k:=1 upto (_chess_step_numtable):
        _chess_copy_chessboard(k);
        _chess_copy_captures(k);
        _piecetype:=_chess_moves_table_numeric[k-1][0];
        _pm:=_chess_moves_table_numeric[k-1][1];
        _iend:=_chess_moves_table_numeric[k-1][2];
        _jend:=_chess_moves_table_numeric[k-1][3];
        _capture:=_chess_moves_table_numeric[k-1][4];
        _promotion:=_chess_moves_table_numeric[k-1][5];
        _ambiguity:=_chess_moves_table_numeric[k-1][6];
        if(_pm=1):
            _wb:="white";
        else:
            _wb:="black";
        fi
        %  castling
        if(_piecetype=100): % short castling
            if(_pm=1):
                _tmp_line:=1;    
            else:
                _tmp_line:=8;
            fi
            if((chessboard_table[k][5][_tmp_line]=_pm*_intWKing) and
            (chessboard_table[k][8][_tmp_line]=_pm*_intWRook)): %  if king and
            % in the right places
                chessboard_table[k][5][_tmp_line]:=0;
                chessboard_table[k][8][_tmp_line]:=0;
                chessboard_table[k][6][_tmp_line]:=_pm*_intWRook;
                chessboard_table[k][7][_tmp_line]:=_pm*_intWKing;
            fi
        fi
        if(_piecetype=1000): % long castling
            if(_pm=1):
                _tmp_line:=1;    
            else:
                _tmp_line:=8;
            fi
            if((chessboard_table[k][5][_tmp_line]=_pm*_intWKing) and
            (chessboard_table[k][1][_tmp_line]=_pm*_intWRook)): %  if king and
            % in the right places
                chessboard_table[k][5][_tmp_line]:=0;
                chessboard_table[k][1][_tmp_line]:=0;
                chessboard_table[k][4][_tmp_line]:=_pm*_intWRook;
                chessboard_table[k][3][_tmp_line]:=_pm*_intWKing;
            fi
        fi       
        for i:=1 upto _chessSize:
            for j:=1 upto _chessSize:   
                if(chessboard_table[k][i][j]=_piecetype): 
                    if(_chess_candidate(_piecetype, i, j, _iend, _jend,_wb,_capture,_ambiguity)=true):  
                        if(_capture<>0):
                            if(_pm=1):
                                _chess_white_captures[k][_chess_wcaptures_nbr[k-1]]:=chessboard_table[k][i][j];
                                _chess_wcaptures_nbr[k]:=_chess_wcaptures_nbr[k-1]+1;
                                _chess_bcaptures_nbr[k]:=_chess_bcaptures_nbr[k-1];
                            else:
                                _chess_black_captures[k][_chess_bcaptures_nbr[k-1]]:=chessboard_table[k][i][j];
                                _chess_bcaptures_nbr[k]:=_chess_bcaptures_nbr[k-1]+1;
                                _chess_wcaptures_nbr[k]:=_chess_wcaptures_nbr[k-1];
                            fi
                        else:
                            _chess_wcaptures_nbr[k]:=_chess_wcaptures_nbr[k-1];
                            _chess_bcaptures_nbr[k]:=_chess_bcaptures_nbr[k-1];
                        fi
                        
                        chessboard_table[k][i][j]:=0; %erase piece
                        if(_promotion<>0):
                            chessboard_table[k][_iend][_jend]:=_promotion;
                        else:
                            chessboard_table[k][_iend][_jend]:=_piecetype;
                        fi
                    fi
                fi
            endfor;
        endfor;
    endfor;
    chessboard_number:=_chess_step_numtable;
enddef;


% set the starting empty board
def set_empty_chessboard =
    for i:=0 upto 500:
        _chess_wcaptures_nbr[i]:=0;
        _chess_bcaptures_nbr[i]:=0;
    endfor
    for i:=1 upto _chessSize:
        for j:=1 upto _chessSize:
         chessboard_table[0][i][j]:=0;
        endfor;
    endfor;
    chessboard_number:=1;
enddef;


def add_white_pieces(text plists) =
    save _str,_piecetype, _letter, _nbr,wb;
    string wb;
    wb:="white";
    for _str = plists:
        if(_is_cap(_get_char(_str,0))): % if the first char is a cap
            _piecetype:=_cap_to_int(_get_char(_str,0),wb);
            if(length(_str)=3): % type Nf6
                _letter:=_lettre_to_int(_get_char(_str,1));
                _nbr:=_str_to_int(_get_char(_str,2));
            fi
        else:
            _piecetype:=_intWPawn;
            if(length(_str)=2): % type f6
                _letter:=_lettre_to_int(_get_char(_str,0));
                _nbr:=_str_to_int(_get_char(_str,1)); 
            fi
        fi
        chessboard_table[0][_letter][_nbr]:=_piecetype;
    endfor
enddef;

def add_black_pieces(text plists) =
    save _str,_piecetype, _letter, _nbr,wb;
    string wb;
    wb:="black";
    for _str = plists:
        if(_is_cap(_get_char(_str,0))): % if the first char is a cap
            _piecetype:=_cap_to_int(_get_char(_str,0),wb);
            if(length(_str)=3): % type Nf6
                _letter:=_lettre_to_int(_get_char(_str,1));
                _nbr:=_str_to_int(_get_char(_str,2));
            fi
        else:
            _piecetype:=_intBPawn;
            if(length(_str)=2): % type f6
                _letter:=_lettre_to_int(_get_char(_str,0));
                _nbr:=_str_to_int(_get_char(_str,1)); 
            fi
        fi
        chessboard_table[0][_letter][_nbr]:=_piecetype;
    endfor
enddef;




def _draw_main_lines(expr _k)(expr wb)(text slist)=
    save _str;
    _chess_arrow_width_save:=_chess_arrow_width;
    _step:=1.4;
    for _str = slist:
        _chess_arrow_width:=(0.1*_step)*_chessSquareU;
        _extract_single_move(_str,wb);
        _piecetype:=_chess_extract_move_tab[0];
        _pm:=_chess_extract_move_tab[1];
        _iend:=_chess_extract_move_tab[2];
        _jend:=_chess_extract_move_tab[3];
        _capture:=_chess_extract_move_tab[4];
        _promotion:=_chess_extract_move_tab[5];
        _ambiguity:=_chess_extract_move_tab[6];
        for i:=1 upto _chessSize:
            for j:=1 upto _chessSize:   
                if(chessboard_table[_k][i][j]=_piecetype): 
                    if(_chess_candidate(_piecetype, i, j, _iend, _jend,wb,_capture,_ambiguity)=true):  
                        draw_arrows(_chess_main_lines_color)(_int_to_letter_w(i)&_int_to_str_w(j)&"--"&_int_to_letter_w(_iend)&_int_to_str_w(_jend));
                    fi
                fi
            endfor;
        endfor;
        _step:=max(_step-0.3,0.7);
    endfor;
    _chess_arrow_width:=_chess_arrow_width_save;
enddef;


def draw_white_main_lines(text slist)=
    _draw_main_lines(0)("white")(slist);
enddef;


def draw_black_main_lines(text slist)=
    _draw_main_lines(0)("black")(slist);
enddef;


def draw_white_main_lines_step(expr k)(text slist)=
    _draw_main_lines(k)("white")(slist);
enddef;


def draw_black_main_lines_step(expr k)(text slist)=
    _draw_main_lines(k)("black")(slist);
enddef;

color _circle_move_c;
_circle_move_c:=0.4[green,black];

def set_possible_moves_color(expr c)=
    _circle_move_c:=c;    
enddef;

def _circle_move(expr i,j)=
    path ss;
    if( _chess_view_wb): %white view
    ss:=(fullcircle scaled (0.25*_chessSquareU)) shifted
    ((i-0.5)*_chessSquareU,(j-0.5)*_chessSquareU);
    else: % black view
    ss:=(fullcircle scaled (0.25*_chessSquareU)) shifted
    ((_chessSize-i+0.5)*_chessSquareU,(_chessSize-j+0.5)*_chessSquareU);
    ;
    fi
    fill ss withcolor _circle_move_c;
enddef;

def show_possible_moves(expr s)=
    show_possible_moves_step(0)(s)
enddef;

def show_possible_moves_step(expr k)(expr s)=
    string _first_letter,_first_nbr;
    pair _shiftPiece;
    boolean _meet_piece;
    _first_letter:=substring (0,1) of s;
    _first_nbr:=substring (1,2) of s;
    _fl:=_lettre_to_int(_first_letter);
    _fn:=_str_to_int(_first_nbr);
    _piecetype:=chessboard_table[k][_fl][_fn];
    %color background of square and draw again the piece
    color_square(_circle_move_c)(s);
    if(_chess_view_wb):
        _shiftPiece:=((_fl-1)*_chessSquareU,(_fn-1)*_chessSquareU);
    else:
        _shiftPiece:=((_chessSize-_fl)*_chessSquareU,(_chessSize-_fn)*_chessSquareU);
    fi
    draw ( _int_to_piece(chessboard_table[k][_fl][_fn]) shifted _shiftPiece);
    if(_piecetype=_intBPawn): %         
        if(_fn=7): % 2 steps allowed
            if(chessboard_table[k][_fl][_fn-2]=0): % two step
                _circle_move(_fl,_fn-2);
            fi
        fi
        if(_fn-1>=1):
            if(chessboard_table[k][_fl][_fn-1]=0): % one step
                _circle_move(_fl,_fn-1);
            fi
            if((chessboard_table[k][_fl-1][_fn-1]<>0) and (_fl-1>0)): % capture
                _circle_move(_fl-1,_fn-1);
            fi
            if((chessboard_table[k][_fl+1][_fn-1]<>0) and (_fl+1<=8)): % capture
                _circle_move(_fl+1,_fn-1);
            fi
        fi
    fi
    if(_piecetype=_intWPawn): %         
        if(_fn=2): % 2 steps allowed
            if(chessboard_table[k][_fl][_fn+2]=0): % two step
                _circle_move(_fl,_fn+2);
            fi
        fi
        if(_fn-1>=1):
            if(chessboard_table[k][_fl][_fn+1]=0): % one step
                _circle_move(_fl,_fn+1);
            fi
            if((chessboard_table[k][_fl-1][_fn+1]<>0) and (_fl-1>0)): % capture
                _circle_move(_fl-1,_fn+1);
            fi
            if((chessboard_table[k][_fl+1][_fn+1]<>0) and (_fl+1<=8)): % capture
                _circle_move(_fl+1,_fn+1);
            fi
        fi
    fi
    if((_piecetype=_intBKnight) or (_piecetype=_intWKnight)): % night
        if(_fl-2>=1):
            if(_fn+1<=8):
                if((_piecetype*chessboard_table[k][_fl-2][_fn+1])<=0):
                    _circle_move(_fl-2,_fn+1);
                fi
            fi
            if(_fn-1>=1):
                if((_piecetype*chessboard_table[k][_fl-2][_fn-1])<=0):
                _circle_move(_fl-2,_fn-1);
                fi
            fi
        fi
        if(_fl+2<=8):
            if(_fn+1<=8):
                if((_piecetype*chessboard_table[k][_fl+2][_fn+1])<=0):
                _circle_move(_fl+2,_fn+1);
                fi
            fi
            if(_fn-1>=1):
                if((_piecetype*chessboard_table[k][_fl+2][_fn-1])<=0):
                _circle_move(_fl+2,_fn-1);
                fi
            fi
        fi
        if(_fn-2>=1):
            if(_fl+1<=8):
                if((_piecetype*chessboard_table[k][_fl+1][_fn-2])<=0):
                _circle_move(_fl+1,_fn-2);
                fi
            fi
            if(_fl-1>=1):
                if((_piecetype*chessboard_table[k][_fl-1][_fn-2])<=0):
                _circle_move(_fl-1,_fn-2);
                fi
            fi
        fi
        if(_fn+2<=8):
            if(_fl+1<=8):
                if((_piecetype*chessboard_table[k][_fl+1][_fn+2])<=0):
                _circle_move(_fl+1,_fn+2);
                fi
            fi
            if(_fl-1>=1):
                if((_piecetype*chessboard_table[k][_fl-1][_fn+2])<=0):
                _circle_move(_fl-1,_fn+2);
                fi
            fi
        fi
    fi
    if((_piecetype=_intBBishop) or (_piecetype=_intWBishop)or (_piecetype=_intBQueen) or (_piecetype=_intWQueen)): % bishop
        _ii:=_fl;
        _jj:=_fn;
        _meet_piece:=false;
        forever:
            _ii:=_ii+1;
            _jj:=_jj+1;
            exitif((_ii>8) or (_jj>8));
            if(((_piecetype*chessboard_table[k][_ii][_jj])<=0) and (_meet_piece=false)):
                _circle_move(_ii,_jj);
            fi
            if(chessboard_table[k][_ii][_jj]<>0):
                    _meet_piece:=true;
            fi
        endfor;
        _ii:=_fl;
        _jj:=_fn;
        _meet_piece:=false;
        forever:
            _ii:=_ii-1;
            _jj:=_jj-1;
            exitif((_ii<1) or (_jj<1));
            if(((_piecetype*chessboard_table[k][_ii][_jj])<=0) and (_meet_piece=false)):
                _circle_move(_ii,_jj);
            fi
            if(chessboard_table[k][_ii][_jj]<>0):
                _meet_piece:=true;
            fi
        endfor;
        _ii:=_fl;
        _jj:=_fn;
        _meet_piece:=false;
        forever:
            _ii:=_ii-1;
            _jj:=_jj+1;
            exitif((_ii<1) or (_jj>8));
            if(((_piecetype*chessboard_table[k][_ii][_jj])<=0) and (_meet_piece=false)):
                _circle_move(_ii,_jj);
            fi
            if(chessboard_table[k][_ii][_jj]<>0):
                _meet_piece:=true;
            fi
        endfor;
        _ii:=_fl;
        _jj:=_fn;
        _meet_piece:=false;
        forever:
            _ii:=_ii+1;
            _jj:=_jj-1;
            exitif((_ii>8) or (_jj<1));
            if(((_piecetype*chessboard_table[k][_ii][_jj])<=0) and (_meet_piece=false)):
                _circle_move(_ii,_jj);
            fi
            if(chessboard_table[k][_ii][_jj]<>0):
                _meet_piece:=true;
            fi
        endfor;
    fi
    if((_piecetype=_intBRook) or (_piecetype=_intWRook)or (_piecetype=_intBQueen) or (_piecetype=_intWQueen)): % rook
        _ii:=_fl;
        _jj:=_fn;
        _meet_piece:=false;
        forever:
            _ii:=_ii+1;
            exitif((_ii>8));
            if(((_piecetype*chessboard_table[k][_ii][_jj])<=0) and (_meet_piece=false)):
                _circle_move(_ii,_jj);
            fi
            if(chessboard_table[k][_ii][_jj]<>0):
                    _meet_piece:=true;
            fi
        endfor;
        _ii:=_fl;
        _jj:=_fn;
        _meet_piece:=false;
        forever:
            _ii:=_ii-1;
            exitif((_ii<1));
            if(((_piecetype*chessboard_table[k][_ii][_jj])<=0) and (_meet_piece=false)):
                _circle_move(_ii,_jj);
            fi
            if(chessboard_table[k][_ii][_jj]<>0):
                _meet_piece:=true;
            fi
        endfor;
        _ii:=_fl;
        _jj:=_fn;
        _meet_piece:=false;
        forever:
            _jj:=_jj+1;
            exitif((_jj>8));
            if(((_piecetype*chessboard_table[k][_ii][_jj])<=0) and (_meet_piece=false)):
                _circle_move(_ii,_jj);
            fi
            if(chessboard_table[k][_ii][_jj]<>0):
                _meet_piece:=true;
            fi
        endfor;
        _ii:=_fl;
        _jj:=_fn;
        _meet_piece:=false;
        forever:
            _jj:=_jj-1;
            exitif((_jj<1));
            if(((_piecetype*chessboard_table[k][_ii][_jj])<=0) and (_meet_piece=false)):
                _circle_move(_ii,_jj);
            fi
            if(chessboard_table[k][_ii][_jj]<>0):
                _meet_piece:=true;
            fi
        endfor;    
    fi
    if((_piecetype=_intBKing) or (_piecetype=_intWKing)): % king
        for _ii:=-1  upto 1:
            for _jj:=-1  upto 1:
                if((_fl+_ii>0) and (_fl+_ii<9) and (_fn+_jj>0) and (_fn+_jj<9)): 
                    if((_piecetype*chessboard_table[k][_fl+_ii][_fn+_jj])<=0):
                        _circle_move(_fl+_ii,_fn+_jj);
                    fi
                fi
            endfor;
        endfor;
    fi
enddef;