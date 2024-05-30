length_list([], 0).
length_list([_|XS], R) :-
  length_list(XS, W),
  R is 1 + W.

take_list(_, [], []).
take_list(0, _, []).
take_list(N,[H|T], [H|W]) :-
  N1 is N - 1,
  take_list(N1, T, W).

drop_list(_, [], []).
drop_list(0, X, X).
drop_list(N, [_|T], R) :-
  N1 is N - 1,
  drop_list(N1, T, R).

split_list(_, [], [], []).
split_list(0, X, [], X).
split_list(N, [H|T], [H|AS], BS) :-
  N1 is N - 1,
  split_list(N1, T, AS, BS).

squares([], []).
squares([H|T], [H2|T2]) :-
  H2 is H ^ 2,
  squares(T, T2).

evens([], []).
evens([H|T], [H|W]) :-
  0 is H mod 2,
  evens(T, W).
evens([_|T], W) :-
  evens(T, W).

product([], 1).
product([H|T], R) :-
  product(T, W),
  R is H * W.


main :- 
  product([4,5,6,7], X),
  write(X).