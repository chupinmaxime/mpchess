input mpchess;

beginfig(1);
    init_chessboard;
    set_chessboardWidth(4cm);
    init_backboard;
    draw backboard;
endfig;
beginfig(2);
    set_chessboardWidth(10cm);
    usetheme("Classical");
    init_backboard;
    draw backboard;
endfig;

reset_backboard;
beginfig(3);
    
    usetheme("Colored");
    set_chessboardSize(4);
    set_whiteColor((0.9,0.8,0.8));
    set_blackColor((0.7,0.6,0.6));
    init_backboard;
    draw backboard;
endfig;



end.