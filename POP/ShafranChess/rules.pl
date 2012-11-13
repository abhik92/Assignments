initialize(Game,Position,Player):- initial_position(Position),isReach([6,2,6],[8,6,8],[b,w],Position).

/* a =1,b=2,c=3 ....i=9*/
/*[letter,left,right]*/
initial_position(Position):- Position = [[1,1,10],[r,w],[2,1,9],[h,w],[3,1,8],[b,w],[4,1,7],[q,w],[5,1,6],[k,w],[6,2,6],[b,w],[7,3,6],[h,w],[8,4,6],[b,w],[9,5,6],[r,w],
                                         [1,2,1],[p,w],[2,2,10],[p,w],[3,2,9],[p,w],[4,2,8],[p,w],[5,2,7],[p,w],[6,3,7],[p,w],[7,4,7],[p,w],[8,5,7],[p,w],[9,6,7],[p,w],
                                         [1,3,2],[nil,nil],[2,3,1],[nil,nil],[3,3,10],[nil,nil],[4,3,9],[nil,nil],[5,3,8],[nil,nil],[6,4,8],[nil,nil],[7,5,8],[nil,nil],[8,6,8],[nil,nil],[9,7,8],[nil,nil],
                                         [1,4,3],[nil,nil],[2,4,2],[nil,nil],[3,4,1],[nil,nil],[4,4,10],[nil,nil],[5,4,9],[nil,nil],[6,5,9],[nil,nil],[7,6,9],[nil,nil],[8,6,9],[nil,nil],[8,6,9],[nil,nil],
                                         [1,5,4],[p,b],[2,5,3],[nil,nil],[3,5,2],[nil,nil],[4,5,1],[nil,nil],[5,5,10],[nil,nil],[6,6,10],[nil,nil],[7,7,10],[nil,nil],[8,8,10],[nil,nil],[9,9,10],[p,b],
                                         [1,6,5],[r,b],[2,6,4],[p,b],[3,6,3],[nil,nil],[4,6,2],[nil,nil],[5,6,1],[nil,nil],[6,7,1],[nil,nil],[7,8,1],[nil,nil],[8,9,1],[p,b],[9,10,1],[r,b],
                                         [2,7,5],[b,b],[3,7,4],[p,b],[4,7,3],[nil,nil],[5,7,2],[nil,nil],[6,8,2],[nil,nil],[7,9,2],[p,b],[8,10,2],[r,b],
                                         [3,8,5],[h,b],[4,8,4],[p,b],[5,8,3],[nil,nil],[6,9,3],[p,b],[7,10,3],[b,b],
                                         [4,9,5],[b,b],[5,9,4],[p,b],[6,10,4],[q,b],
                                         [5,10,5],[k,b]].


/* Gets the next player given the other player */
next_player(w,Player1):- Player1 = b.
next_player(b,Player1):- Player1 = w.

not_Color(b,C1):-C1 = w.
not_Color(w,C1):-C1 = b.

/* the move function*/
/*takes the Move as input and moves the piece from position to position1*/

move(Move,Position,Position1):- Move = [CurrentPosition|NewPosition], getPiece(CurrentPosition,CurrentPiece,Position),newPosition(NewPosition,CurrentPiece,Position,Positionint),emptyOldPosition(CurrentPosition,CurrentPiece,Positionint,Position1).

getPiece(GivenPosition,Piece,Position):-Position = [GivenPosition|Rest],Rest=[Piece|_].
getPiece(GivenPosition,Piece,[Y|Rest]):-getPiece(GivenPosition,Piece,Rest).


newPosition(NewPosition,Piece,Position,Positionint):- Position=[NewPosition|Rest],Rest=[CurRest|Y],NewRest=[Piece|Y],Positionint=[NewPosition|NewRest].
newPosition(NewPosition,Piece,[Z|Rest],[Z|Positionint]):- newPosition(NewPosition,Piece,Rest,Positionint). 

