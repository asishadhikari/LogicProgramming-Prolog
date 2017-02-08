
%['C:/Users/asish/Desktop/LogicProgramming-Prolog/lp.pl'].

%question 1 
%if list exhausted return 0
sum-up-numbers-simple([],0).

%sum for general case
sum-up-numbers-simple(L,N):-
	[X|Y] = L,
	sum-up-numbers-simple(Y,N1),
	N is X + N1.

sum-up-numbers-simple(

%question 2

sum-up-numbers-general(L, N)


