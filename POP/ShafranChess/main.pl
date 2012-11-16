/*This is the main driver which plays*/
play(Position,Player,Result):- choose_move(Position,Player,Move),move(Move,Position,Position1),display_game(Position1,player),next_player(Player,Player1),!,play(Position1,Player1,Result).

Play(Position,Player,Result):- game_over(Position,Player,Result),!,announce(Result).

Play(Game):-initialize(Game,Position,Player),display_game(Position,Player),play(Position,Player,Result).

/*The function which chooses the move among the available ones*/

choose_move(Position,Player,Move):-read_input_from_screen(Move),legal(Position,Move,Player),move(Move,Position,Position1).

choose_move(Position,Computer,Move):-set_of(M,move(Position,M),Moves),evaluate_and_choose(Moves,Position,10,1,nil,Bestmove).

/*The part of the AI functions */
/*Finds the best move starting at position 1 and depth D search*/
evaluate_and_choose([Move|Moves],Position,D,Maxmin,Record,Bestmove):-move(Move,Position,Position1),minimax(D,Position1,Max,Move,Value),update(Move,Value,Record,Record1),
                                                                     evaluate_and_choose(Moves,Position,D,Maxmin,Record1,Bestmove).
evaluate_and_choose([],Position,D,Maxmin,Record,Record).

/*Write the minimax function */
        
