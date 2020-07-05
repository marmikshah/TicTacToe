//
//  SinglePlayer.m
//  Tic Tac Toe
//
//  Created by Marmik Shah on 15/01/14.
//  Copyright (c) 2014 Marmik Shah. All rights reserved.
//

#import "SinglePlayer.h"
#import <SpriteKit/SpriteKit.h>
#import "Function.h"

@interface SinglePlayer ()

{
    int board[9];
    int human;
    int bot;
}

@property (weak, nonatomic) IBOutlet UIView *boardLineOne;
@property (weak, nonatomic) IBOutlet UIView *boardLineTwo;
@property (weak, nonatomic) IBOutlet UIView *boardLineThree;
@property (weak, nonatomic) IBOutlet UIView *boardLineFour;

@property (strong,nonatomic) UIImage* x;
@property (strong,nonatomic) UIImage* o;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *boxList;
@property (weak, nonatomic) IBOutlet UIButton *homeButton;

@end

@implementation SinglePlayer

-(IBAction)buttonClicked:(id)sender {
    [self psuedoClick:[sender tag]];
}

-(void)psuedoClick : (NSInteger)tagNumber {
    
    // If all boxes filled, then return. Make no move.
    if([self remainingMoves:board] == 0) return;
    
    // Disable user interaction to the box that has been clicked.
    [self.boxList[tagNumber] setUserInteractionEnabled:NO];
    [self makeAMove:(int)tagNumber];
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

    
    // In the board skeleton, add the bot variable at the 'bestMove' position. (Indicating that the bot had played there)
    board[bestMove] = bot;
    
    // Dynamically change the button image to playing player's value (either X or O)
    [self.boxList[bestMove] setBackgroundImage:self.o forState:UIControlStateNormal];
    [self.boxList[bestMove] setUserInteractionEnabled:NO];
    
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
    for(int i=0;i<9;i++) newBoard[i] = board[i];
    
    return [self bestMove:newBoard];
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


-(int) minimax : (int[]) game : (int) isPlayer {
    
    // Creating a new game board (copy)
    int gameBoard[9];
    for(int i=0;i<9;i++){
        gameBoard[i] = game[i];
    }
    
    // Checking for spaces. If space exisits, then continue executing.
    int space = [self remainingMoves:gameBoard];
    
    // Return -10 if human is winning , +10 if bot wins and 0 if no win and no move exist.
    if ([self didWin: gameBoard : human]) return -10 ;
    if ([self didWin: gameBoard : bot]) return 10;
    if (space == 0)  return 0;
    
    
    // When the maximising player is playing (bot)
    if(bot == isPlayer) {
        // Set a negative score as we need to maximise it
        int bestScore = -10101;
        
        // Iterate over the board and fill empty positions with 'bot' value. Call minimax again.
        for(int i=0;i<9;i++){
            if(gameBoard[i] != 0) continue;
            gameBoard[i] = bot;
            int score = [self minimax:gameBoard : human];
            if(score > bestScore) bestScore = score;
            gameBoard[i] = 0;
        }
//        NSLog(@"Best Score : %d", bestScore);
        return bestScore;
    }
    
    // When the minimizing player is playing (human)
    if (human == isPlayer) {
        int bestScore = 10101;
        for(int i=0;i<9;i++){
            if(gameBoard[i] != 0) continue;
            gameBoard[i] = human;
            int score = [self minimax:gameBoard : bot];
            if(score < bestScore) bestScore = score;
            gameBoard[i] = 0;
        }
        //NSLog(@"Best Score : %d", bestScore);
        return bestScore;
    }
    return 0;
}

-(int) bestMove : (int[])gameBoard {
    int bestScore = -1000;
    int bestMove = -100;
    for(int i=0;i<9;i++){
        if(gameBoard[i] != 0) continue;
        gameBoard[i] = bot;
        int score = [self minimax: gameBoard : human];
        NSLog(@"Int Score : %d, i : %d",score,i);
        if(score > bestScore) {
            bestScore = score;
            
            bestMove = i;
        }
        gameBoard[i] = 0;
    }
    NSLog(@"Best Score : %d, Move : %d", bestScore, bestMove);
    return bestMove;
}

-(void)viewDidLoad {
    [self initGameWithDefaultValues];
    [Function renderButtonLayout:self.homeButton useBorderColor:[Function borderColorDestructive]];
}

@end
