
%if list exhausted return 0
%['C:/Users/asish/Desktop/LogicProgramming-Prolog/lp.pl'].

sum-up-numbers-simple([],0).

sum-up-numbers-simple(L,N):-
	[X|Y] = L,
	sum-up-numbers-simple(Y,N1),  
	N is (X + N1).
	