calc(Atom) :-
        term_to_atom(Expr, Atom),
        A is Expr,
        write(A),
        nl.

    tmp(A) :-
        A is 100.

    tmp2(A, B) :-
        B is 42 * A.
