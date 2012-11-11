append([],Y,Y).
append(X,Y,Z):- X = [H|T] , append(T,Y,Z1) , Z = [H|Z1].
