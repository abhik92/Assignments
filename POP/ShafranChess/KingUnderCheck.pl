/*Assuming that the input given by the user is a valid move, i.e., on the move, the piece still remains within the playing area,and also the move*/ 
/*is a legal move according to the capabilities of the piece being moved(Maybe change this later, to detect erroneous moves out of character)*/ 
/*move is legal if one completing the move the king is not under check.*/

legal(Position, move) :- move(Move,Position,Position1),KingCheck(Position1,player);Accept(move,Position).

/*checks if the current player's king is under attack or check */
KingCheck(Position,player) :- QueenAttack(Position,player);RookAttack(Position,player);BishopAttack(Position,player);KnightAttack(Position,player);
                              PawnsAttack(Position,player);KingKingClash(move,Position);Accept(move,Position).
                       
/*
As the coordinates are stored in 3-tuples, maybe store the coordinates of the opponent Queen, RookS, BishopS and KnightS,and then check for Attacks.
*/                       
                              
/* Check if the opponent Queen is causing a check to the player's King*/
QueenAttack(Position,player):- .

/* Check if the opponent Rook is causing a check to the player's King*/
RookAttack(Position,player):- .
      
/* Check if the opponent Bishop is causing a check to the player's King*/
BishopAttack(Position,player):- .

/* Check if the opponent Knight is causing a check to the player's King*/
KnightAttack(Position,player):- .

/* Check if any of the opponent Pawns are causing a check to the player's King*/
PawnsAttack(Position,player):- .
      
/* Check if the opponent King is causing a clash with the player's King,meaning the previous move was erroneous*/
KingKingClash(Position,player):- .

      
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
