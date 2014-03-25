
checkWin(_,2,2,2) :- write('Yeah'),nl, fail.
checkWin(S,W,G,C) :- !.

checkLoose(W,G,C) :- W \= G , G \= C.

% 1 - wolf 2 - goat 3 - cabbage
load(1, W,G,C, Wr,Gr,Cr) :- Wr is 0, Gr is G, Cr is C, checkLoose(Wr,Gr,Cr).
load(2, W,G,C, Wr,Gr,Cr) :- Wr is W, Gr is 0, Cr is C, checkLoose(Wr,Gr,Cr).
load(3, W,G,C, Wr,Gr,Cr) :- Wr is W, Gr is G, Cr is 0, checkLoose(Wr,Gr,Cr).

turn(1,2).
turn(2,1).

unload(S, 0,G,C, Wr,Gr,Cr) :- Wr is S, Gr is G, Cr is C.
unload(S, W,0,C, Wr,Gr,Cr) :- Wr is W, Gr is S, Cr is C.
unload(S, W,G,0, Wr,Gr,Cr) :- Wr is W, Gr is G, Cr is S.

next(S,W,G,C) :- checkLoose(W,G,C) , unload(S,W,G,C, Wr,Gr,Cr) , traverse(S,Wr,Gr,Cr).

% side wolf goat cabbage
% 0 - transporting 1,2 - sides

checkAlready(S) :- g_read(global_vis, G), \+ (member(S, G)), g_assign(global_vis, [S | G]).

traverse(S,W,G,C) :- checkAlready([S,W,G,C]), checkWin(S,W,G,C), turn(S,S2),
    (
        next(S2, 0, G, C) ; 
        next(S2, W, 0, C) ; 
        next(S2, W, G, 0)
    ).

%test(A) :- ! , (fail ; !).
%fff(_) :- g_read(f,A), B = [10 | A], g_assign(f,B), member(10, B).

%GLOBAL ::= integer.

:- initialization(main).
:- dynamic( atom_counter/2 ).
%:- dynamic( g_assign/2 ).

main :-
    %F ::= 10,
    %member([2,3], [[2,3], [5,6]]),
    %g_assign(f, [1,2,3]),
    %g_read(f,F), write(F), fff(10), g_read(f, L), nl, write(L)
    g_assign(global_vis, []),
    %test(A),
    nl,traverse(1,1,1,1),nl,write('END').

