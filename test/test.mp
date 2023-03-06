input mpchess;

beginfig(0);
    string in;
    in := "   1. e4 e5 2. Nf3 Nc6 3. Nxe5 Nxe5 4. Bb5";
    _build_chess_moves_tables(in);
    _show_chess_moves_table;
    _show_chess_moves_table_numeric;
    %show _pawn_candidate(3,2,3,4,"white");
    %sshow _pawn_candidate(3,2,3,4,"black");
endfig;

beginfig(1);
    init_chessboard;%set_coords_outside;
    show _intBKing;
    set_backboardWidth(8cm);set_coords_outside;
    %set_black_view;
    set_white_player("Roxane \textbf{Spillane Chupin}");
    set_black_player("Eliott");
    init_backboard;
    draw backboard;
    color_square(red)("b5");
    color_square(red)("a6","c5");
    clear_areas("a1-b7","f1-g2");
    clear_files("c","e");
    clear_ranks("1","7");
    draw chessboard_step(0);
    show _chess_unit_ortho_vec((1,1));
    draw_arrows("a4-|c2")(red);
    draw_arrows("g1-|f3")(red);
    %draw_arrows("e4--g7")(red);
    %draw_arrows("f7|-d6")(red);
    set_arrow_width(0.4);
    draw_arrows("f7-|d6")(red);
    %draw_arrows("g1|-h3")(red);
    draw_arrows("g1-|h3")(red);
    _draw_circles("e6")(red);
endfig;


beginfig(4);
    init_chessboard;
    usetheme("Classical");
    set_coords_outside;
    show _intBKing;
    set_backboardWidth(8cm);
    set_black_view;
    set_white_player("Roxane {\bf Spillane Chupin}");
    set_black_player("Eliott");
    init_backboard;
    draw backboard;
    draw chessboard_step(0);
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

reset_backboard;
beginfig(5);
    init_backboard;
    set_empty_chessboard;
    add_white_pieces("e1");
    add_black_pieces("e7","f6","Kb8");
    draw backboard;
    draw chessboard_step(0);
endfig;

end.