initialize(Game,Position,Player):- initial_position(Position),isReach([5,6,1],[5,5,10],[k,w],Position).

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

test(Y):-Z is -9,Z > -1.

kingReach(D1,D2,D3):-D1=\=0,D1<3,D1> -3,
                     D2=\=0,D2<2,D2> -2,
                     D3 =:= 0.
kingReach(D1,D2,D3):-D2=\=0,D2<3,D2> -3,
                     D1=\=0,D1<2,D1> -2,
                     D3 =:= 0.
                 
kingReach(D1,D2,D3):-D1=\=0,D1<3,D1> -3,
                     D3=\=0,R3 is D3 mod 10,
                     R3<2,R3> -2,
                     D2 =:= 0.
kingReach(D1,D2,D3):-D1=\=0,D1<2,D1> -2,
                     D3=\=0,R3 is D3 mod 10,
                     R3<3,R3> -3,
                     D2 =:= 0.

kingReach(D1,D2,D3):-D3=\=0,R3 is D3 mod 10,
                     R3<3,R3> -3,
                     D2=\=0,D2<2,D2> -2,
                     D1 =:= 0.

kingReach(D1,D2,D3):-D3=\=0,R3 is D3 mod 10,
                     R3<2,R3> -2,
                     D2=\=0,D2<3,D2> -3,
                     D1 =:= 0.


/*Predicate for the King*/
isReach(Position,Position1,Piece,Board):- Piece=[k|Color],
                                                Color=[COL|_],
                                                not_Color(COL,ColorBar),
                                                Position=[X,Y,Z],
                                                Position1=[X1,Y1,Z1],
                                                D1 is X - X1,
                                                D2 is Y-Y1,
                                                D3 is Z-Z1,
                                                kingReach(D1,D2,D3).
                                    
                                                                        
                                   
                                                                                                     
                                    
                                    
                                    
