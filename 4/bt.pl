
:- initialization(main).
 
main :-
    ['bayes.pl'], ['loandata.pl'],
    write('Hello'),nl, example(4,C,E),probs(E,P), write(P), nl.
