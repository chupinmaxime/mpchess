input mpchess;


string in;
in := "rnbqkbnr/pppppppp/8/8/8/8/PPPPPPPP/RNBQKBNR w KQkq - 0 1";
in := "rnbqkbnr/pp1ppppp/8/2p5/4P3/5N2/PPPP1PPP/RNBQKB1R b KQkq - 1 2";
build_chessboard_from_fen(in);

beginfig(0);
init_backboard;
draw backboard;
draw chessboard;
endfig;


beginfig(1);
build_chessboard_from_fen_file("test.fen");
init_backboard;
draw backboard;
draw chessboard;
endfig;
end.
