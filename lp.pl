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
	\+(number(X)),				%if can't be proven number'
 	is_list(X),					%if is list
	sum-up-numbers-general(X, N2),
	sum-up-numbers-general(Y,N1),
	N is N2 + N1.


%solution to question 4

%handle cases where either or both lists are empty
common-unique-elements([],[],[]).
common-unique-elements([],L2,[]).
common-unique-elements(L1,[],[]).	

%l1[0] is integer
common-unique-elements(L1,L2,N):-
	[X|Y] = L1,
	[X1|Y1] = L2,
	number(X),					% first element is an integer
						
%%	
%X is in the first 
common-unique-elements(L1,L2,N):-
		[X|Y] = L1,
		[X1|Y1] = L2,			%break L2 into head and tail
		\+(is_list([X])),		%proceed only if element is not list
		member(X,[X2|_]) ;		% if first element of L1 is same as first of L2 
		member(X,[]);





