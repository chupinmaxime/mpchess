input mpchess;


string in;
in := "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1";
in := "rnbqkbnr/pp1ppppp/8/2p5/4P3/5N2/PPPP1PPP/RNBQKB1R b KQkq - 1 2";
_chess_extract_position(in);

beginfig(0);
init_backboard;
%set_black_view;
    %draw backboard;
show "test";
show _white_to_move;
    draw chessboard;
endfig;

end.
