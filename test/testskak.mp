input mpchess-skak;
u:=1cm;
beginfig(0);
fill (-5u,-10u)--(5u,-10u)--(5u,3u)--(-5u,3u)--cycle withcolor 0.8[red,white];
    _skak_K(2cm,-1,0,"black");
    _skak_K(2cm,1,0,"white");
    _skak_Q(2cm,-1,-1,"black");
    _skak_Q(2cm,1,-1,"white"); 
    _skak_N(2cm,-1,-2,"black");
    _skak_N(2cm,1,-2,"white");  
    _skak_B(2cm,-1,-3,"black");
    _skak_B(2cm,1,-3,"white"); 
    _skak_R(2cm,-1,-4,"black");
    _skak_R(2cm,1,-4,"white");
    _skak_p(2cm,-1,-5,"black");
    _skak_p(2cm,1,-5,"white");
    draw _chess_skak_bB;
endfig;
end.