input mpchess;

beginfig(0);
    string in;
    in := "   1. e4 e5 2. Nf3 Nc6 3. Nxe5 Nxe5";
    _parse_pgn(in);
    _build_chess_moves_table(in);
    _show_chess_moves_table;
endfig;

beginfig(1);
    init_chessboard;
    show _intBKing;
    show chessboard[0][1][1];
    set_backboardWidth(8cm);
    set_black_view;
    set_white_player("\tiny Roxane {\bf Spillane Chupin}");
    set_black_player("Eliott");
    init_backboard;
    draw backboard;
    _draw_step_chessboard(0);
endfig;
beginfig(2);
    draw _chess_wQ;
    draw bbox _chess_wQ;
endfig;

reset_backboard;
beginfig(3);
    set_backboardWidth(8cm);
    usetheme("Colored");
    set_chessboardSize(4);
    set_whiteColor((0.9,0.8,0.8));
    set_blackColor((0.7,0.6,0.6));
    init_backboard;
    draw backboard;
    draw _chess_bQ;
    draw bbox _chess_bQ;
    draw _chess_bP;
    draw bbox _chess_bB;
     draw _chess_bB;
    draw bbox _chess_bB;
     draw _chess_bK;
    draw bbox _chess_bK;
         draw _chess_wK;
    draw bbox _chess_wK;
    dotlabel(btex $x$ etex,(0,0));
endfig;



end.