//
//  TwoPlayer.m
//  Tic Tac Toe
//
//  Created by Marmik Shah on 16/01/14.
//  Copyright (c) 2014 Marmik Shah. All rights reserved.
//

#import "TwoPlayer.h"

@interface TwoPlayer ()

{
    int board[9];
    int turnCounter;
}

@property (weak, nonatomic) IBOutlet UIView *boardLineOne;
@property (weak, nonatomic) IBOutlet UIView *boardLineTwo;
@property (weak, nonatomic) IBOutlet UIView *boardLineThree;
@property (weak, nonatomic) IBOutlet UIView *boardLineFour;

@property (strong,nonatomic) UIImage* x;
@property (strong,nonatomic) UIImage* o;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *boxList;

@end

@implementation TwoPlayer

-(IBAction)buttonClicked:(id)sender {

    [sender setUserInteractionEnabled:NO];
    [self clickButtonWithID:[sender tag]];
}

-(void)clickButtonWithID : (NSInteger) buttonNumber {
    switch (buttonNumber) {
        case 1:
            NSLog(@"1");
            [self makeAMove:1];
            break;
        case 2 :
            NSLog(@"2");
            [self makeAMove:2];
            break;
        case 3 :
            NSLog(@"3");
            [self makeAMove:3];
            break;
        case 4 :
            NSLog(@"4");
            [self makeAMove:4];
            break;
        case 5 :
            NSLog(@"5");
            [self makeAMove:5];
            break;
        case 6 :
            NSLog(@"6");
            [self makeAMove:6];
            break;
        case 7 :
            NSLog(@"7");
            [self makeAMove:7];
            break;
        case 8:
            NSLog(@"8");
            [self makeAMove:8];
            break;
        case 9 :
            NSLog(@"9");
            [self makeAMove:9];
            break;
        default:
            break;
    }
    if ([self didWin:board]) {
        if(turnCounter%2 == 0) {
            UIAlertController* playerOne = [UIAlertController alertControllerWithTitle:@"Game Over!" message:@"X Wins!" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleCancel handler:nil];
            [playerOne addAction:cancel];
            [self presentViewController:playerOne animated:YES completion:nil];
        } else {
            UIAlertController* playerOne = [UIAlertController alertControllerWithTitle:@"Game Over!" message:@"O Wins!" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Dismiss" style:UIAlertActionStyleCancel handler:nil];
            [playerOne addAction:cancel];
            [self presentViewController:playerOne animated:YES completion:nil];
        }
        for(int i=0;i<9;i++){
            [self.boxList[i] setUserInteractionEnabled:NO];
        }
    }
    turnCounter += 1;


}

-(void)makeAMove : (int) boxNumber {
    
    if (turnCounter % 2 == 0) {
        board[boxNumber-1] = 1;
        [self.boxList[boxNumber-1] setBackgroundImage:self.x forState:UIControlStateNormal];
    } else {
        board[boxNumber-1] = -1;
        [self.boxList[boxNumber-1] setBackgroundImage:self.o forState:UIControlStateNormal];
    }
    [self.boxList[boxNumber-1] setUserInteractionEnabled:NO];
}



-(BOOL)didWin : (int[])game {
    if ((game[0] == game[1] && game[0] == game[2]) || (game[3] == game[4] && game[4] == game[5]) || (game[6] == game[7] && game[7] == game[8]) || (game[0] == game[3] && game[3] == game[6]) || (game[1] == game[4] && game[4] == game[7]) || (game[2] == game[5] && game[5] == game[8]) || (game[0] == game[4] && game[4] == game[8]) || (game[2] == game[4] && game[4] == game[6])) {
        return YES;
    }
    return NO;
}

-(void)initGameWithDefaultValues {
    
    self.x = [UIImage imageNamed:@"X"];
    self.o = [UIImage imageNamed:@"O"];

    self.boardLineOne.layer.cornerRadius = 5;
    self.boardLineTwo.layer.cornerRadius = 5;
    self.boardLineThree.layer.cornerRadius = 5;
    self.boardLineFour.layer.cornerRadius = 5;
    turnCounter = 0;
    for(int i=0;i<9;i++){
        board[i] = -i*10;
    }
}

-(void)viewDidLoad {
    [self initGameWithDefaultValues];
}

- (IBAction)restartGame:(id)sender {
    [self initGameWithDefaultValues];
    for (UIButton* button in self.boxList) {
        button.imageView.image = nil;
    }
    [self.view reloadInputViews];
}


@end
