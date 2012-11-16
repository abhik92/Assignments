initialize(Game,Board,Player):- initial_position(Board),
                                Player=w,
                                    /*isReach([9,5,6],[9,6,7],[r,w],Position)*//*move([[1,1,10]|[2,1,9]],Position,Player)*/
                                legal(Board,[[5,2,7],[5,3,8]],Player).
                                    %getPiece([5,2,7],Player,Board).


/* a =1,b=2,c=3 ....i=9*/
/*[letter,left,right]*/
initial_position(Position):- Position = [[1,1,10],[r,w],[2,1,9],[h,w],[3,1,8],[b,w],[4,1,7],[q,w],[5,1,6],[k,w],[6,2,6],[b,w],[7,3,6],[h,w],[8,4,6],[b,w],[9,5,6],[r,w],
                                         [1,2,1],[p,w],[2,2,10],[p,w],[3,2,9],[p,w],[4,2,8],[p,w],[5,2,7],[p,w],[6,3,7],[p,w],[7,4,7],[p,w],[8,5,7],[p,w],[9,6,7],[p,w],
                                         [1,3,2],[n,n],[2,3,1],[n,n],[3,3,10],[n,n],[4,3,9],[n,n],[5,3,8],[n,n],[6,4,8],[n,n],[7,5,8],[n,n],[8,6,8],[n,n],[9,7,8],[n,n],
                                         [1,4,3],[n,n],[2,4,2],[n,n],[3,4,1],[n,n],[4,4,10],[n,n],[5,4,9],[n,n],[6,5,9],[n,n],[7,6,9],[n,n],[8,6,9],[n,n],[8,6,9],[n,n],
                                         [1,5,4],[p,b],[2,5,3],[n,n],[3,5,2],[n,n],[4,5,1],[n,n],[5,5,10],[n,n],[6,6,10],[n,n],[7,7,10],[n,n],[8,8,10],[n,n],[9,9,10],[p,b],
                                         [1,6,5],[r,b],[2,6,4],[p,b],[3,6,3],[n,n],[4,6,2],[n,n],[5,6,1],[n,n],[6,7,1],[n,n],[7,8,1],[n,n],[8,9,1],[p,b],[9,10,1],[r,b],
                                         [2,7,5],[b,b],[3,7,4],[p,b],[4,7,3],[n,n],[5,7,2],[n,n],[6,8,2],[n,n],[7,9,2],[p,b],[8,10,2],[r,b],
                                         [3,8,5],[h,b],[4,8,4],[p,b],[5,8,3],[n,n],[6,9,3],[p,b],[7,10,3],[b,b],
                                         [4,9,5],[b,b],[5,9,4],[p,b],[6,10,4],[q,b],
                                         [5,10,5],[k,b]].


/* Gets the next player given the other player */
next_player(w,Player1):- Player1 = b.
next_player(b,Player1):- Player1 = w.

not_Color(b,C1):-C1 = w.
not_Color(w,C1):-C1 = b.

notSameColor(C1,C2):-C1=C2,!,fail.
notSameColor(C1,C2).


/* the move function*/
/*takes the Move as input and moves the piece from position to position1*/

move(Move,Position,Position1):- Move = [CurrentPosition,NewPosition],getPiece(CurrentPosition,CurrentPiece,Position),newPosition(NewPosition,CurrentPiece,Position,Positionint),emptyOldPosition(CurrentPosition,CurrentPiece,Positionint,Position1).


getPiece(GivenPosition,Piece,Board):-Board = [GivenPosition|Rest],Rest=[Piece|_].
getPiece(GivenPosition,Piece,[Y|Rest]):-getPiece(GivenPosition,Piece,Rest).


newPosition(NewPosition,Piece,Position,Positionint):- Position=[NewPosition|Rest],Rest=[CurRest|Y],NewRest=[Piece|Y],Positionint=[NewPosition|NewRest].
newPosition(NewPosition,Piece,[Z|Rest],[Z|Positionint]):- newPosition(NewPosition,Piece,Rest,Positionint). 