emptyOldPosition(CurrentPosition,Piece,Position,Positionint):-Position=[CurrentPosition|Rest],Rest = [CurrentPiece|Y],NewRest=[[nil,nil]|Y], Positionint=[CurrentPosition|NewRest].
emptyOldPosition(CurrentPosition,Piece,[Z|Rest],[Z|Positionint]):- emptyOldPosition(CurrentPosition,Piece,Rest,Positionint).


/* List of reachable moves for each piece */

/* Predicate to check if the cell exists on the board */
checkCellExists(Cell,Board):- Board = [Cell|Rest].
checkCellExists(Cell,[Y|Rest]):-checkCellExists(Cell,Rest).

/*Checks if a particular cell is currently free*/
isFree(Position,Board):-getPiece(Position,Piece,Board),Piece=[nil,nil].

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

test(Y):-Z is 1-3,Y is Z mod 10.

kingReach(D1,D2,D3):-abs(D1,R1),abs(D2,R2),abs(D3,R3),R1=:=1,R2=:=1,R3=:=2.
kingReach(D1,D2,D3):-abs(D1,R1),abs(D2,R2),abs(D3,R3),R1=:=1,R2=:=2,R3=:=1.
kingReach(D1,D2,D3):-abs(D1,R1),abs(D2,R2),abs(D3,R3),R1=:=2,R2=:=1,R3=:=1.
kingReach(D1,D2,D3):-abs(D1,R1),abs(D2,R2),abs(D3,R3),R1=:=1,R2=:=1,R3=:=0.
kingReach(D1,D2,D3):-abs(D1,R1),abs(D2,R2),abs(D3,R3),R1=:=1,R2=:=0,R3=:=1.
kingReach(D1,D2,D3):-abs(D1,R1),abs(D2,R2),abs(D3,R3),R1=:=0,R2=:=1,R3=:=1.
   

horseReach(D1,D2,D3):- abs(D1,A1),abs(D2,A2),abs(D3,A3),A1=\=0,A2=\=0,A3=\=0,A1=\=A2,A2=\=A3,T1 is A1 + A2,Sum is T1 + A3 , Sum =:= 6.

/*Checks if the triplet of sum mod 10 form a diagonal*/
isDiagonal(S1,S2,S3):-S1=:=S2,S3=:=2*S2.
isDiagonal(S1,S2,S3):-S1=:=S3,S2=:=2*S3.
isDiagonal(S1,S2,S3):-S3=:=S2,S1=:=2*S2.

/*Checks if position to position1 alopng a diagonal is free to be reached on the current board*/
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


/*Predicate for the King*/
isReach(Position,Position1,Piece,Board):- Piece=[k|Color],
                                                Color=[COL|_],
                                                not_Color(COL,ColorBar),
                                                Position=[X,Y,Z],
                                                Position1=[X1,Y1,Z1],
                                                D1 is X - X1,
                                                D2 is Y-Y1,
                                                R3 is Z-Z1,
                                                mOD(R3,D3),
                                                kingReach(D1,D2,D3).

/*Predicate for reachability of horse */
isReach(Position,Position1,Piece,Board):- Piece=[h|Color],
                                                Color=[COL|_],
                                                not_Color(COL,ColorBar),
                                                Position=[X,Y,Z],
                                                Position1=[X1,Y1,Z1],
                                                D1 is X - X1,
                                                D2 is Y-Y1,
                                                R3 is Z-Z1,
                                                mOD(R3,D3),
                                                horseReach(D1,D2,D3).
                                                                        
 /*Predicate for reachability of bishop */
isReach(Position,Position1,Piece,Board):- Piece=[b|Color],
                                                Color=[COL|_],
                                                not_Color(COL,ColorBar),
                                                Position=[X,Y,Z],
                                                Position1=[X1,Y1,Z1],
                                                diagonalReach(Position,Position1,Board).
                                                                                                     
                                    
                                    
                                    
