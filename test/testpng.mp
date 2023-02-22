input mpchess;


string in;
in := "   1. e4 e5 2. Nf3 Nc6 3. Nxe5 Nxe5 4. Bb5 c6";
build_chessboards_from_pgn(in);

for i:=0 upto get_halfmove_number-1:
beginfig(i);
init_backboard;
    draw backboard;
    draw chessboard_step(i);
    for  j:=0 upto _chess_wcaptures_nbr[i]-1:
        show _chess_white_captures[i][j];
    endfor
    for  j:=0 upto _chess_bcaptures_nbr[i]-1:
        show _chess_black_captures[i][j];
    endfor
endfig;
endfor

end.