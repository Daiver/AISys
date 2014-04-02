calc(Atom) :-
        term_to_atom(Expr, Atom),
        A is Expr,
        write(A),
        nl.

    tmp(A) :-
        A is 100.


    init :- ['bayes.pl'], ['loandata.pl'].
    classify(E, C, P) :- probs([emp=yes, buy=comp, sex=f, married=yes],P),max(P,M),
        write(M), extractC(M,C), extractP(M, P). %, nl, float(X), R = X, write('X='), write(X), nl.

    extractC(C/P, X) :- X = C.
    extractP(C/P, X) :- X is P.

    tmp2(A, B) :-
        %classify([], B), 
        write('YEAH'). %, B is 42 * A.

:- initialization(init).
