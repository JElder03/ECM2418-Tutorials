hello_world :-
   write('Hello, world!').


factorial(0, 1).
factorial(N, R) :-
   N1 is N - 1,
   factorial(N1 , R1),
   R is R1 * N.


sum_list([],0).
sum_list([X|XS], R) :-
   sum_list(XS, Rest),
   R is X + Rest.


max_list([X],X).

max_list([X|XS], max_list(XS)) :-
   max_list(XS, MaxRest),
   MaxRest >= X.

max_list([X|XS], X) :-
   max_list(XS, MaxRest),
   X >= MaxRest.


member_list([E|_], E).
member_list([_|XS], E) :- member_list(XS, E).


reverse_list([], []).
reverse_list([X|XS], R) :-
    reverse_list(XS, ReversedRest),
    append(ReversedRest, [X], R).


insert_list([], E, [E]).
insert_list([X|XS], E, [E,X|XS] ) :-
    E >= X.
insert_list([X|XS], E, [X|Rest]) :-
    E < X,
    insert_list(XS, E, Rest).

sort_list([], []).
sort_list([H|T], R) :-
  sort_list(T, W),
  insert_list(W, H, R).

main :-
    sort_list([1,3,4,2,8,6,5], X), write(X).