emptyOldPosition(CurrentPosition,Piece,Position,Positionint):-Position=[CurrentPosition|Rest],Rest = [CurrentPiece|Y],NewRest=[[n,n]|Y], Positionint=[CurrentPosition|NewRest].
emptyOldPosition(CurrentPosition,Piece,[Z|Rest],[Z|Positionint]):- emptyOldPosition(CurrentPosition,Piece,Rest,Positionint).

/* Predicate to check if the cell exists on the board */
checkCellExists(Cell,Board):- Board = [Cell|Rest].
checkCellExists(Cell,[Y|Rest]):-checkCellExists(Cell,Rest).

/*Checks if a particular cell is currently free*/
isFree(Position,Board):-getPiece(Position,Piece,Board),Piece=[n,n].

/*Returns Y as the absolute value of X*/
abs(X,Y):-X>0,!,Y=X.
abs(X,Y):-Z is -1 * X,Y=Z.

mOD(X,Y):-abs(X,Z),Z > 4,Y is X mod 10.
mOD(X,Y):-Y=X.

/*Does x= (y+r)mod 10*/
modIndex(X,R,Y):-T1 is X+R,T1>10,!,Y is T1 mod 10.
modIndex(X,R,Y):-Y is X+R.

/*Returns the distance from the nearest 10*/
mod5(X,Y):-T is X mod 10,T>5,Y is 10-T .
mod5(X,Y):-T is X mod 10,Y is T.


kingReach(D1,D2,D3):-abs(D1,R1),abs(D2,R2),abs(D3,R3),R1=:=1,R2=:=1,R3=:=2.
kingReach(D1,D2,D3):-abs(D1,R1),abs(D2,R2),abs(D3,R3),R1=:=1,R2=:=2,R3=:=1.
kingReach(D1,D2,D3):-abs(D1,R1),abs(D2,R2),abs(D3,R3),R1=:=2,R2=:=1,R3=:=1.
kingReach(D1,D2,D3):-abs(D1,R1),abs(D2,R2),abs(D3,R3),R1=:=1,R2=:=1,R3=:=0.
kingReach(D1,D2,D3):-abs(D1,R1),abs(D2,R2),abs(D3,R3),R1=:=1,R2=:=0,R3=:=1.
kingReach(D1,D2,D3):-abs(D1,R1),abs(D2,R2),abs(D3,R3),R1=:=0,R2=:=1,R3=:=1.
   

horseReach(D1,D2,D3):- abs(D1,A1),abs(D2,A2),abs(D3,A3),A1=\=0,A2=\=0,A3=\=0,A1=\=A2,A2=\=A3,T1 is A1 + A2,Sum is T1 + A3 , Sum =:= 6.

/*Checks if position to position1 along a diagonal is free to be reached on the current board*/
diagonalReach(Position,Position1,Board):-topRight(Position,Position1,Board).
diagonalReach(Position,Position1,Board):-topLeft(Position,Position1,Board).
diagonalReach(Position,Position1,Board):-right(Position,Position1,Board).
diagonalReach(Position,Position1,Board):-left(Position,Position1,Board).
diagonalReach(Position,Position1,Board):-bottomRight(Position,Position1,Board).
diagonalReach(Position,Position1,Board):-bottomLeft(Position,Position1,Board).

/*Checks for the top right diagonal*/
topRight(Position,Position1,Board):-Position=Position1.
topRight(Position,Position1,Board):-Position=[X,Y,Z],X1 is X+1,Y1 is Y+2,modIndex(Z,1,Z1),checkCellExists([X1,Y1,Z1],Board),isFree([X1,Y1,Z1],Board),
                                    topRight([X1,Y1,Z1],Position1,Board).

