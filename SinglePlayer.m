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
    if([self remainingMoves:board] == 0) return;
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
    
    // ## Todo : Win AlertView
//    if ([self didWin:board]) {
//        if(turnCounter%2 == 0) {
//            UIAlertController* playerOne = [UIAlertController alertControllerWithTitle:@"Game Over!" message:@"X Wins!" preferredStyle:UIAlertControllerStyleAlert];
//            UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleCancel handler:nil];
//            [playerOne addAction:cancel];
//            [self presentViewController:playerOne animated:YES completion:nil];
//        } else {
//            UIAlertController* playerOne = [UIAlertController alertControllerWithTitle:@"Game Over!" message:@"O Wins!" preferredStyle:UIAlertControllerStyleAlert];
//            UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleCancel handler:nil];
//            [playerOne addAction:cancel];
//            [self presentViewController:playerOne animated:YES completion:nil];
//        }
//        for(int i=0;i<9;i++){
//            [self.boxList[i] setUserInteractionEnabled:NO];
//        }
//    }
//    turnCounter += 1;
}

-(void)makeAMove : (int) boxNumber {
    board[boxNumber] = human;
    [self.boxList[boxNumber] setBackgroundImage:self.x forState:UIControlStateNormal];
    int newBoard[9];
    for(int i=0;i<9;i++) {
        newBoard[i] = board[i];
    }
    [self minimax:newBoard :bot];
    int bestMove = 0;
    int bestScore = -10101;

    for(int i=0;i<9;i++){
        if (moves[i] > bestScore) {

            bestScore = moves[i];
            bestMove = i;
        }
    }
    for(int i=0;i<9;i++) {
        //Reset Moves
        moves[i] = 0;
    }
    board[bestMove] = bot;
    [self.boxList[bestMove] setBackgroundImage:self.o forState:UIControlStateNormal];
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
        (board[2] == player && board[4] == player && board[6] == player)
        ) {
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


-(int) minimax : (int[]) game : (int) isPlayer {
    int gameBoard[9];
    for(int i=0;i<9;i++){
        gameBoard[i] = game[i];
    }
    int space = [self remainingMoves:gameBoard];
    if([self didWin: gameBoard : human]) {
            return -10;
    }
    else if([self didWin: gameBoard : bot]) {
            return 10;
    }
    else if (space == 0) {
            return 0;
    }
    int result = 0;
    
    for(int i=0;i<9;i++) {
        if (gameBoard[i] != 0) continue;
        gameBoard[i] = isPlayer;
        if(isPlayer == human) {
            result += [self minimax: gameBoard : bot];
        } else {
            result += [self minimax: gameBoard : human];
        }
        if (moves[i] == 0) {
            moves[i] = result;
        }
        else if(moves[i] < result) {
            moves[i] = result;
        }
        gameBoard[i] = 0;
    }
    return 0;
}
-(void)viewDidLoad {
    [self initGameWithDefaultValues];
}

@end
