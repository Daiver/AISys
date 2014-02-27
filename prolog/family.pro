
man(ben).
man(den).

woman(lena).

married(lena, den).

is_married(A, B) :- married(B, A); married(A,B).

parent(ben, den).

:- initialization(main).

main:-
    nl,
    % man(A),
    findall([A,B], is_married(A,B), X),
    write(X),nl.
