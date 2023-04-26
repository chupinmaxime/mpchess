input mpchess

build_chessboards_from_pgn_file("pgnfile.pgn");

for i:=0 upto get_halfmove_number:
beginfig(i);
init_backboard;
%set_black_view;
    draw backboard;
    show_last_move(i);
    draw chessboard_step(i);
endfig;
endfor

end



