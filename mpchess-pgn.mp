boolean _chess_input_pgn;
% some intern macros to deal with blocks of a PNG line

vardef _delete_first_spaces(expr s)=
    save output;
    _total_length:= length s;
    string output;
    _spaces := 0 ;
    for j = 0 upto _total_length :
        if substring (j,j+1) of s = " " :  
            _spaces := _spaces+1 ; 
        else : 
            exitif true ; 
        fi 
    endfor  
    output :=  substring (_spaces,_total_length) of s;
    output
enddef;

vardef _get_first_block(expr s)=
    save output;
    string output;
    output:=_delete_first_spaces(s);
    _total_length:= length output;
    _size := 0 ;
    for j = 0 upto _total_length :
        if substring (j,j+1) of output <> " " :  
            _size := _size+1 ; 
        else: 
            exitif(true) ; 
        fi 
    endfor
    output :=  substring (0,_size) of output;
    output
enddef;

vardef _drop_first_block(expr s)=
    save output;
    string output;
    output:=_delete_first_spaces(s);
    _total_length:= length output;
    _size := 0 ;
    for j = 0 upto _total_length :
        if substring (j,j+1) of output <> " " :  
            _size := _size+1 ; 
        else : 
            exitif true ; 
        fi 
    endfor 
    output :=  substring (_size,_total_length) of output;
    output
enddef;

% table of moves:
% _chess_moves_table[step][0]->white move
% _chess_moves_table[step][1]->black move
% step starts at 1
string _chess_moves_table[][]; 
numeric _chess_moves_table_numeric[][];
numeric _chess_pgn_step;
numeric _chess_step_numtable;
_chess_step_numtable:=0; % total number of moves (white+black) halfmove
_chess_pgn_step:=0; % total numbre of "couple" moves (should be uncomplete without black move) 

def get_halfmove_number=
    _chess_step_numtable
enddef;

def get_totalmove_number=
    _chess_pgn_step
enddef;

% macro to deal the block (or half block) between to numbers of PNG step
% s = 3. Nf6 c6 4. [...]   
vardef _get_move(expr s)=
    save output,_step;
    string output;
    numeric _step;
    output:=s;
    % drop the step
    _step := scantokens(_get_first_block(output));
    output:=_drop_first_block(output); % get rid of i. 
    
    % get the white move and drop it
    _chess_moves_table[_chess_pgn_step][0]:=_get_first_block(output); %get the white move
    _extract_move(_chess_step_numtable,_get_first_block(output),"white"); % build the numeric table
    _chess_step_numtable:=_chess_step_numtable+1;
    output:=_drop_first_block(output); % rid of the treated block
    output:=_delete_first_spaces(output); 
    % get the black move and drop it
    if((output)<>""): 
        _chess_moves_table[_chess_pgn_step][1]:=_get_first_block(output);
        _extract_move(_chess_step_numtable,_get_first_block(output),"black");
        _chess_step_numtable:=_chess_step_numtable+1;
        output:=_drop_first_block(output);
    fi
    _chess_pgn_step:=_chess_pgn_step+1;
    output
enddef;

def _build_chess_moves_tables(expr s)=
    save output;
    string output;
    output:=s;
    forever:
        output:=_get_move(output);
        output:=_delete_first_spaces(output);
        exitif(output="");
    endfor
enddef;

% intern debug macro
def _show_chess_moves_table=
    for i:=0 upto _chess_pgn_step-1:
        show "move";
        show _chess_moves_table[i][0];
        if(2*i<_chess_step_numtable-1): % if the is no black move
            show _chess_moves_table[i][1];
        fi
    endfor 
enddef;

% intern debug macro
def _show_chess_moves_table_numeric=
    for i:=0 upto _chess_step_numtable-1:
        show "move";
        show _chess_moves_table_numeric[i][0];
        show _chess_moves_table_numeric[i][1];
        show _chess_moves_table_numeric[i][2];
        show _chess_moves_table_numeric[i][3];
        show _chess_moves_table_numeric[i][4];
        show _chess_moves_table_numeric[i][5];
        show _chess_moves_table_numeric[i][6];
    endfor 
enddef;

vardef _is_cap(expr c)=
    if((c="B") or (c="K") or (c="N") or (c="Q") or (c="R")):
        true
    else:
        false
    fi
enddef;

vardef _cap_to_int(expr c,wb)=
    numeric _pm;
    _pm:=1;
    if(wb="black"):
        _pm:=-1;
    fi
    if(c="B"):
        _pm*_intWBishop
    elseif(c="K"):
        _pm*_intWKing
    elseif(c="N"):
        _pm*_intWKnight
    elseif(c="Q"):
        _pm*_intWQueen
    elseif(c="R"):
        _pm*_intWRook
    fi
enddef;

vardef _cap_to_int(expr c,wb)=
    numeric _pm;
    _pm:=1;
    if(wb="black"):
        _pm:=-1;
    fi
    if(c="B"):
        _pm*_intWBishop
    elseif(c="K"):
        _pm*_intWKing
    elseif(c="N"):
        _pm*_intWKnight
    elseif(c="Q"):
        _pm*_intWQueen
    elseif(c="R"):
        _pm*_intWRook
    fi
enddef;

vardef _lettre_to_int(expr a)=
    if(a="a"):
        1
    elseif(a="b"):
        2
    elseif(a="c"):
        3
    elseif(a="d"):
        4
    elseif(a="e"):
        5
    elseif(a="f"):
        6
    elseif(a="g"):
        7
    elseif(a="h"):
        8
    fi
enddef;

