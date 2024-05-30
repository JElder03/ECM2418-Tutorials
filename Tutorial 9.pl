digits( N, [N] ) :-
  N < 10.
digits( N, W ) :-
    N >= 10, 
    div_mod( N, 10, D, M ),
    digits( D, R ),
    append( R, [M], W ).

div_mod( A, B, D, M ) :-
    D is A div B,
    M is A mod B.

nub([], []).
nub([H|T], R) :-
  member(H, T),
  nub(T, R).
nub([H|T], [H|R]) :-
  nub(T, R).

par(N) :-
  digits(N, [X1, X2, X3, X4]),
  nub([X1, X2, X3, X4], [X1, X2, X3, X4]),
  0 is  (X3 * 10 + X4) mod (X1 * 10 + X2).

generator([M, N]) :-
  between(1234, 9876, M), par(M),
  between(1234, 9876, N), par(N).
  
intersection([], _, []).
intersection([X|XS], YS, [X|R]) :-
  member(X, YS),
  intersection(XS, YS, R).
intersection([_|XS], YS, R) :-
intersection(XS, YS, R).

difference([], _, []).
difference([X|XS], YS, R) :-
  member(X, YS),
  difference(XS, YS, R).
difference([X|XS], YS, [X|R]) :-
  difference(XS, YS, R).

party([M, N]) :-
  digits(M, [M1, M2, M3, M4]),
  digits(N, [N1, N2, N3, N4]),
  intersection([M1, M2, M3, M4], [N1, N2, N3, N4], []),
  difference([1,2,3,4,5,6,7,8,9], [M1, M2, M3, M4, N1, N2, N3, N4], [D]),
  0 is M mod D,
  0 is N mod D.

tester([M, N]) :-
  party([M, N]).

main :- generator( X ), tester( X ), write( X ).