fact(0, 1) :- !.
fact(N, B) :- N1 = N - 1, fact(N1, F), B = N*F.

:- initialization(main).
 
 
main :-
    fact(3, G),
    write(G), nl.