/*Checks for the top left diagonal*/
topLeft(Position,Position1,Board):-Position=Position1.
topLeft(Position,Position1,Board):-Position=[X,Y,Z],X1 is X-1,Y1 is Y+1,modIndex(Z,2,Z1),checkCellExists([X1,Y1,Z1],Board),isFree([X1,Y1,Z1],Board),
                                    topLeft([X1,Y1,Z1],Position1,Board).

/*Checks for the left diagonal*/
left(Position,Position1,Board):-Position=Position1.
left(Position,Position1,Board):-Position=[X,Y,Z],X1 is X-2,Y1 is Y-1,modIndex(Z,1,Z1),checkCellExists([X1,Y1,Z1],Board),isFree([X1,Y1,Z1],Board),
                                    left([X1,Y1,Z1],Position1,Board).

/*Checks for the right diagonal*/
right(Position,Position1,Board):-Position=Position1.
right(Position,Position1,Board):-Position=[X,Y,Z],X1 is X+2,Y1 is Y+1,modIndex(Z,-1,Z1),checkCellExists([X1,Y1,Z1],Board),isFree([X1,Y1,Z1],Board),
                                    right([X1,Y1,Z1],Position1,Board).

/*Checks for the bottomleft diagonal*/
bottomLeft(Position,Position1,Board):-Position=Position1.
bottomLeft(Position,Position1,Board):-Position=[X,Y,Z],X1 is X-1,Y1 is Y-2,modIndex(Z,-1,Z1),checkCellExists([X1,Y1,Z1],Board),isFree([X1,Y1,Z1],Board),
                                    bottomLeft([X1,Y1,Z1],Position1,Board).

/*Checks for the bottomright diagonal*/
bottomRight(Position,Position1,Board):-Position=Position1.
bottomRight(Position,Position1,Board):-Position=[X,Y,Z],X1 is X+1,Y1 is Y-1,modIndex(Z,-2,Z1),checkCellExists([X1,Y1,Z1],Board),isFree([X1,Y1,Z1],Board),
                                    bottomLeft([X1,Y1,Z1],Position1,Board).


/*Checks if position to position1 along a straight is free to be reached on the current board*/
straightReach(Position,Position1,Board):-top(Position,Position1,Board).
straightReach(Position,Position1,Board):-down(Position,Position1,Board).
straightReach(Position,Position1,Board):-firstIndexTop(Position,Position1,Board).
straightReach(Position,Position1,Board):-firstIndexDown(Position,Position1,Board).
straightReach(Position,Position1,Board):-secondIndexTop(Position,Position1,Board).
straightReach(Position,Position1,Board):-secondIndexDown(Position,Position1,Board).

/*Checks for the top straight*/
top(Position,Position1,Board):-Position=Position1.
top(Position,Position1,Board):-Position=[X,Y,Z],X1 is X,Y1 is Y+1,modIndex(Z,1,Z1),checkCellExists([X1,Y1,Z1],Board),isFree([X1,Y1,Z1],Board),
                                    top([X1,Y1,Z1],Position1,Board).

/*Checks for the bottom straight*/
down(Position,Position1,Board):-Position=Position1.
down(Position,Position1,Board):-Position=[X,Y,Z],X1 is X,Y1 is Y-1,modIndex(Z,-1,Z1),checkCellExists([X1,Y1,Z1],Board),isFree([X1,Y1,Z1],Board),
                                    down([X1,Y1,Z1],Position1,Board).

/*Checks for the first index top striaght*/
firstIndexTop(Position,Position1,Board):-Position=Position1.
firstIndexTop(Position,Position1,Board):-Position=[X,Y,Z],X1 is X-1,Y1 is Y,modIndex(Z,1,Z1),checkCellExists([X1,Y1,Z1],Board),isFree([X1,Y1,Z1],Board),
                                    firstIndexTop([X1,Y1,Z1],Position1,Board).

/*Checks for the first index bottom straight*/
firstIndexDown(Position,Position1,Board):-Position=Position1.
firstIndexDown(Position,Position1,Board):-Position=[X,Y,Z],X1 is X+1,Y1 is Y,modIndex(Z,-1,Z1),checkCellExists([X1,Y1,Z1],Board),isFree([X1,Y1,Z1],Board),
                                    firstIndexDown([X1,Y1,Z1],Position1,Board).

