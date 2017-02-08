
%if list exhausted return 0
sum-up-numbers-simple([],0).


sum-up-numbers-simple(L,N):-
	[X|Y] = L,
	[X1|y1] = Y,
	sum-up-numbers-simple (X1  
	N is X + Y1.
	
