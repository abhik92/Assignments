initialise(Game,Position,Player):- init(Position),setplayer(Player),move([(a,1,6)|(a,2,7)],Position,Position1).
%change the second parameter of initialise to Position1 if you want to display the final Position1 in the prompt.
% finally that wont matter because we will be using announce() to annouce the result, and displaying board after each step.


%everywhere 1 is white, 2 is black
%piece is denoted using : 'p' for pawn,'k' for king, 'r' for rook, 'b' for bishop, 'h' for knight/horse, 'q' for queen.
setplayer(Player):- Player=1.
init(Position):- Position = [(a,1,6),(-1,-1),(a,2,7),(-1,-1),(a,3,8),(-1,-1),(a,4,9),(-1,-1),(a,5,10),(-1,-1),(a,6,11),(-1,-1),
                               (b,1,5),(-1,-1),(b,2,6),(-1,-1),(b,3,7),(-1,-1),(b,4,8),(-1,-1),(b,5,9),(-1,-1),(b,6,10),(-1,-1),(b,7,11),(-1,-1) 
                               ,(c,1,4),(p,1),(c,2,5),(-1,-1),(c,3,6),(-1,-1),(c,4,7),(-1,-1),(c,5,8),(-1,-1),(c,6,9),(-1,-1),(c,7,10),(-1,-1),(c,8,11),(p,2),
                    (d,1,3),(r,1),(d,2,4),(p,1),(d,3,5),(-1,-1),(d,4,6),(-1,-1),(d,5,7),(-1,-1),(d,6,8),(-1,-1),(d,7,9),(-1,-1),(d,8,10),(p,2),(d,9,11),(r,2),
(e,1,2),(q,1),(e,2,3),(h,1),(e,3,4),(p,1),(e,4,5),(-1,-1),(e,5,6),(-1,-1),(e,6,7),(-1,-1),(e,7,8),(-1,-1),(e,8,9),(p,2),(e,9,10),(h,2),(e,10,11),(q,2),
 
(f,1,1),(b,1),
(f,2,2),(b,1),(f,3,3),(b,1),(f,4,4),(p,1),(f,5,5),(-1,-1),(f,6,6),(-1,-1),(f,7,7),(-1,-1),(f,8,8),(p,2),(f,9,9),(b,2),(f,10,10),(b,2),(f,11,11),(b,2),          

(k,6,1),(-1,-1),(k,7,2),(-1,-1),(k,8,3),(-1,-1),(k,9,4),(-1,-1),(k,10,5),(-1,-1),(k,11,6),(-1,-1),
                               (j,5,1),(-1,-1),(j,6,2),(-1,-1),(j,7,3),(-1,-1),(j,8,4),(-1,-1),(j,9,5),(-1,-1),(j,10,6),(-1,-1),(j,11,7),(-1,-1) 
                               ,(i,4,1),(-p,1),(i,5,2),(-1,-1),(i,6,3),(-1,-1),(i,7,4),(-1,-1),(i,8,5),(-1,-1),(i,9,6),(-1,-1),(i,10,7),(-1,-1),(i,11,8),(p,2),
                    (h,3,1),(r,1),(h,4,2),(p,1),(h,5,3),(-1,-1),(h,6,4),(-1,-1),(h,7,5),(-1,-1),(h,8,6),(-1,-1),(h,9,7),(-1,-1),(h,10,8),(p,2),(h,11,9),(r,2),
(g,2,1),(k,1),(g,3,2),(h,1),(g,4,3),(p,1),(g,5,4),(-1,-1),(g,6,5),(-1,-1),(g,7,6),(-1,-1),(g,8,7),(-1,-1),(g,9,8),(p,2),(g,10,9),(h,2),(g,11,10),(k,2) ].

nextplayer(Player,Player1):- Player=1,Player1 = 2.
nextplayer(Player,Player1):- Player=2,Player1 = 1.


move(Move,Pos1,Pos2):- Move = [X|Y],getpcX(X,Pos1,Ans), replaceY(Y,Ans,Pos1,Posi),replaceX(X,Posi,Pos2).
% getpcX gets the (piece,colour) pair associated with X in the original position Pos1. it gets stored in Ans.
% replaceY changes the (piece,colour) of Y in Pos1 to Ans and gets to stage Posi.
% replaceX changes the (piece,colour) of X in Posi to null and gets to stage Pos2 which is the required output.

getpcX(X,Pos1,Ans):- Pos1  = [X|T1] , T1 = [Y|T] , Ans = Y.
getpcX(X,Pos1,Ans):- Pos1 = [Y|T] , getpcX(X,T,Ans).


replaceY(Y,Ans,Pos1,Posi):-Pos1=[Y|T1] ,T1 = [Z|T],T2 = [Ans|T] , Posi = [Y|T2].
replaceY(Y,Ans,[Z|T1],[Z|Posi]):- replaceY(Y,Ans,T1,Posi). 

replaceX(X,Pos1,Posi):-Pos1=[X|T1] ,T1 = [Z|T],T2 = [(-1,-1)|T] , Posi = [X|T2].
replaceX(X,[Z|T1],[Z|Posi]):- replaceX(X,T1,Posi).