/*Checks for the second index top straight*/
secondIndexTop(Position,Position1,Board):-Position=Position1.
secondIndexTop(Position,Position1,Board):-Position=[X,Y,Z],X1 is X+1,Y1 is Y+1,Z1 is Z,checkCellExists([X1,Y1,Z1],Board),isFree([X1,Y1,Z1],Board),
                                    secondIndexTop([X1,Y1,Z1],Position1,Board).

/*Checks for the second index down straight*/
secondIndexDown(Position,Position1,Board):-Position=Position1.
secondIndexDown(Position,Position1,Board):-Position=[X,Y,Z],X1 is X-1,Y1 is Y-1,Z1 is Z,checkCellExists([X1,Y1,Z1],Board),isFree([X1,Y1,Z1],Board),
                                    secondIndexDown([X1,Y1,Z1],Position1,Board).


/* Check the Pawn move. The trickiest part. Have to check for base case moves*/

/* Entirely from white s perspective */
pawnReach(Position,Position1,Board,w):-Position=[X,Y,Z],Position1=[X1,Y1,Z1],X1=:=X,Y=:=Y1-1,modIndex(Z1,-1,R),R=:=Z,getPiece(Position1,Piece,Board),
                                       Piece=[_,Color],Color=n.
pawnReach(Position,Position1,Board,w):-Position=[X,Y,Z],Position1=[X1,Y1,Z1],X1=:=X-1,Y1=:=Y,modIndex(Z1,-1,R),R=:=Z,
                                       getPiece(Position1,Piece,Board),
                                       Piece=[_,Color],Color=n.
pawnReach(Position,Position1,Board,w):-Position=[X,Y,Z],Position1=[X1,Y1,Z1],X1-1=:=X,Y1-1=:=Y,Z1=:=Z,
                                       getPiece(Position1,Piece,Board),
                                       Piece=[_,Color],Color=n.
pawnReach(Position,Position1,Board,w):-Position=[X,Y,Z],Position1=[X1,Y1,Z1],X1=:=X-1,Y1-1=:=Y,modIndex(Z1,-2,R),R=:=Z,getPiece(Position1,Piece,Board),
                                       Piece=[_,Color],Color=b.
pawnReach(Position,Position1,Board,w):-Position=[X,Y,Z],Position1=[X1,Y1,Z1],X1-1=:=X,Y1-2=:=Y,modIndex(Z1,-1,R),R=:=Z,
                                       getPiece(Position1,Piece,Board),
                                       Piece=[_,Color],Color=b.

/* Hard code the base cases for white */
pawnReach([2,2,10],[2,4,2],Board,w):-isFree([2,3,1],Board),isFree([2,4,2],Board).
pawnReach([3,2,9],[3,4,1],Board,w):-isFree([3,3,10],Board),isFree([3,4,1],Board).
pawnReach([8,5,7],[8,7,9],Board,w):-isFree([8,6,8],Board),isFree([8,7,9],Board).
pawnReach([7,4,7],[7,6,9],Board,w):-isFree([7,5,8],Board),isFree([7,6,9],Board).
pawnReach([4,2,8],[4,4,10],Board,w):-isFree([4,3,9],Board),isFree([4,4,10],Board).
pawnReach([4,2,8],[4,5,1],Board,w):-isFree([4,3,9],Board),isFree([4,4,10],Board),isFree([4,5,1],Board).
pawnReach([6,3,7],[6,5,9],Board,w):-isFree([6,4,8],Board),isFree([6,5,9],Board).
pawnReach([6,3,7],[6,6,10],Board,w):-isFree([6,4,8],Board),isFree([6,5,9],Board),isFree([6,6,10],Board).
pawnReach([5,2,7],[5,4,9],Board,w):-isFree([5,3,8],Board),isFree([5,4,9],Board).
pawnReach([5,2,7],[5,5,10],Board,w):-isFree([5,3,8],Board),isFree([5,4,9],Board),isFree([5,5,10],Board).

