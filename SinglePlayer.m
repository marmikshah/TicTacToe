//
//  SinglePlayer.m
//  Tic Tac Toe
//
//  Created by Marmik Shah on 15/01/14.
//  Copyright (c) 2014 Marmik Shah. All rights reserved.
//

#import "SinglePlayer.h"
#import <SpriteKit/SpriteKit.h>

@interface SinglePlayer ()

{
    int board[9];
    int turnCounter;
    int moves[9];
    int human;
    int bot;
    NSMutableArray* moveArray;
}

@property (weak, nonatomic) IBOutlet UIView *boardLineOne;
@property (weak, nonatomic) IBOutlet UIView *boardLineTwo;
@property (weak, nonatomic) IBOutlet UIView *boardLineThree;
@property (weak, nonatomic) IBOutlet UIView *boardLineFour;

@property (strong,nonatomic) UIImage* x;
@property (strong,nonatomic) UIImage* o;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *boxList;

@end

@implementation SinglePlayer

-(IBAction)buttonClicked:(id)sender {
    [self psuedoClick:[sender tag]];
    NSLog(@"Clicked %ld",(long)[sender tag]);
}

-(void)psuedoClick : (NSInteger)tagNumber {
    
    // If all boxes filled, then return. Make no move.
    if([self remainingMoves:board] == 0) return;
    
    // Disable user interaction to the box that has been clicked.
    [self.boxList[tagNumber] setUserInteractionEnabled:NO];
    switch (tagNumber) {
        case 0:
            NSLog(@"1");
            [self makeAMove:0];
            break;
        case 1 :
            NSLog(@"2");
            [self makeAMove:1];
            break;
        case 2 :
            NSLog(@"3");
            [self makeAMove:2];
            break;
        case 3 :
            NSLog(@"4");
            [self makeAMove:3];
            break;
        case 4 :
            NSLog(@"5");
            [self makeAMove:4];
            break;
        case 5 :
            NSLog(@"6");
            [self makeAMove:5];
            break;
        case 6 :
            NSLog(@"7");
            [self makeAMove:6];
            break;
        case 7:
            NSLog(@"8");
            [self makeAMove:7];
            break;
        case 8 :
            NSLog(@"9");
            [self makeAMove:8];
            break;
        default:
            break;
    }
}

// When game ends, whether there are unfilled boxes, disableAllButtons helps to deactivate 'click' on them.
-(void) disableAllButtons {
    for(int i=0;i<9;i++){
        [self.boxList[i] setUserInteractionEnabled:NO];
    }
}


-(void)makeAMove : (int) boxNumber {
    // In the board skeleton, add the human variable (indicating that human has played there)
    board[boxNumber] = human;
    
    // Dynamically change the button image to playing player's value (either X or O)
    [self.boxList[boxNumber] setBackgroundImage:self.x forState:UIControlStateNormal];
    
    // If the human player has won, then disable all buttons and end all actions/game.
    if([self didWin:board : human]) {
        [self showGameStatusAlert:human];
        // TODO : Segue to home screen
        return;
    }
    
    // If no empty boxes exist on the board, then send a '0' value to alert function to indicate the the game status is 'Draw'
    if([self remainingMoves:board] == 0) {
        [self showGameStatusAlert:0];
        return;
    }
    
    
    // Get the best move for the bot to play
    int bestMove = [self playAI];
//    while (board[bestMove] != 0){
//        bestMove = [self playAI];
//    }
    
    // In the board skeleton, add the bot variable at the 'bestMove' position. (Indicating that the bot had played there)
    board[bestMove] = bot;
    
    // Dynamically change the button image to playing player's value (either X or O)
    [self.boxList[bestMove] setBackgroundImage:self.o forState:UIControlStateNormal];
    
    // If the bot player has won, then disable all buttons and end all actions/game.
    if([self didWin:board : bot]) {
        [self showGameStatusAlert:bot];
        // TODO : Segue to home screen
        return;
    }
}

-(int) playAI {
    
    // Since main board is a pointer, I don't want to work on that. Hence, I create a copy variable and send it to the minimax function.
    int newBoard[9];
    for(int i=0;i<9;i++) {
        newBoard[i] = board[i];
    }
    
    // Call Minimax on bot with depth 0.
    [self minimax:newBoard : bot : 1];
    
    // Iterate over the 'moves' array to find the best move for current game setting.
    int bestMove = 0;
    int bestScore = 10101;
    
    for(int i=0;i<9;i++){

        // Find the max and assign it to bestScore. Change bestMove to the current board position
        if (moves[i] < bestScore && moves[i] > 0) {
            bestScore = moves[i];
            bestMove = i;
        }
    }
    
    for(int i=0;i<9;i++) {
        //Reset Moves
        moves[i] = 0;
    }
    return bestMove;
}

