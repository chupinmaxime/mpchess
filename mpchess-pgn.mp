def _parse_pgn(expr s)=
    string _str;
    _str := s;
    _total_length:= length s;
    show _str;
enddef;

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
        else : 
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
numeric _chess_pgn_step;
_chess_pgn_step:=0;

vardef _get_move(expr s)=
    save output;
    string output;
    output:=s;
    % drop the step
    output:=_drop_first_block(output);
    _chess_pgn_step:=_chess_pgn_step+1;
    % get the white move and drop it
    _chess_moves_table[_chess_pgn_step][0]:=_get_first_block(output);
    output:=_drop_first_block(output);
    % get the black move and drop it
    _chess_moves_table[_chess_pgn_step][1]:=_get_first_block(output);
    output:=_drop_first_block(output);
    output
enddef;

def _build_chess_moves_table(expr s)=
    save output;
    string output;
    output:=s;
    forever:
        output:=_get_move(output);
        output:=_delete_first_spaces(output);
        exitif(output="");
    endfor
enddef;

def _show_chess_moves_table=
    i:=1;
    forever:
    if known _chess_moves_table[i][0]:
        show "move";
        show _chess_moves_table[i][0];
        show _chess_moves_table[i][1];
        i:=i+1;
    fi
    exitif unknown _chess_moves_table[i][0];
    endfor 
enddef;