/* Entirely from Black s perspective */
/*The directions of movements are reversed for the black pawn*/
pawnReach(Position,Position1,Board,b):-Position=[X,Y,Z],Position1=[X1,Y1,Z1],X1=:=X,Y=:=Y1+1,modIndex(Z1,1,R),R=:=Z,getPiece(Position1,Piece,Board),
                                       Piece=[_,Color],Color=n.
pawnReach(Position,Position1,Board,b):-Position=[X1,Y1,Z1],Position1=[X,Y,Z],X1=:=X-1,Y1=:=Y,modIndex(Z1,-1,R),R=:=Z,
                                       getPiece(Position1,Piece,Board),
                                       Piece=[_,Color],Color=n.
pawnReach(Position,Position1,Board,b):-Position=[X1,Y1,Z1],Position1=[X,Y,Z],X1-1=:=X,Y1-1=:=Y,Z1=:=Z,
                                       getPiece(Position1,Piece,Board),
                                       Piece=[_,Color],Color=n.
pawnReach(Position,Position1,Board,b):-Position=[X1,Y1,Z1],Position1=[X,Y,Z],X1=:=X-1,Y1-1=:=Y,modIndex(Z1,-2,R),R=:=Z,getPiece(Position1,Piece,Board),
                                       Piece=[_,Color],Color=w.
pawnReach(Position,Position1,Board,b):-Position=[X1,Y1,Z1],Position1=[X,Y,Z],X1-1=:=X,Y1-2=:=Y,modIndex(Z1,-1,R),R=:=Z,
                                       getPiece(Position1,Piece,Board),
                                       Piece=[_,Color],Color=w.

/* Hard code the base cases for Black */
pawnReach([2,6,4],[2,4,2],Board,b):-isFree([2,5,3],Board),isFree([2,4,2],Board).
pawnReach([3,7,4],[3,5,2],Board,b):-isFree([3,6,3],Board),isFree([3,5,2],Board).
pawnReach([8,9,1],[8,7,9],Board,b):-isFree([8,8,10],Board),isFree([8,7,9],Board).
pawnReach([7,9,2],[7,7,10],Board,b):-isFree([7,8,1],Board),isFree([7,7,10],Board).
pawnReach([4,8,4],[4,6,2],Board,b):-isFree([4,7,3],Board),isFree([4,6,2],Board).
pawnReach([4,8,4],[4,5,1],Board,b):-isFree([4,7,3],Board),isFree([4,6,2],Board),isFree([4,5,1],Board).
pawnReach([6,9,3],[6,7,1],Board,b):-isFree([6,8,2],Board),isFree([6,7,1],Board).
pawnReach([6,9,3],[6,6,10],Board,b):-isFree([6,8,2],Board),isFree([6,7,1],Board),isFree([6,6,10],Board).
pawnReach([5,9,4],[5,7,2],Board,b):-isFree([5,8,3],Board),isFree([5,7,2],Board).
pawnReach([5,9,4],[5,6,1],Board,b):-isFree([5,8,3],Board),isFree([5,7,2],Board),isFree([5,6,1],Board).






/* Negation for reach */
notIsReach(Position,Position1,Piece,Board):-isReach(Position,Position1,Piece,Board),!,fail.
notIsReach(Position,Position1,Piece,Board).



/*Predicate for the King*/
isReach(Position,Position1,Piece,Board):- Piece=[k,Color],
                                                getPiece(Position1,P,Board),
                                                P=[_,C],
                                                notSameColor(Color , C),
                                                Position=[X,Y,Z],
                                                Position1=[X1,Y1,Z1],
                                                D1 is X - X1,
                                                D2 is Y-Y1,
                                                R3 is Z-Z1,
                                                mOD(R3,D3),
                                                kingReach(D1,D2,D3).

