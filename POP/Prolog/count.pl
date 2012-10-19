count([],0).
count([H|X],Z):- count(X,Y), Z is Y+1.
