
% type tmp = (integer, integer).

p_turn(1, 2) :- !.
p_turn(2, 1) :- !.

expand([P0, H0 | _], [P1, H1], [P1, H2]) :- 
    p_turn(P0, P1), H1 is (H0 + 10), H2 is (H0 * 2).

check([P, H ]) :- H >= 20, write(P) , write(' win'), nl, fail.
check([P, H ]) :- H < 20.

choose([P1,H1],[P2,H2]) :- H1 >= H2, traverse([P1, H1]), traverse([P2, H2]).
choose([P1,H1],[P2,H2]) :- H1 < H2, traverse([P2, H2]), traverse([P1, H1]).

traverse([P, H]) :- write(P), write(' '), write(H), nl, check([P, H]), expand([P, H], [P1, H1], [P2, H2]), choose([P1, H1], [P2, H2]).


:- initialization(main).
main :-
    traverse([1,2]),
    expand([1,20], L, J), write(L),nl,write(J), nl,
    write('HI'), nl.
