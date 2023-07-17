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
    set_backboard_width(8cm);
    set_coordinates_position("outside");
    set_color_theme("GreenLichess");
    set_board_style("pyramidal");
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
    draw_arrows(red)("a4-|c2","g1-|f3");

    %draw_arrows("e4--g7")(red);
    %draw_arrows("f7|-d6")(red);
    set_arrow_width(0.4);
    draw_arrows(red)("f7-|d6");
    %draw_arrows("g1|-h3")(red);
    draw_arrows(red)("g1--h3");
    draw_circles(red)("e6","a5");
    draw_crosses(blue)("f6","b2");
endfig;


beginfig(4);
    init_chessboard;
    set_color_theme("Wood");
    set_coordinates_position("outside");
    show _intBKing;
    set_backboard_width(8cm);
    set_pieces_theme("mpchess");
    
    set_black_view;
    set_white_player("Roxane {\bf Spillane Chupin}");
    set_black_player("Eliott");
    init_backboard;
    add_white_pieces("f6");
    add_black_pieces("c3");
    add_white_pieces("Ka6");
    
    draw backboard;
    
    draw chessboard_step(0);
    set_possible_moves_color(0.4[red,black]);
    %show_possible_moves("e7");
    %show_possible_moves("d2");
    %show_possible_moves("g8");
    show_possible_moves("a6");
    %clip_chessboard("b2-h8");
endfig;

beginfig(2);
    draw _chess_wQ;
    draw bbox _chess_wQ;
endfig;

reset_mpchess;
beginfig(3);
    set_backboard_width(8cm);
    set_color_theme("Colored");
    set_backboard_size(4);
    set_white_squares_color((0.9,0.8,0.8));
    set_black_squares_color((0.7,0.6,0.6));
   
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

reset_mpchess;
beginfig(5);
    set_pieces_theme("skak");
    hide_coordinates;
    show_coordinates;
    init_backboard;
    set_empty_chessboard;
    add_white_pieces("e1");
    add_black_pieces("e7","f6","Kb8");
    draw backboard;
    draw chessboard_step(0);
endfig;

reset_mpchess;
beginfig(6);
    set_pieces_theme("mpchess");
    %set_black_view;
    init_backboard;
    init_chessboard;
    draw backboard;
    draw chessboard_step(0);
    draw_comment("?!","c7");
    draw_white_main_lines("e4","d4","Nf3","Nc3");
    draw_black_main_lines("a5","Nc6","d5");
endfig;

end.