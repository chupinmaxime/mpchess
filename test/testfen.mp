input mpchess;


string in;
in := "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1";
_chess_extract_position(in);

beginfig(0);
init_backboard;
%set_black_view;
    %draw backboard;
    draw chessboard_step(0);
endfig;
endfor

end.