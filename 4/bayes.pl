/*------------------------------------------------------*/
/*  Simple Bayes Classifier (SWI-Prolog)                */
/*------------------------------------------------------*/
/*  (C) 2001 Zdravko Markov                             */
/*------------------------------------------------------*/
/*  Training data: example(Id,Class,[A1=V1,...,An=Vn]). */
/*  Test data: X=[A1=V1,...,An=Vn]                      */
/*  Call: bayes(+TestData, -Classification).            */
/*------------------------------------------------------*/

bayes(X,C) :-
    probs(X,W),
    max(W,C/_).

probs(X,W) :-
    setof(C,N^E^example(N,C,E),Cs),
    findall(C/P,(member(C,Cs),
                 cond_prob(X,C,PL),
                 class_prob(C,PC),
                 mult(PL,PS),
                 P is PS*PC),W).

cond_prob([],_,[]).
cond_prob([AV|L],C,[AV/P|PL]) :-
    findall(I,example(I,C,_),All),
    length(All,N),
    findall(I,(example(I,C,AVL),member(AV,AVL)),W),
    length(W,M),
    P is M/N,
    cond_prob(L,C,PL).

class_prob(C,PC) :-
    findall(I,example(I,_,_),All),
    length(All,N),
    findall(I,example(I,C,_),W),
    length(W,M),
    PC is M/N.
    
max([X],X) :- !.
max([X/M|T],Y/N) :- 
    max(T,Z/K), 
    (M>K,Y/N=X/M;Y/N=Z/K), !.

mult([],1) :- !.
mult([_/P|L],Ps) :-
    mult(L,P1),
    Ps is P1*P.
