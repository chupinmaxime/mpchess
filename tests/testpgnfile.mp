input mpchess;


build_chessboards_from_pgn_file("test.pgn");

for i:=0 upto get_halfmove_number-1:
beginfig(i);
init_backboard;
%set_black_view;
    draw backboard;
    show_last_move(i);
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