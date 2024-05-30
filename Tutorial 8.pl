generator( T ) :-
	between( 1, 10000, T ).

celsius_to_fahrenheit( C, F ) :-
	F is 1.8 * C + 32.

whole_number( X ) :-
    floor( X ) =:= ceil( X ).

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

decreasing( [] ).
decreasing( [_] ).
decreasing( [D1,D2|DS] ) :-
    D1 > D2,
    decreasing( [D2|DS] ).

increasing( [] ).
increasing( [_] ).
increasing( [D1,D2|DS] ) :-
    D1 < D2,
    increasing( [D2|DS] ).

different( [] ).
different( [H|T] ) :-
    \+ member( H, T ),
    different( T ).

tester( C ) :-
    celsius_to_fahrenheit( C, W ),
    whole_number( W ),
    F is truncate( W ),
    digits( C, CS ),
    different( CS ),
    decreasing( CS ),
    digits( F, FS ),
    different( FS ),
    increasing( FS ).

main :- generator( T ), tester( T ), write( T ).