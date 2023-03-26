if(unknown _chess_input_pgn):
    input mpchess-pgn 
fi

def _chess_fen_is_number(expr c)=
    if((c="1") or (c="2") or (c="3") or (c="4") or (c="5") or (c="6") or (c="7") or (c="8")):
        true
    else:
        false
    fi
enddef;

def _chess_is_slash(expr c)=
    if(c="/"):
        true
    else:
        false
    fi
enddef;

def _chess_fen_letter_to_int(expr c)=
    if(c="B"):
        _intWBishop
    elseif(c="K"):
        _intWKing
    elseif(c="N"):
        _intWKnight
    elseif(c="Q"):
        _intWQueen
    elseif(c="R"):
        _intWRook
    elseif(c="P"):
        _intWPawn
    elseif(c="b"):
        _intBBishop
    elseif(c="k"):
        _intBKing
    elseif(c="n"):
        _intBKnight
    elseif(c="q"):
        _intBQueen
    elseif(c="r"):
        _intBRook
    elseif(c="p"):
        _intBPawn
    fi        
enddef;

def _chess_extract_position(expr fen)=
    save  i, j, _str,_current_char;
    save _len,_zero_nbr,_exit_for;
    boolean _exit_for;
    _exit_for:=false;
    string _str,_current_char;
    _str:=fen;
    i:=1;
    j:=8;
    _len:=length(_str);
    forever:exitunless(not _exit_for);
        _len:=length(_str);
        _current_char:=_get_char(_str,0);
        _str:=substring (1,_len) of _str;
        if(_chess_fen_is_number(_current_char)): % if a number
            _zero_nbr:=_str_to_int(_current_char);
            for k:=0 upto _zero_nbr-1:
                chessboard_table[0][i+k][j]:=0;
            endfor
            i:=i+_zero_nbr;
        elseif(_chess_is_slash(_current_char)): % if char /
            j:=j-1; % change line
            i:=1; % reset column
        elseif(_current_char=" "):
            % if " "
            _exit_for:=true;
            if(_get_char(_str,0)="w"):
                _white_to_move:=true;
            else:
                _white_to_move:=false;
            fi
        else: % a letter
            chessboard_table[0][i][j]:=_chess_fen_letter_to_int(_current_char);
            i:=i+1;
        fi
    endfor
enddef;

def build_chessboard_from_fen(expr s)=
    set_empty_chessboard;
    _chess_extract_position(s);
enddef;

def build_chessboard_from_fen_file(expr s)=
    set_empty_chessboard;
    string _rf;
    _rf:=readfrom s;
    _chess_extract_position(_rf);
enddef;

