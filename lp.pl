factorial(0,1).
factorial(N,F) :-
	N>0,
	N1 is N-1,
	factorial(N1,F1),
	F is N * F1.

%if list exhausted return 0
%['C:/Users/asish/Desktop/LogicProgramming-Prolog/lp.pl'].

sum-up-numbers-simple([],0).

sum-up-numbers-simple(L,N):-
	[X|Y] = L,
	sum-up-numbers-simple(Y,N1),  
	N is (X + N1).
	