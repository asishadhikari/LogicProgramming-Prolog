%['C:/Users/asish/Desktop/LogicProgramming-Prolog/lp.pl'].

%question 1 
%sum for empty list is 0
sum-up-numbers-simple([],0).

%sum for general case
sum-up-numbers-simple(L,N):-
	[X|Y] = L,
	number(X),
	sum-up-numbers-simple(Y,N1),
	N is X + N1.

%case for non numbers
sum-up-numbers-simple(L, N):-
	[X|Y] = L,
	\+(number(X)),
	sum-up-numbers-simple(Y,N1),
	N is 0 + N1.

%question 2



