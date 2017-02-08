%['C:/Users/asish/Desktop/LogicProgramming-Prolog/lp.pl'].

%question 1 - sum the integers in simple list containing only numbers or characters

%sum for empty list is 0
sum-up-numbers-simple([],0).

%sum for general case
sum-up-numbers-simple(L,N):-
	[X|Y] = L,						%split list into first element and remaining list
	number(X),						%this case is evaluated if first element is integer
	sum-up-numbers-simple(Y,N1),    %pass rest of list except first into recursive sum
	N is X + N1.					%the sum is first element and sum so far

%case for non numbers
sum-up-numbers-simple(L, N):-		
	[X|Y] = L,
	\+(number(X)),					%proposition true if X can't be proved as number'
	sum-up-numbers-simple(Y,N1),
	N is 0 + N1.


%question 2
%possible cases : integer, string, list, 

%handle if 0
sum-up-numbers-general([],0).


%handle if the first element of the list is integer
sum-up-numbers-general(L,N):-
	[X|Y] = L,
	number(X),
	\+(is_list(X)),
	sum-up-numbers-general(Y,N1),
	N is X + N1.

%handle if the first element in the list is a character and non integer

sum-up-numbers-general(L,N):-  %not working
	[X|Y] = L,
	\+(number(X)),	
	\+(is_list(X)),	
	sum-up-numbers-general(Y, N1),
	N is 0 + N1.

%handle if the first element in list is a list
sum-up-numbers-general(L,N) :-
	[X|Y] = L,
	is_list(X),
	sum-up-numbers-general(X, N2),
	sum-up-numbers-general(Y,N1),
	N is N2 + N1.


%solution to question 4

