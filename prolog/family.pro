
man(vitaliy).
man(kirill).
man(konstantin).
man(alexander).
man(grigoriy).
man(maxim).
man(nikolay).

woman(alexandra).
woman(tamara).
woman(inna).
woman(natalia).
woman(anna).

parent(nikolay, vitaliy).
parent(nikolay, alexander).

parent(anna, vitaliy).
parent(anna, alexander).

parent(vitaliy, kirill).
parent(alexandra, kirill).

parent(vitaliy, konstantin).
parent(alexandra, konstantin).

parent(grigoriy, alexandra).
parent(tamara, alexandra).

parent(alexander, natalia).
parent(inna, natalia).

parent(alexander,maxim).
parent(inna ,maxim).

married(vitaliy, alexandra).
married(grigoriy, tamara).
married(inna, alexander).
married(anna, nikolay).

% rules
is_married(A, B)     :- married(B, A); married(A,B).
mother(A, B)         :- woman(A), parent(A, B).
father(A, B)         :- man(A), parent(A, B).
son(A, B)            :- man(A), parent(B, A).
daughter(A, B)       :- woman(A), parent(B, A).
grandparent(A, B)    :- parent(A, C), parent(C, B).
grandfather(A, B)    :- man(A), grandparent(A, B).
grandmother(A, B)    :- woman(A), grandparent(A, B).
grandchild(A, B)     :- grandparent(B, A).
sysorbroth(A, B)     :- parent(C, A), parent(C, B), A \= B.

sister(A, B)         :- woman(A), sysorbroth(A, B).
brother(A, B)        :- man(A), sysorbroth(A, B).

cousin(A, B)         :- parent(C, A), parent(D, B), sysorbroth(C, D).

unoraun(A, B)        :- parent(C, B), sysorbroth(A, C).
uncle(A, B)          :- man(A), unoraun(A, B).
aunt(A, B)           :- woman(A), unoraun(A, B).

brother_in_law(A, B) :- man(A), is_married(B, C), brother(A, C).
sister_in_law(A, B)  :- woman(A),is_married(B, C), sister(A, C).

:- initialization(main).

main:-
    nl,
    % man(A),
    write('mother'),
    findall([A,B], mother(A,B), X),
    write(X),nl,
    write('father'),
    findall([A1,B1], father(A1,B1), X1),
    write(X1),nl,
    write('grandparent'),
    findall([A1,B1], grandparent(A1,B1), X2),
    write(X2),nl,
    write('grandmother'),
    findall([A1,B1], grandmother(A1,B1), X3),
    write(X3),nl,
    write('grandfather'),
    findall([A1,B1], grandfather(A1,B1), X4),
    write(X4),nl,
    write('brother'),
    findall([A1,B1], brother(A1,B1), X5),
    write(X5),nl,
    write('uncle'),
    findall([A1,B1], uncle(A1,B1), X6),
    write(X6),nl,
    write('cousin'),
    findall([A1,B1], cousin(A1,B1), X7),
    write(X7),nl.
