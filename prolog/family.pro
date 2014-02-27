
man(ben).
man(den).

woman(lena).

parent(ben, den).
parent(lena, den).

married(lena, den).

% rules
is_married(A, B) :- married(B, A); married(A,B).
mother(A, B) :- woman(A), parent(A, B).
father(A, B) :- man(A), parent(A, B).
son(A, B) :- man(A), parent(B, A).
daughter(A, B) :- woman(A), parent(B, A).
grandparent(A, B) :- parent(A, C), parent(C, B).
grandfather(A, B) :- man(A), grandparent(A, B).
grandmother(A, B) :- woman(A), grandparent(A, B).
grandchild(A, B) :- grandparent(B, A).
sysorbroth(A, B) :- parent(C, A), parent(C, B).

sister(A, B) :- woman(A), sysorbroth(A, B).
brother(A, B) :- man(A), sysorbroth(A, B).

cousin(A, B) :- parent(C, A), parent(D, B), sysorbroth(C, D).

unoraun(A, B) :- parent(C, B), sysorbroth(A, C).
uncle(A, B) :- man(A), unoraun(A, B).
aunt(A, B) :- woman(A), unoraun(A, B).

:- initialization(main).

main:-
    nl,
    % man(A),
    findall([A,B], mother(A,B), X),
    write(X),nl.
