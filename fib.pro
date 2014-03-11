gcd2(A, A, A).
gcd2(A, B, G) :- A>0, B>0, A >= B , N is (A - B), gcd2(N, B, G).
gcd2(A, B, G) :- A>0, B>0, A < B , N is (B - A), gcd2(A, N, G).

% gcd2(A, 0, A).
% gcd2(A, B, G) :- A>0, B>0, N is mod(A, B), gcd2(B, N, G).
 
:- initialization(main).
 
fib(1, 1) :- !.
fib(2, 2) :- !.
fib(A, B) :- A1 is (A - 1), A2 is (A - 2), fib(A1, C), fib(A2, D),B is (C * D).

main :-
    % argument_list(Args),
    % str2int(Args, Numbers),
    gcd2(60,40, G),
    write(G), nl,
    fib(7, L), write(L), nl.
