%['C:/Users/asish/Desktop/LogicProgramming-Prolog/lp.pl'].
%#####################################################################################
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



%##################################################################################

%question 2
%possible cases : integer, string, list, 

%handle if 0
sum-up-numbers-general([],0). 	    %fact


%handle if the first element of the list is integer
sum-up-numbers-general(L,N):-   
	[X|Y] = L,
	number(X),
	\+(is_list(X)),
	sum-up-numbers-general(Y,N1),
	N is X + N1.

%handle if the first element in the list is a character and non integer

sum-up-numbers-general(L,N):-  
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




%#################################################################################
%solution to question 3
min-above-min(L1,L2,N):-	
	simple-number-list(L1, SimpleL1),				%create simple list of L1
	simple-number-list(L2, SimpleL2),				%create simple list of L2
	min-num-list(SimpleL2, MinL2),					%find minimum in numbers list of L2 
	min-list-creator(SimpleL1, MinL2, MinList),		%create a list of numbers greater than min(L2)
	min-num-list(MinList, SecondMinimum),
	N is SecondMinimum.


%##Helper functions
%return empty if list is empty
min-list-creator([],_,[]).

%handle for X> N and add X to [Compared]
min-list-creator(L, N, Compared):-
	[X|Y] = L,
    X>N,					%if integer greater than N
	min-list-creator(Y, N, Compared1),
	append([X], Compared1, Compared).

%append to empty
min-list-creator(L, N, Compared):-
    [X|Y] = L,
    X=<N,
    min-list-creator(Y,N,Compared1),
	append([],Compared1,Compared).
    





%make number lists of any simple list
simple-number-list([],[]).	%when empty,return empty
simple-number-list(L, N):-
	[X|Y] = L,
	number(X),				%if the head is integer
	simple-number-list(Y, N1),
    append([X], N1, N).

simple-number-list(L, N):-
	[X|Y] = L,
	\+number(X),				%if the head is non integer
	simple-number-list(Y, N1),
    append([], N1, N).

%send current min if empty list state reached
min-num-list([], Min, Min).

%break list
min-num-list([X|Y], Min):-
	min-num-list(Y, X, Min).

%once broken, evaluate this predicate to find the minimum from the list
min-num-list([X|Y], Min0, Min):-
	Min1 is min(X, Min0),
	min-num-list(Y, Min1, Min).


%#########################################################################
%################################################################################
%solution to question 4

%handle cases where either or both lists are empty
%solution involves : breaking up list into simple lists, then comparin if each element in simple-list of L1 is a member of L2. Append matches into a list

common-unique-elements(L1,L2,N):-
	flatten(L1, Flat1),										%remove all nests from L1 and create simple list
	flatten(L2, Flat2),										%remove all nests from L2 and create simple list
	common-elements(Flat1, Flat2, common-list),				%takes two simple lists and returns list with common elements


    



simple-list([],[]).				%return empty list if empty received
simple-list(L, Simplified):-
	[X|Y] = L,
	\+((is_list(X))),
	simple-list(Y,Super-Simplified),
	append([X],Super-Simplified, Simplified).

simple-list(L,Simplified):-
	[X|Y] = L,
	(is_list(X)),
	simple-list(X,Super-Simplified1),
	simple-list(Y,Super-Simplified2),
	append(Super-Simplified1, Super-Simplified2, Simplified).

%if any of the lists are empty, send empty list
common-elements([],_,[]).
common-elements(_,[],][]).

common-elements(Flat1, Flat2, common-list):-
	[X|Y] = Flat1,
	member(X,L2),
	append([X], common-list,