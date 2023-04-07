input mpchess;

beginfig(0);
string pgnstr;
pgnstr := "1. b3 Nf6 2. Bb2 Nh5 3. d4 e6 4. Nc3 Qf6";
build_chessboards_from_pgn(pgnstr);
init_backboard;
draw backboard;
draw chessboard_step(8);
endfig;

end.
