/*  Muhammad Bangkit Dwi Cahyono
    13521055 */

/* Bagian <1> */

/* Deklarasi Fakta */
/* <1.1> */
pria(gede).
pria(gojo).
pria(von_neumann).
pria(van_rossum).
pria(bambang).
pria(vito).
pria(ave).
pria(wesly).
pria(elon_musk).
pria(patrick).

wanita(indah).
wanita(lovelace).
wanita(khelli).
wanita(power).
wanita(aqua).
wanita(wulandari).
wanita(anya).

usia(gede, 96).
usia(indah, 92).
usia(gojo, 90).
usia(lovelace, 79).
usia(khelli, 89).
usia(von_neumann, 92).
usia(van_rossum, 65).
usia(bambang, 60).
usia(vito, 56).
usia(power, 50).
usia(ave, 54).
usia(aqua, 50).
usia(wulandari, 24).
usia(wesly, 26).
usia(elon_musk, 28).
usia(patrick, 24).
usia(anya, 4).

menikah(gede, indah).
menikah(indah, gede).
menikah(gojo, lovelace).
menikah(lovelace, gojo).
menikah(von_neumann, khelli).
menikah(khelli, von_neumann).
menikah(vito, power).
menikah(power, vito).
menikah(ave, aqua).
menikah(aqua, ave).
menikah(wesly, wulandari).
menikah(wulandari, wesly).

anak(van_rossum, gede).
anak(van_rossum, indah).
anak(bambang, gede).
anak(bambang, indah).
anak(vito, gede).
anak(vito, indah).
anak(power, lovelace).
anak(power, gojo).
anak(ave, lovelace).
anak(ave, gojo).
anak(aqua, khelli).
anak(aqua, von_neumann).
anak(wesly, vito).
anak(wesly, power).
anak(elon_musk, ave).
anak(elon_musk, aqua).
anak(patrick, ave).
anak(patrick, aqua).
anak(anya, wesly).
anak(anya, wulandari).

saudara(van_rossum, bambang).
saudara(van_rossum, vito).
saudara(bambang, van_rossum).
saudara(bambang, vito).
saudara(vito, van_rossum).
saudara(vito, bambang).
saudara(power, ave).
saudara(ave, power).
saudara(elon_musk, patrick).
saudara(patrick, elon_musk).

/* Deklarasi Rules */
/* <1.2> */

kakak(X, Y) :-
    saudara(X, Y),
    usia(X, A),
    usia(Y, B),
    A > B.

keponakan(X, Y) :-
    anak(X, A),
    saudara(A, Y).

suami(X, Y) :-
    menikah(X, Y),
    pria(X).

sepupu(X, Y) :-
    anak(X, A),
    anak(Y, B),
    saudara(A, B).

menantu(X, Y) :-
    anak(A, Y),
    menikah(A, X).

orangtua(X, Y) :-
    anak(Y, X).

bibi(X, Y) :-
    orangtua(A, Y),
    saudara(X, A),
    wanita(X).

cucu(X, Y) :-
    anak(X, A),
    anak(A, Y).

keturunan(X, Y) :-
    anak(X, Y);
    anak(X, A), keturunan(A, Y).

anaksulung(X) :-
    \+ (kakak(_, X)).

anakbungsu(X) :-
    \+ (kakak(X, _)).

/* Bagian <2> */

/* Deklarasi Rules */
/* <2.1> */

/*  combination(x, y) = combination(x - 1, y) + combination(x - 1, y - 1) */
combination(N, N, 1) :- !.
combination(N, 0, 1) :- !.
combination(N, C, X) :- 
    (N > C), N1 is N - 1, C1 is C -1, 
    combination(N1, C, A), 
    combination(N1, C1, B), 
    X is (A + B).

/* Deklarasi Rules */
/* <2.2> */
/* Saya set agar hanya memiliki 1 solusi */

change(0, 0) :- !.
change(1, 1) :- !.
change(X, Y) :- 
    ((Y >= 5), Y1 is Y - 5, change(X1, Y1), X is (1 + X1), !);
    ((Y >= 2), Y1 is Y - 2, change(X1, Y1), X is (1 + X1)).

/* Deklarasi Rules */
/* <2.3> */

/* fpb(A, B) = fpb(B, A % B) */
fpb(X, 0, X) :- !.
fpb(0, X, X) :- !.
fpb(A, B, X) :- A1 is A mod B, fpb(B, A1, X).

/* Deklarasi Rules */
/* <2.4> */

