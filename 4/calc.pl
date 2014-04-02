calc(Atom) :-
        term_to_atom(Expr, Atom),
        A is Expr,
        write(A),
        nl.

    tmp(A) :-
        A is 100.


    init :- ['bayes.pl'], ['loandata.pl'].
    
    empUP(1, yes).
    empUP(0, no).
    buyUP(1, car).
    buyUP(0, comp).
    sexUP(0, f).
    sexUP(1, m).
    marrUP(1, yes).
    marrUP(0, no).

    classify(E, B, S, Mar, R, PP) :- empUP(E, E1), buyUP(B, B1), sexUP(S, S1), 
        marrUP(Mar, M1),
        probs([emp=E1, buy=B1, sex=S1, married=M1],P),max(P,M),
        extractC(M,R), extractP(M, PP). %, nl, float(X), R = X, write('X='), write(X), nl.

    extractC(C/P, X) :- X = C.
    extractP(C/P, X) :- X is P.

    tmp2(A, C, P) :-
        classify([], C, P), write('YEAH'). %, B is 42 * A.

:- initialization(init).
