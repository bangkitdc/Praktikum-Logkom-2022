permute(X, 0, 1) :- !.
permute(X, Y, Z) :- 
	X1 is X-1, Y1 is Y-1, permute(X1, Y1, Z1), Z is Z1*X.

getIndex([H|T], X, Index) :-
	(H == X, Index is 1, !);
	(getIndex(T, X, Index1), Index is Index1 + 1).

/* gcd(a,b) = gcd(b, a mod b) */
gcd(X, 0, X) :- !.
gcd(0, X, X) :- !.
gcd(A, B, X) :- A1 is (A mod B), gcd(B, A1, X).
lcm(A, B, X) :- gcd(A, B, Y), X is (A * B) // Y.

printLine(N, 0) :- nl, !.
printLine(N, M) :- write(N), M1 is M - 1, printLine(N, M1).

numberTriangle(0) :- !.
numberTriangle(N) :-
	N > 0,
	printLine(N, N), N1 is N - 1, numberTriangle(N1).

/* 1 1 2 3 5 8 */
fibonaci(1, 1) :- !.
fibonaci(2, 1) :- !.
fibonaci(N, X) :-
	N1 is N - 1,
	N2 is N - 2,
	fibonaci(N1, A), fibonaci(N2, B), X is A + B.

append1([ ], X, X) :- !.
append1([A|B], C, [A|D]) :- append1(B, C, D).

big_mac(a).
big_mac(c).
big_kahuna_burger(b).
whopper(d).
enjoys(pete,X) :- big_kahuna_burger(X),fail.
enjoys(pete,X) :- burger(X).
burger(X) :- big_mac(X).
burger(X) :- big_kahuna_burger(X).
burger(X) :- whopper(X).

faktorial(0, 1) :- !.
faktorial(X, Y) :- X1 is (X - 1), faktorial(X1, Y1), Y is Y1 * X.

predikat1(L):- predikat2(L,L).
predikat2([],[]).
predikat2([H|T],R):- predikat2(T,T1),append(T1,[H],R), write(R), nl.

command_loop:-
write('Welcome to Nani Search'), nl,
repeat,
write('>nani> '),
read(X),
do(X), nl,
end_condition(X).
end_condition(end).
end_condition(X) :- have(X),!,

write('Congratulations').

do(X):- have(X),!.
do(end).
do(_):- write('Invalid Command').
have(X):- X==nani,!.

writetest :-
	open('test.txt', write, Stream), 
	write(Stream, 'Halo'),
	close(Stream).

readtest :-
	open('test.txt', read, Stream),
	read(Stream, H1),
	close(Stream),
	write(H1), nl.

opentest:-
	open('test.txt',read,S),
	readTexts(S,Texts),
	close(S),
	write(Texts), nl.

readTexts(S,[]):-
	at_end_of_stream(S), !.

readTexts(S,[X|L]):-
	\+ at_end_of_stream(S), !,
	read(S,X),
	readTexts(S, L).

isMember(X, []) :- !, fail.
isMember(X, [X|T]) :- X =:= H, !.
isMember(X, [H|T]) :- isMember(X, T).

intersectList([], X, []) :- !.
intersectList([H|T], LIST, RES) :- 
	isMember(H, LIST), intersectList(T, LIST, RES1), RES = [H|RES1], !.
intersectList([H|T], LIST, RES) :- 
	\+ isMember(H, LIST), intersectList(T, LIST, RES1), RES = RES1.

classify(0, zero).
classify(N, negative) :- N < 0.
classify(N, positive).

go :- write(start), nl,
	repeat, write('enter positive '), read(N),
	classify(N, Type), Type == positive,
	write('positive value is '), write(N), nl.