/*Assuming that the input given by the user is a valid move, i.e., on the move, the piece still remains within the playing area,and also the move*/ 
/*is a legal move according to the capabilities of the piece being moved(Maybe change this later, to detect erroneous moves out of character)*/ 
/*move is legal if one completing the move the king is not under check.*/

legal(Position, move) :- move(Move,Position,Position1),NotKingCheck(Position1,Player).

NotKingCheck(Board,Player):-KingCheck(Board,Player),!,fail.
NotKingCheck(Board,Player).

/*checks if the current player's king is under attack or check */
KingCheck(Board,Player) :-iterateBoard(Board,[k,Player],Position1,Board),Attack(Board,Player,Position1,Board).                       
/*
As the coordinates are stored in 3-tuples, maybe store the coordinates of the opponent Queen, RookS, BishopS and KnightS,and then check for Attacks.
*/                       
                              
/* Go through full board*/
iterateBoard(Board,Piece,Position,List):-List=[Front|Rest],Front=[A,B,C],getPiece(Front,ThisPiece,Board),ThisPiece=Piece,Position=Front.
iterateBoard(Board,Piece,Position,[Y|Rest]):-iterateBoard(Board,Piece,Position,Rest).


/* Check if the opponent Queen is causing a check to the player's King*/
%QueenAttack(Board,player,KingPosition):-player=w,iterateBoard(Board,[q,w],QueenPosition),isReach(QueenPosition,KingPosition,[q.w],Board) .
%QueenAttack(Position,player):-player=b,iterateBoard(Position,[q,b]) .

/* Check if the opponent Rook is causing a check to the player's King*/
%RookAttack(Position,player):- .
      
/* Check if the opponent Bishop is causing a check to the player's King*/
%BishopAttack(Position,player):- .

/* Check if the opponent Knight is causing a check to the player's King*/
%KnightAttack(Position,player):- .

/* Check if any of the opponent Pawns are causing a check to the player's King*/
%PawnsAttack(Position,player):- .
    
/* Check if the opponent King is causing a clash with the player's King,meaning the previous move was erroneous*/
%KingKingClash(Position,player):- .

Attack(Board,Player,KingPosition,List):-next_player(Player,Player1),List=[Front|Rest],Front=[A,B,C],getPiece(Front,ThisPiece,Board),ThisPiece=[Player1,_],isReach(Front,KingPosition,ThisPiece,Board).
Attack(Board,Player,KingPosition,[X|Rest]):-Attack(Board,Player,KingPosition,Rest).

      
/* Idea to find CHECK or not: */      
/*  Store the current position of the Player's king.  
    Extract the appropriate position of each of the following pieces of the opponent, Queen,Rook,Bishop,Knight,Pawns, in that order.
    Check the possible moves for all pieces,except the Pawns
    If there is a possibility of a move to the current position of the Player's king, then it is a CHECK! => Previous move was erroneous
    Break, once a CHECK has occured
    Continue, if it doesn't occur
    Now, only the CHECKs by Pawns are to be checked
    Check if the Player's King is in a square diagonal to any of the opponent's Pawns
    If so, then it is under CHECK from that Pawn
    => CHECK!
    If all these don't give a match, the King is not under any CHECK, and the previous move was CORRECT!
    */      
