(TeX-add-style-hook
 "mpchess-doc-fr"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("ltxdoc" "french")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("bclogo" "tikz") ("FiraSans" "sfdefault") ("firamath-otf" "mathrm=sym") ("babel" "french") ("hyperref" "colorlinks=true" "urlcolor=orange" "linkcolor=orange" "menucolor=black" "citecolor=orange")))
   (add-to-list 'LaTeX-verbatim-environments-local "VerbatimOut")
   (add-to-list 'LaTeX-verbatim-environments-local "SaveVerbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "LVerbatim*")
   (add-to-list 'LaTeX-verbatim-environments-local "LVerbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "BVerbatim*")
   (add-to-list 'LaTeX-verbatim-environments-local "BVerbatim")
   (add-to-list 'LaTeX-verbatim-environments-local "Verbatim*")
   (add-to-list 'LaTeX-verbatim-environments-local "Verbatim")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "Verb*")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "Verb")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "latex2e"
    "ltxdoc"
    "ltxdoc10"
    "tcolorbox"
    "enumitem"
    "bclogo"
    "mflogo"
    "hologo"
    "luamplib"
    "biblatex"
    "wrapfig"
    "siunitx"
    "imakeidx"
    "fancyvrb"
    "xparse"
    "xargs"
    "FiraSans"
    "firamath-otf"
    "xspace"
    "animate"
    "babel"
    "hyperref")
   (TeX-add-symbols
    '("vitem" ["argument"] 0)
    '("textme" 1)
    "ctan"
    "commande"
    "optstar"
    "R"
    "mpchess")
   (LaTeX-add-labels
    "tab:pieces"
    "com:chessboard")
   (LaTeX-add-bibliographies
    "ctan")
   (LaTeX-add-index-entries
    "init_backboard@\\lstinline+init_backboard+"
    "set_backboard_width@\\lstinline+set_backboard_width+"
    "get_backboard_width@\\lstinline+get_backboard_width+"
    "set_backboard_size@\\lstinline+set_backboard_size+"
    "get_backboard_size@\\lstinline+get_backboard_size+"
    "get_square_dim@\\lstinline+get_square_dim+"
    "set_color_theme@\\lstinline+set_color_theme+"
    "set_white_color@\\lstinline+set_white_color+"
    "set_black_color@\\lstinline+set_black_color+"
    "set_coords_outside@\\lstinline+set_coords_outside+"
    "set_coords_inside@\\lstinline+set_coords_inside+"
    "set_coords_font@\\lstinline+set_coords_font+"
    "set_no_coords@\\lstinline+set_no_coords+"
    "set_coords@\\lstinline+set_coords+"
    "set_white_view@\\lstinline+set_white_view+"
    "set_black_view@\\lstinline+set_black_view+"
    "set_white_player@\\lstinline+set_white_player+"
    "set_black_player@\\lstinline+set_black_player+"
    "set_players_side@\\lstinline+set_players_side+"
    "set_pieces_theme@\\lstinline+set_pieces_theme+"
    "set_white_to_move@\\lstinline+set_white_to_move+"
    "set_black_to_move@\\lstinline+set_black_to_move+"
    "set_whos_to_move@\\lstinline+set_whos_to_move+"
    "unset_whos_to_move@\\lstinline+unset_whos_to_move+"
    "chessboard@\\lstinline+chessboard+"
    "init_chessboard@\\lstinline+init_chessboard+"
    "set_empty_chessboard@\\lstinline+set_empty_chessboard+"
    "add_white_pieces@\\lstinline+add_white_pieces+"
    "add_black_pieces@\\lstinline+add_black_pieces+"
    "clear_squares@\\lstinline+clear_squares+"
    "clear_areas@\\lstinline+clear_areas+"
    "clear_files@\\lstinline+clear_files+"
    "clear_ranks@\\lstinline+clear_ranks+"
    "build_chessboard_from_fen@\\lstinline+build_chessboard_from_fen+"
    "build_chessboards_from_pgn@\\lstinline+build_chessboards_from_pgn+"
    "chessboard_step@\\lstinline+chessboard_step+"
    "show_last_move@\\lstinline+show_last_move+"
    "set_last_move_color@\\lstinline+set_last_move_color+"
    "get_halfmove_number@\\lstinline+get_halfmove_number+"
    "get_totalmove_number@\\lstinline+get_totalmove_number+"
    "draw_arrows@\\lstinline+draw_arrows+"
    "set_arrow_width@\\lstinline+set_arrow_width+"
    "color_square@\\lstinline+color_square+"
    "draw_circles@\\lstinline+draw_circles+"
    "draw_crosses@\\lstinline+draw_crosses+"
    "draw_comment@\\lstinline+draw_comment+"
    "set_comment_color@\\lstinline+set_comment_color+"
    "clear_chessboard@\\lstinline+clear_chessboard+"
    "reset_mpchess@\\lstinline+reset_mpchess+"
    "clip_chessboard@\\lstinline+clip_chessboard+")
   (LaTeX-add-tcolorbox-tcbuselibraries
    "listings,breakable")
   (LaTeX-add-xcolor-definecolors
    "darkred"
    "vert"
    "bleu"
    "orange"
    "code")
   (LaTeX-add-xparse-macros
    '("\\NewDocumentCommand{\\package}{ m }" "package" " m " "New"))
   (LaTeX-add-fancyvrb-saveverbs
    "Vitem"
    "vsave"))
 :latex)