/*Predicate for reachability of horse */
isReach(Position,Position1,Piece,Board):- Piece=[h,Color],
                                                getPiece(Position1,P,Board),
                                                P=[_,C],
                                                notSameColor(Color ,C),
                                                Position=[X,Y,Z],
                                                Position1=[X1,Y1,Z1],
                                                D1 is X - X1,
                                                D2 is Y-Y1,
                                                R3 is Z-Z1,
                                                mOD(R3,D3),
                                                horseReach(D1,D2,D3).
                                                                        
 /*Predicate for reachability of bishop */
isReach(Position,Position1,Piece,Board):- Piece=[b,Color],
                                                getPiece(Position1,P,Board),
                                                P=[_,C],
                                                notSameColor(Color , C),
                                                Position=[X,Y,Z],
                                                Position1=[X1,Y1,Z1],
                                                diagonalReach(Position,Position1,Board).
                                                                                                     
  /*Predicate for reachability of rook */
isReach(Position,Position1,Piece,Board):- Piece=[r,Color],
                                                getPiece(Position1,P,Board),
                                                P=[_,C],
                                                notSameColor(Color , C),
                                                Position=[X,Y,Z],
                                                Position1=[X1,Y1,Z1],
                                                straightReach(Position,Position1,Board).
                                   
/*Predicate for reachability of queen : just combine rook and bishop :P */
isReach(Position,Position1,Piece,Board):- Piece=[q,Color],
                                                getPiece(Position1,P,Board),
                                                P=[_,C],
                                                notSameColor(Color , C),
                                                Position=[X,Y,Z],
                                                Position1=[X1,Y1,Z1],
                                                straightReach(Position,Position1,Board).
                                   
isReach(Position,Position1,Piece,Board):- Piece=[q,Color],
                                                getPiece(Position1,P,Board),
                                                P=[_,C],
                                                notSameColor(Color , C),
                                                Position=[X,Y,Z],
                                                Position1=[X1,Y1,Z1],
                                                diagonalReach(Position,Position1,Board).

/* Predicate for reachability of a pawn */
isReach(Position,Position1,Piece,Board):- Piece=[p,Color],
                                                getPiece(Position1,P,Board),
                                                P=[_,C],
                                                notSameColor(Color , C),
                                                Position=[X,Y,Z],
                                                Position1=[X1,Y1,Z1],
                                                pawnReach(Position,Position1,Board,Color).

/*Check for legality of a move*/
legal(Board, Move,Player):- Move=[FirstPosition,LastPosition],
                            getPiece(FirstPosition,Piece,Board),
                            Piece=[FirstPiece,FirstColor],
                            FirstColor=Player,
                            isReach(FirstPosition,LastPosition,[FirstPiece,FirstColor],Board),
                            move(Move,Board,Board1),
                            notKingCheck(Board1,Player).

/*Check for King under check*/
notKingCheck(Board,Player):-kingCheck(Board,Player),!,fail.
notKingCheck(Board,Player).

/*checks if the current player's king is under attack or check */
kingCheck(Board,Player) :-iterateBoard(Board,[k,Player],Position1,Board),attack(Board,Player,Position1,Board).                       
                              
/* Go through full board*/
iterateBoard(Board,Piece,Position,List):-List=[Front|Rest],Front=[A,B,C],getPiece(Front,ThisPiece,Board),ThisPiece=Piece,Position=Front.
iterateBoard(Board,Piece,Position,[Y|Rest]):-iterateBoard(Board,Piece,Position,Rest).

/* Check if any opponent piece can attack*/
attack(Board,Player,KingPosition,List):-next_player(Player,Player1),List=[Front|Rest],Front=[A,B,C],getPiece(Front,ThisPiece,Board),ThisPiece=[Player1,_],isReach(Front,KingPosition,ThisPiece,Board).
attack(Board,Player,KingPosition,[X|Rest]):-attack(Board,Player,KingPosition,Rest).

