reverse([X|Xs],Ys):-reverse(Xs,Y1),append(Y1,[X],Ys).
reverse([],[]).

append(X,Y,Z):-Z=[H|T],append(T,Y,Z1),Z=[H|Z1].
append([],Y,Y).