mod(A, B, X) :- (A < B), X is A, !.
mod(A, B, X) :- 
    (B > 0),
    A1 is A - B, mod(A1, B, X1), X is X1.

/* Deklarasi Rules */
/* <2.5> */
/* Saya set agar hanya memiliki 1 solusi */

deret(1, 1) :- !.
deret(X, Y) :-
    (X > 0),
    ((mod(X, 2, 0)), X1 is X - 1, deret(X1, Y1), Y is (Y1 + 1), !);
    (X1 is X - 1, deret(X1, Y1), Y is (Y1 * 2)).

/* Bagian <3> */

/* Deklarasi Rules */
/* <A.1> */
/* Saya set agar hanya memiliki 1 solusi (terutama jika ada double) */


min([Min], Min) :- !.
min([H, N|T], Min) :- 
    (H =< N, min([H|T], Min), !);
    (min([N|T], Min)).

/* Deklarasi Rules */
/* <A.2> */
/* Saya set agar hanya memiliki 1 solusi (terutama jika ada double) */

max([Max], Max) :- !.
max([H, N|T], Max) :- 
    (H >= N, max([H|T], Max), !);
    (max([N|T], Max)).

/* Deklarasi Rules */
/* <A.3> */

range(List, Range) :- max(List, Max), min(List, Min), Range is (Max - Min).

/* Deklarasi Rules */
/* <A.4> */

count([], 0) :- !.
count([H|T], Count) :- count(T, Count1), Count is (Count1 + 1).

/* Deklarasi Rules */
/* <A.5> */

sum([], 0) :- !.
sum([H|T], Sum) :- sum(T, Sum1), Sum is (Sum1 + H).

/* Deklarasi Rules */
/* <B.1> */

getIndex([], X, Index) :- !, fail.
getIndex([H|T], X, Index) :-
    (H == X, Index is 1, !);
    (getIndex(T, X, Index1), Index is (Index1 + 1)).

/* Deklarasi Rules */
/* <B.2> */

/* Tambahan */
getElmt([H|_], 1, X) :- X is H, !.
getElmt([_|T], I, X) :- 
    I1 is I - 1, getElmt(T, I1, X).

setElmt([H|T], I, X, Result) :- 
    ((I =:= 1), Result = [X|T], !);
    (I1 is I - 1, setElmt(T, I1, X, Result2), Result = [H|Result2]).

/* Swap */
swap(List, I1, I2, Result) :-
    getElmt(List, I1, X), getElmt(List, I2, Y),
    setElmt(List, I1, Y, Temp), setElmt(Temp, I2, X, Result).


/* Deklarasi Rules */
/* <B.3> */

splitList([], [], []) :- !.
splitList([H|T], Ganjil, Genap) :- 
    ((mod(H, 2, 1), splitList(T, X, Genap), Ganjil = [H|X], !); 
    (mod(H, 2, 0), splitList(T, Ganjil, Y), Genap = [H|Y])).

/* <BONUS> */

/* Deklarasi Fakta */
:- dynamic(stat/1).

/* Deklarasi Rules */

update(New) :- 
    value(Old),
    format('Old Saved Value is ~g\n', [Old]), 
    retractall(value(_)), 
    assertz(value(New)), 
    format('New Saved Value is ~g\n', [New]), !.

startCalculator :-
    (stat(start), print('Kalkulator sudah start!\n'), fail);
    (\+ stat(start), assertz(stat(start)), assertz(value(0)),
    print('Selamat Datang di Kalkulator Prolog!\n'), getValue), !.

getValue :-
    (stat(start), value(X), format('Currently Saved Value is ~g\n', [X]), !);
    (\+ stat(start), fail), !.

add(X) :-
    (stat(start), value(Y), New is (Y + X), update(New), !);
    (\+ stat(start), fail), !.

subtract(X) :-
    (stat(start), value(Y), New is (Y - X), update(New), !);
    (\+ stat(start), fail), !.

multiply(X) :-
    (stat(start), value(Y), New is (Y * X), update(New), !);
    (\+ stat(start), fail), !.

divide(X) :-
    (stat(start), value(Y), New is (Y / X), update(New), !);
    (\+ stat(start), fail), !.

clearCalculator :-
    (stat(start), update(0), !);
    (\+ stat(start), fail), !.

exitCalculator :- 
    (stat(start), retractall(stat(start)), retractall(value(_)), 
    print('Terima Kasih telah Menggunakan Kalkulator Prolog :D\n'), !);
    (\+ stat(start), print('Silahkan `startCalculator` terlebih dahulu!\n'), fail), !.