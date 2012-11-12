initialize(Game,Position,Position1):- initial_position(Position),move([[b,1,9]|[a,1,10]],Position,Position1).

initial_position(Position):- Position = [[a,1,10],[r,w],[b,1,9],[h,w],[c,1,8],[b,w],[d,1,7],[q,w],[e,1,6],[k,w],[f,2,6],[b,w],[g,3,6],[h,w],[h,4,6],[b,w],[i,5,6],[r,w],
                                         [a,2,1],[p,w],[b,2,10],[p,w],[c,2,9],[p,w],[d,2,8],[p,w],[e,2,7],[p,w],[f,3,7],[p,w],[g,4,7],[p,w],[h,5,7],[p,w],[i,6,7],[p,w],
                                         [a,3,2],[nil,nil],[b,3,1],[nil,nil],[c,3,10],[nil,nil],[d,3,9],[nil,nil],[e,3,8],[nil,nil],[f,4,8],[nil,nil],[g,5,8],[nil,nil],[h,6,8],[nil,nil],[i,7,8],[nil,nil],
                                         [a,4,3],[nil,nil],[b,4,2],[nil,nil],[c,4,1],[nil,nil],[d,4,10],[nil,nil],[e,4,9],[nil,nil],[f,5,9],[nil,nil],[g,6,9],[nil,nil],[h,6,9],[nil,nil],[i,6,9],[nil,nil],
                                         [a,5,4],[p,b],[b,5,3],[nil,nil],[c,5,2],[nil,nil],[d,5,1],[nil,nil],[e,5,10],[nil,nil],[f,6,10],[nil,nil],[g,7,10],[nil,nil],[h,8,10],[nil,nil],[i,9,10],[p,b],
                                         [a,6,5],[r,b],[b,6,4],[p,b],[c,6,3],[nil,nil],[d,6,2],[nil,nil],[e,6,1],[nil,nil],[f,7,1],[nil,nil],[g,8,1],[nil,nil],[h,9,1],[p,b],[i,10,1],[r,b],
                                         [b,7,5],[b,b],[c,7,4],[p,b],[d,7,3],[nil,nil],[e,7,2],[nil,nil],[f,8,2],[nil,nil],[g,9,2],[p,b],[h,10,2],[r,b],
                                         [c,8,5],[h,b],[d,8,4],[p,b],[e,8,3],[nil,nil],[f,9,3],[p,b],[g,10,3],[b,b],
                                         [d,9,5],[b,b],[e,9,4],[p,b],[f,10,4],[q,b],
                                         [e,10,5],[k,b]].


/* Gets the next player given the other player */
next_player(w,Player1):- Player1 = b.
next_player(b,Player1):- Player1 = w.



/* the move function*/
/*takes the Move as input and moves the piece from position to position1*/

move(Move,Position,Position1):- Move = [CurrentPosition|NewPosition], getPiece(CurrentPosition,CurrentPiece,Position),newPosition(NewPosition,CurrentPiece,Position,Positionint),emptyOldPosition(CurrentPosition,CurrentPiece,Positionint,Position1).

getPiece(GivenPosition,Piece,Position):-Position = [GivenPosition|Rest],Rest=[Piece|_].
getPiece(GivenPosition,Piece,[Y|Rest]):-getPiece(GivenPosition,Piece,Rest).


newPosition(NewPosition,Piece,Position,Positionint):- Position=[NewPosition|Rest],Rest=[CurRest|Y],NewRest=[Piece|Y],Positionint=[NewPosition|NewRest].
newPosition(NewPosition,Piece,[Z|Rest],[Z|Positionint]):- newPosition(NewPosition,Piece,Rest,Positionint). 

emptyOldPosition(CurrentPosition,Piece,Position,Positionint):-Position=[CurrentPosition|Rest],Rest = [CurrentPiece|Y],NewRest=[[nil,nil]|Y], Positionint=[CurrentPosition|NewRest].
emptyOldPosition(CurrentPosition,Piece,[Z|Rest],[Z|Positionint]):- emptyOldPosition(CurrentPosition,Piece,Rest,Positionint).

