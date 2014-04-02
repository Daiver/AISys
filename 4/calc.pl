calc(Atom) :-
        term_to_atom(Expr, Atom),
        A is Expr,
        write(A),
        nl.

    tmp(A) :-
        A is 100.


    init :- ['bayes.pl'], ['loandata.pl'].
    classify(E,R, PP) :- probs([emp=yes, buy=comp, sex=f, married=yes],P),max(P,M),
        extractC(M,R), extractP(M, PP). %, nl, float(X), R = X, write('X='), write(X), nl.

    extractC(C/P, X) :- X = C.
    extractP(C/P, X) :- X is P.

    tmp2(A, C, P) :-
        classify([], C, P), write('YEAH'). %, B is 42 * A.

:- initialization(init).
