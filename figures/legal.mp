input mpchess

string in;
in:="1. e4 e5 2. Bc4 d6 3. Nf3 Bg4 4. Nc3 g6 5. Nxe5 Bxd1 ";
build_chessboards_from_pgn(in);

beginfig(0);
init_backboard;
draw backboard;
show_last_move(10);
color_square(0.3[green,black])("c4","c3","e5");
draw chessboard_step(10);
draw_arrows(0.3[green,black])("e5|-f7","c3-|d5");
draw_arrows(0.3[red,black])("c4--f7");
endfig;
end.