-(BOOL)didWin : (int[]) board : (int) player {
    
    if (
        (board[0] == player && board[1] == player && board[2] == player) ||
        (board[3] == player && board[4] == player && board[5] == player) ||
        (board[6] == player && board[7] == player && board[8] == player) ||
        (board[0] == player && board[3] == player && board[6] == player) ||
        (board[1] == player && board[4] == player && board[7] == player) ||
        (board[2] == player && board[5] == player && board[8] == player) ||
        (board[0] == player && board[4] == player && board[8] == player) ||
        (board[2] == player && board[4] == player && board[6] == player)) {
        return YES;
    } else {
        return NO;
    }
}

-(void)initGameWithDefaultValues {
    
    self.x = [UIImage imageNamed:@"X"];
    self.o = [UIImage imageNamed:@"O"];
    
    bot = 1;
    human = -1;
    
    self.boardLineOne.layer.cornerRadius = 5;
    self.boardLineTwo.layer.cornerRadius = 5;
    self.boardLineThree.layer.cornerRadius = 5;
    self.boardLineFour.layer.cornerRadius = 5;
    
    for(int i=0;i<9;i++){
        board[i] = 0;
        moves[i] = 0;
    }
}

-(int) remainingMoves : (int[])board {
    int space = 0;
    for(int i=0;i<9;i++){
        if (board[i] == 0) {
            space++;
        }
    }
    return space;
}

-(int) nextEmptySpace : (int[]) board {
    for(int i=0;i<9;i++){
        if (board[i] == 0) return i;
    }
    return -1;
}

-(void)showGameStatusAlert : (int) winner {
    [self disableAllButtons];
    UIAlertController* alert;
    if (winner == bot) {
        alert = [UIAlertController alertControllerWithTitle:@"Game Over!" message:@"O Wins!" preferredStyle:UIAlertControllerStyleAlert];
    } else if (winner == human) {
         alert = [UIAlertController alertControllerWithTitle:@"Game Over!" message:@"X Wins!" preferredStyle:UIAlertControllerStyleAlert];
    } else {
        alert = [UIAlertController alertControllerWithTitle:@"Game Over!" message:@"Draw :(" preferredStyle:UIAlertControllerStyleAlert];
    }
    UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}


-(int) minimax : (int[]) game : (int) isPlayer : (int) depth {
    
    // Creating a new game board (copy)
    int gameBoard[9];
    for(int i=0;i<9;i++){
        gameBoard[i] = game[i];
    }
    
    // Checking for spaces. If space exisits, then continue executing.
    int space = [self remainingMoves:gameBoard];
    
    // Add human to every spot and check if he's winning in the next move
    if(depth == 1) {
        // If it is the first level in game tree, then check whether mid spot is empty. In case it is, then fill it.
        if(gameBoard[4] == 0) {
            moves[4] = 1000;
            return 1;
        }
        
        // Else check if next immediate move is the winning move for the player. If it is, then fill it.
        for(int i=0;i<9;i++){
            if(gameBoard[i] != 0) continue;
            
            // Set gameBoard[i] to human
            gameBoard[i] = human;
            if ([self didWin: gameBoard : human]) {
                moves[i] = 1000;
                
                // Reset gameBoard[i] to 0
                gameBoard[i] = 0;
                return 1;
            }
            // Reset gameBoard[i] to 0
            gameBoard[i] = 0;
        }
    }
    
    // Return -10 if human is winning , +10 if bot wins and 0 if no win and no move exist.
    if ([self didWin: gameBoard : human]) {
        return -10 * depth;
    }
    else if ([self didWin: gameBoard : bot]) return 10 * depth;
    else if (space == 0)  return 0;
    
    // Result will store the score from next leaf.
    int result = 0;
    
    for(int i=0;i<9;i++) {
        // In case if the board[i] box is utilised, then skip and go to next box.
        if (gameBoard[i] != 0) continue;
        
        // Then add current player value to the board
        gameBoard[i] = isPlayer;
        
        // If current player is human, then make the next minimax call with 'bot' as the current player. (And vice verca)
        if(isPlayer == human) result = [self minimax: gameBoard : bot : depth + 1];
        else result = [self minimax: gameBoard : human : depth + 1];
                                         
        // If the result greater than the score present in moves[i] or if the moves[i] is empty, then set result as the score in moves[i];
        if(moves[i] < result || moves[i] == 0){
            moves[i] = result;
        }
        
        // Reset the box in our board.
        gameBoard[i] = 0;
    }
    return 0;
}

-(void)viewDidLoad {
    [self initGameWithDefaultValues];
}

@end