def _str_to_int(expr i)=
    if(i="1"):
        1
    elseif(i="2"):
        2
    elseif(i="3"):
        3
    elseif(i="4"):
        4
    elseif(i="5"):
        5
    elseif(i="6"):
        6
    elseif(i="7"):
        7
    elseif(i="8"):
        8
    fi
enddef;

numeric _chess_extract_move_tab[];

vardef _extract_single_move(expr s,wb)=
    % function to convert a PGN move (ie Nc6)
    % to a array of numerics (type, wb,letter, nbr, capture,promotion,ambiguity)
    % no castle moves !!!
    % s is the string of PGN move
    % wb is a string equal to "white" or "black" 
    % s=Nc6,wb="white" -> (_intBKnigh,+-1,3,6,0,0,0)
    % capture is boolean
    % promotion gives the int corresponding to the piece
    % ambiguity gives the column if ambiguity 
    save _str,output,_piecetype,_letter,_nbr,_capture,_ambiguity;
    numeric _pm,_capture,_promotion,_ambiguity;
    _promotion:=0;
    _pm:=1;
    _capture:=0;
    _ambiguity:=0;
    if(wb="black"):
        _pm:=-1;
    fi
    numeric _piecetype,_letter,_nbr;
    string _str;
    numeric output[];
    _str := s;
    _length:= length(_str);
    if(_str="O-O"):
        _piecetype:=100;
        _letter:=100;
        _nbr:=100;
    elseif(_str="O-O-O"):
        _piecetype:=1000;
        _letter:=1000;
        _nbr:=1000;
    elseif(_is_cap(_get_char(_str,0))): % if the first char is a cap
        _piecetype:=_cap_to_int(_get_char(_str,0),wb);
        if(length(_str)=3): % type Nf6
            _letter:=_lettre_to_int(_get_char(_str,1));
            _nbr:=_str_to_int(_get_char(_str,2));
        elseif(length(_str)=4):
            if((_get_char(_str,3)="+") or (_get_char(_str,3)="#")): % type Nf4#
                _letter:=_lettre_to_int(_get_char(_str,1));
                _nbr:=_str_to_int(_get_char(_str,2));
            elseif(_get_char(_str,1)="x"): % capture Nxf4
                _capture:=1;
                _letter:=_lettre_to_int(_get_char(_str,2));
                _nbr:=_str_to_int(_get_char(_str,3));
            else: % ambiguity Rfe2
                _letter:=_lettre_to_int(_get_char(_str,2));
                _nbr:=_str_to_int(_get_char(_str,3));
                _ambiguity:=_lettre_to_int(_get_char(_str,1));
            fi
        elseif(length(_str)=5): 
            if(_get_char(_str,1)="x"): % capture type Nxf6+
                _capture:=1;
                _letter:=_lettre_to_int(_get_char(_str,2));
                _nbr:=_str_to_int(_get_char(_str,3));
            else: % ambiguity Rfe2(+|#)
                _letter:=_lettre_to_int(_get_char(_str,2));
                _nbr:=_str_to_int(_get_char(_str,3));
                _ambiguity:=_lettre_to_int(_get_char(_str,1));
            fi
        fi
    else:
        _piecetype:=_pm;
        if(length(_str)=2): % type f6
            _letter:=_lettre_to_int(_get_char(_str,0));
            _nbr:=_str_to_int(_get_char(_str,1));
        elseif(length(_str)=3): % type f6+
            _letter:=_lettre_to_int(_get_char(_str,0));
            _nbr:=_str_to_int(_get_char(_str,1));    
        elseif(length(_str)>=4): % type exd8(+/#) or e8=Q(+/#)
            if((_get_char(_str,1)="x") or (_get_char(_str,3)="#")): % type exd8
                _capture:=1;
                _letter:=_lettre_to_int(_get_char(_str,2));
                _nbr:=_str_to_int(_get_char(_str,3));
                _ambiguity:=_lettre_to_int(_get_char(_str,0));
            else: % capture e8=Q
                _promotion:=_lettre_to_int(_get_char(_str,3));
                _letter:=_lettre_to_int(_get_char(_str,0));
                _nbr:=_str_to_int(_get_char(_str,1));
            fi
        fi
    fi
    _chess_extract_move_tab[0]:=_piecetype;
    _chess_extract_move_tab[1]:=_pm;
    _chess_extract_move_tab[2]:=_letter;
    _chess_extract_move_tab[3]:=_nbr;
    _chess_extract_move_tab[4]:=_capture;
    _chess_extract_move_tab[5]:=_promotion;
    _chess_extract_move_tab[6]:=_ambiguity;
enddef;

vardef _extract_move(expr _step,s,wb)=
    _extract_single_move(s,wb);
    _chess_moves_table_numeric[_step][0]:=_chess_extract_move_tab[0];
    _chess_moves_table_numeric[_step][1]:=_chess_extract_move_tab[1];
    _chess_moves_table_numeric[_step][2]:=_chess_extract_move_tab[2];
    _chess_moves_table_numeric[_step][3]:=_chess_extract_move_tab[3];
    _chess_moves_table_numeric[_step][4]:=_chess_extract_move_tab[4];
    _chess_moves_table_numeric[_step][5]:=_chess_extract_move_tab[5];
    _chess_moves_table_numeric[_step][6]:=_chess_extract_move_tab[6];
enddef;

def build_chessboards_from_pgn(expr s)=
    _build_chess_moves_tables(s);
    _build_all_chessboards;
enddef;

def build_chessboards_from_pgn_file(expr s)=
    set_empty_chessboard;
    string _rf;
    _rf:=readfrom s;
    _build_chess_moves_tables(_rf);
    _build_all_chessboards;
enddef;
