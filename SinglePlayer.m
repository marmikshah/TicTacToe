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
    int gameArray[3][3];
    int counter;
    int randomBox[9];
    bool computerPlayer;
    bool animationPlayed;
}
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;

@property (strong,nonatomic) UIImage* x;
@property (strong,nonatomic) UIImage* o;
@property (strong, nonatomic) IBOutlet UIImageView *image1;
@property (strong, nonatomic) IBOutlet UIImageView *image2;
@property (strong, nonatomic) IBOutlet UIImageView *image3;
@property (strong, nonatomic) IBOutlet UIImageView *image4;
@property (strong, nonatomic) IBOutlet UIImageView *image5;
@property (strong, nonatomic) IBOutlet UIImageView *image6;
@property (strong, nonatomic) IBOutlet UIImageView *image7;
@property (strong, nonatomic) IBOutlet UIImageView *image8;
@property (strong, nonatomic) IBOutlet UIImageView *image9;

@end

@implementation SinglePlayer

- (IBAction)button1:(id)sender {
    NSLog(@"Button 1 Called");
    if(counter%2 == 0){
        self.image1.image = self.x;
        gameArray[0][0] = 1;
    } else {
        self.image1.image = self.o;
        gameArray[0][0] = -1;
    }
    [sender setUserInteractionEnabled:NO];
    counter++;
    if(computerPlayer == false && (counter !=9)) {
        [self computerPlayed];
        computerPlayer = false;
    }
    [self gameOver];
}
- (IBAction)button2:(id)sender {
        NSLog(@"Button 2 Called");
    if(counter%2 == 0){
        self.image2.image = self.x;
        gameArray[0][1] = 1;
    } else {
        self.image2.image = self.o;
        gameArray[0][1] = -1;
    }
    [sender setUserInteractionEnabled:NO];
    counter++;
    if(computerPlayer == false && (counter !=9)) {
        [self computerPlayed];
        computerPlayer = false;
    }
    [self gameOver];
}
- (IBAction)button3:(id)sender {
        NSLog(@"Button 3 Called");
    if(counter%2 == 0){
        self.image3.image = self.x;
        gameArray[0][2] = 1;
    } else {
        self.image3.image = self.o;
        gameArray[0][2] = -1;
    }
    [sender setUserInteractionEnabled:NO];
    counter++;
    if(computerPlayer == false && (counter !=9)) {
        [self computerPlayed];
        computerPlayer = false;
    }
    [self gameOver];
}
- (IBAction)button4:(id)sender {
        NSLog(@"Button 4 Called");
    if(counter%2 == 0){
        self.image4.image = self.x;
        gameArray[1][0] = 1;
    } else {
        self.image4.image = self.o;
        gameArray[1][0] = -1;
    }
    [sender setUserInteractionEnabled:NO];
    counter++;
    if(computerPlayer == false && (counter !=9)) {
        [self computerPlayed];
        computerPlayer = false;
    }
    [self gameOver];
}
- (IBAction)button5:(id)sender {
        NSLog(@"Button 5 Called");
    if(counter%2 == 0){
        self.image5.image = self.x;
        gameArray[1][1] = 1;
    } else {
        self.image5.image = self.o;
        gameArray[1][1] = -1;
    }
    [sender setUserInteractionEnabled:NO];
    counter++;
    if(computerPlayer == false && (counter !=9)) {
        [self computerPlayed];
        computerPlayer = false;
    }
    [self gameOver];
}
- (IBAction)button6:(id)sender {
        NSLog(@"Button 6 Called");
    if(counter%2 == 0){
        self.image6.image = self.x;
        gameArray[1][2] = 1;
    } else {
        self.image6.image = self.o;
        gameArray[1][2] = -1;
    }
    [sender setUserInteractionEnabled:NO];
    counter++;
    if(computerPlayer == false && (counter !=9)) {
        [self computerPlayed];
        computerPlayer = false;
    }
    [self gameOver];
}
- (IBAction)button7:(id)sender {
        NSLog(@"Button 7 Called");
    if(counter%2 == 0){
        self.image7.image = self.x;
        gameArray[2][0] = 1;
    } else {
        self.image7.image = self.o;
        gameArray[2][0] = -1;
    }
    [sender setUserInteractionEnabled:NO];
    counter++;
    if(computerPlayer == false && (counter !=9)) {
        [self computerPlayed];
        computerPlayer = false;
    }
    [self gameOver];
}
- (IBAction)button8:(id)sender {
        NSLog(@"Button 8 Called");
    if(counter%2 == 0){
        self.image8.image = self.x;
        gameArray[2][1] = 1;
    } else {
        self.image8.image = self.o;
        gameArray[2][1] = -1;
    }
    [sender setUserInteractionEnabled:NO];
    counter++;
    if(computerPlayer == false && (counter !=9)) {
        [self computerPlayed];
        computerPlayer = false;
    }
    [self gameOver];
}
- (IBAction)button9:(id)sender {
        NSLog(@"Button 9 Called");
    if(counter%2 == 0){
        self.image9.image = self.x;
        gameArray[2][2] = 1;
    } else {
        self.image9.image = self.o;
        gameArray[2][2] = -1;
    }
    [sender setUserInteractionEnabled:NO];
    counter++;
    if(computerPlayer == false && (counter !=9)) {
        [self computerPlayed];
        computerPlayer = false;
    }
    [self gameOver];
}

-(int)playerWinPossibility {
    //Sequence Row : 1
    if(gameArray[0][0] == 1 && gameArray[0][1] == 1 && gameArray[0][2] == 0)
    {
        return 2;
    }
    if(gameArray[0][0] == 1 && gameArray[0][1] == 0 && gameArray[0][2] == 1)
    {
        return 1;
    }
    if(gameArray[0][0] == 0 && gameArray[0][1] == 1 && gameArray[0][2] == 1)
    {
        return 0;
    }
    //Sequence Row : 2
    if(gameArray[1][0] == 1 && gameArray[1][1] == 1 && gameArray[1][2] == 0)
    {
        return 12;
    }
    if(gameArray[1][0] == 1 && gameArray[1][1] == 0 && gameArray[1][2] == 1)
    {
        return 11;
    }
    if(gameArray[1][0] == 0 && gameArray[1][1] == 1 && gameArray[1][2] == 1)
    {
        return 10;
    }
    //Sequence Row : 3
    if(gameArray[2][0] == 1 && gameArray[2][1] == 1 && gameArray[2][2] == 0)
    {
        return 22;
    }
    if(gameArray[2][0] == 1 && gameArray[2][1] == 0 && gameArray[2][2] == 1)
    {
        return 21;
    }
    if(gameArray[2][0] == 0 && gameArray[2][1] == 1 && gameArray[2][2] == 1)
    {
        return 20;
    }
    //Sequence Col : 1
    if(gameArray[0][0] == 1 && gameArray[1][0] == 1 && gameArray[2][0] == 0)
    {
        return 20;
    }
    if(gameArray[0][0] == 1 && gameArray[1][0] == 0 && gameArray[2][0] == 1)
    {
        return 10;
    }
    if(gameArray[0][0] == 0 && gameArray[1][0] == 1 && gameArray[2][0] == 1)
    {
        return 00;
    }
    //Sequence Col : 2
    if(gameArray[0][1] == 1 && gameArray[1][1] == 1 && gameArray[2][1] == 0)
    {
        return 21;
    }
    if(gameArray[0][1] == 1 && gameArray[1][1] == 0 && gameArray[2][1] == 1)
    {
        return 11;
    }
    if(gameArray[0][1] == 0 && gameArray[1][1] == 1 && gameArray[2][1] == 1)
    {
        return 01;
    }
    //Sequence Col : 3
    if(gameArray[0][2] == 1 && gameArray[1][2] == 1 && gameArray[2][2] == 0)
    {
        return 22;
    }
    if(gameArray[0][2] == 1 && gameArray[1][2] == 0 && gameArray[2][2] == 1)
    {
        return 12;
    }
    if(gameArray[0][2] == 0 && gameArray[1][2] == 1 && gameArray[2][2] == 1)
    {
        return 02;
    }
    //Sequence Diagonal : 1
    if(gameArray[0][0] == 1 && gameArray[1][1] == 1 && gameArray[2][2] == 0)
    {
        return 22;
    }
    if(gameArray[0][0] == 1 && gameArray[1][1] == 0 && gameArray[2][2] == 1)
    {
        return 11;
    }
    if(gameArray[0][0] == 0 && gameArray[1][1] == 1 && gameArray[2][2] == 1)
    {
        return 0;
    }
    //Sequence Diagonal : 2
    if(gameArray[0][2] == 1 && gameArray[1][1] == 1 && gameArray[2][0] == 0)
    {
        return 20;
    }
    if(gameArray[0][2] == 1 && gameArray[1][1] == 0 && gameArray[2][0] == 1)
    {
        return 11;
    }
    if(gameArray[0][2] == 0 && gameArray[1][1] == 1 && gameArray[2][0] == 1)
    {
        return 02;
    }
    return -1;

}
-(int)computerWinPossibility {
    //Sequence Row : 1
    if(gameArray[0][0] == -1 && gameArray[0][1] == -1 && gameArray[0][2] == 0)
    {
        return 2;
    }
    if(gameArray[0][0] == -1 && gameArray[0][1] == 0 && gameArray[0][2] == -1)
    {
        return 1;
    }
    if(gameArray[0][0] == 0 && gameArray[0][1] == -1 && gameArray[0][2] == -1)
    {
        return 0;
    }
    //Sequence Row : 2
    if(gameArray[1][0] == -1 && gameArray[1][1] == -1 && gameArray[1][2] == 0)
    {
        return 12;
    }
    if(gameArray[1][0] == -1 && gameArray[1][1] == 0 && gameArray[1][2] == -1)
    {
        return 11;
    }
    if(gameArray[1][0] == 0 && gameArray[1][1] == -1 && gameArray[1][2] == -1)
    {
        return 10;
    }
    //Sequence Row : 3
    if(gameArray[2][0] == -1 && gameArray[2][1] == -1 && gameArray[2][2] == 0)
    {
        return 22;
    }
    if(gameArray[2][0] == -1 && gameArray[2][1] == 0 && gameArray[2][2] == -1)
    {
        return 21;
    }
    if(gameArray[2][0] == 0 && gameArray[2][1] == -1 && gameArray[2][2] == -1)
    {
        return 20;
    }
    //Sequence Col : 1
    if(gameArray[0][0] == -1 && gameArray[1][0] == -1 && gameArray[2][0] == 0)
    {
        return 20;
    }
    if(gameArray[0][0] == -1 && gameArray[1][0] == 0 && gameArray[2][0] == -1)
    {
        return 10;
    }
    if(gameArray[0][0] == 0 && gameArray[1][0] == -1 && gameArray[2][0] == -1)
    {
        return 00;
    }
    //Sequence Col : 2
    if(gameArray[0][1] == -1 && gameArray[1][1] == -1 && gameArray[2][1] == 0)
    {
        return 21;
    }
    if(gameArray[0][1] == -1 && gameArray[1][1] == 0 && gameArray[2][1] == -1)
    {
        return 11;
    }
    if(gameArray[0][1] == 0 && gameArray[1][1] == -1 && gameArray[2][1] == -1)
    {
        return 01;
    }
    //Sequence Col : 3
    if(gameArray[0][2] == -1 && gameArray[1][2] == -1 && gameArray[2][2] == 0)
    {
        return 22;
    }
    if(gameArray[0][2] == -1 && gameArray[1][2] == 0 && gameArray[2][2] == -1)
    {
        return 12;
    }
    if(gameArray[0][2] == 0 && gameArray[1][2] == -1 && gameArray[2][2] == -1)
    {
        return 02;
    }
    //Sequence Diagonal : 1
    if(gameArray[0][0] == -1 && gameArray[1][1] == -1 && gameArray[2][2] == 0)
    {
        return 22;
    }
    if(gameArray[0][0] == -1 && gameArray[1][1] == 0 && gameArray[2][2] == -1)
    {
        return 11;
    }
    if(gameArray[0][0] == 0 && gameArray[1][1] == -1 && gameArray[2][2] == -1)
    {
        return 0;
    }
    //Sequence Diagonal : 2
    if(gameArray[0][2] == -1 && gameArray[1][1] == -1 && gameArray[2][0] == 0)
    {
        return 20;
    }
    if(gameArray[0][2] == -1 && gameArray[1][1] == 0 && gameArray[2][0] == -1)
    {
        return 11;
    }
    if(gameArray[0][2] == 0 && gameArray[1][1] == -1 && gameArray[2][0] == -1)
    {
        return 02;
    }
    return -1;

}
-(int)forkAnalysed {
    /*
     // |x| |x| 01,10,11 //00,02,20 --Done --Checked
     // | | | |
     // |x| | |
     
     // |x| |x| 01,11,12 //00,02,22 --Done --Checked
     // | | | |
     // | | |x|
     
     // | | |x| 11,12,21 //02,20,22 --Done --Checked
     // | | | |
     // |x| |x|
     
     // |x| | | 10,11,21 //00,20,22 --Done
     // | | | |
     // |x| |x|
     
     // |x| |x| 01,20,22 //00,02,11 --Done
     // | |x| |
     // | | | |
     
     // |x| | | 02,10,22 //00,11,20 --Done
     // | |x| |
     // |x| | |
     
     // | | |x| 01,12,20 //02,11,22 --Done
     // | |x| |
     // | | |x|
     
     // | | | | 00,02,21 //11,20,22 --Done
     // | |x| |
     // |x| |x|
     */ //Fork sequences.
    int fork = [self forkDetected];
    if(fork >= 30)
    {
        switch (fork)
        {
            case 30: //01,10,11 --Checked
            {
                if(gameArray[0][1] == 0)
                {
                    return 01;
                    break;
                }
                if(gameArray[1][1] == 0)
                {
                    return 11;
                    break;
                }
                if(gameArray[1][0] == 0)
                {
                    return 10;
                    break;
                }
            }
                break;
            case 32: //01,11,12 --Checked
            {
                if(gameArray[0][1] == 0)
                {
                    return 01;
                    break;
                }
                if(gameArray[1][1] == 0)
                {
                    return 11;
                    break;
                }
                if(gameArray[1][2] == 0)
                {
                    return 12;
                    break;
                }
            }
                break;
            case 34: //11,12,21 --Checked
            {
                if(gameArray[1][1] == 0)
                {
                    return 11;
                    break;
                }
                if(gameArray[1][2] == 0)
                {
                    return 12;
                    break;
                }
                if(gameArray[2][1] == 0)
                {
                    return 21;
                    break;
                }
                
            }
                break;
            case 36: //10,11,21 --Checked
            {
                if(gameArray[1][0] == 0)
                {
                    return 10;
                    break;
                }
                if(gameArray[1][1] == 0)
                {
                    return 11;
                    break;
                }
                if(gameArray[2][1] == 0)
                {
                    return 21;
                    break;
                }
            }
                break;
            case 38: //01,20,22 --Checked
            {
                if(gameArray[1][0] == 0)
                {
                    return 10;
                    break;
                }
                if(gameArray[2][0] == 0)
                {
                    return 10;
                    break;
                }
                if(gameArray[2][2] == 0)
                {
                    return 22;
                    break;
                }
            }
                break;
            case 40: //02,10,22 --Checked
            {
                if(gameArray[0][2] == 0)
                {
                    return 02;
                    break;
                }
                if(gameArray[1][0] == 0)
                {
                    return 10;
                    break;
                }
                if(gameArray[2][2] == 0)
                {
                    return 22;
                    break;
                }
            }
                break;
            case 42: //01,12,20 --Checked
            {
                if(gameArray[0][1] == 0)
                {
                    return 01;
                    break;
                }
                if(gameArray[1][2] == 0)
                {
                    return 12;
                    break;
                }
                if(gameArray[2][0] == 0)
                {
                    return 20;
                    break;
                }
            }
                break;
            case 44: //00,02,21 --Checked
            {
                if(gameArray[0][0] == 0)
                {
                    return 00;
                    break;
                }
                if(gameArray[0][2] == 0)
                {
                    return 02;
                    break;
                }
                if(gameArray[2][1] == 0)
                {
                    return 21;
                    break;
                }
            }
                break;
        }
        counter++;
    }
    return 100;
}
-(int)forkDetected {
    
    if(gameArray[0][0] == 1 && gameArray[0][2] == 1 && gameArray[2][0] == 1)
    {
        // |x| |x| 01,10,11 //00,02,20
        // | | | |
        // |x| | |
        return 30;
    }
    if(gameArray[0][0] == 1 && gameArray[0][2] == 1 && gameArray[2][2] == 1)
    {
        // |x| |x| 01,11,12 //00,02,22
        // | | | |
        // | | |x|
        return 32;
    }
    if(gameArray[0][2] == 1 && gameArray[2][0] == 1 && gameArray[2][2] == 1)
    {
        // | | |x| 11,12,21 //02,20,22
        // | | | |
        // |x| |x|
        return 34;
    }
    if(gameArray[0][0] == 1 && gameArray[2][0] == 1 && gameArray[2][2] == 1)
    {
        // |x| | | 10,11,21 //00,20,22
        // | | | |
        // |x| |x|
        return 36;
    }
    if(gameArray[0][0] == 1 && gameArray[0][2] == 1 && gameArray[1][1] == 1)
    {
        // |x| |x| 01,20,22 //00,02,11
        // | |x| |
        // | | | |
        return 38;
    }
    if(gameArray[0][0] == 1 && gameArray[1][1] == 1 && gameArray[2][0] == 1)
    {
        // |x| | | 02,10,22 //00,11,20
        // | |x| |
        // |x| | |
        return 40;
    }
    if(gameArray[0][2] == 1 && gameArray[1][1] == 1 && gameArray[2][2] == 1)
    {
        // | | |x| 01,12,20 //02,11,22
        // | |x| |
        // | | |x|
        return 42;
    }
    if(gameArray[1][1] == 1 && gameArray[2][0] == 1 && gameArray[2][2] == 1)
    {
        // | | | | 00,02,21 //11,20,22
        // | |x| |
        // |x| |x|
        return 44;
    }
    //If a fork is found, then any non-zero number from 30-50 is returned is returned. Or else a zero is returned and next possibility is checked. (My favourite number :P)
    return 0;
    
}
-(void)initGameWithDefaultValues {
    counter = 0;
    self.x = [UIImage imageNamed:@"X"];
    self.o = [UIImage imageNamed:@"O"];
    for(int i=0;i<3;i++)
    {
        for(int j=0;j<3;j++)
        {
            gameArray[i][j] = 0;
        }
    }
}
-(void)computerPlayed {
    NSLog(@"Computer's Turn %d",counter);
    computerPlayer = TRUE;
    int computer = [self computerWinPossibility];
    if(computer != -1) {
        NSLog(@"Computer's win isn't possible");
        switch(computer) {
            case 00:
                [self button1:nil];
                break;
            case 01:
                [self button2:nil];
                break;
            case 02:
                [self button3:nil];
                break;
            case 10:
                [self button4:nil];
                break;
            case 11:
                [self button5:nil];
                break;
            case 12:
                [self button6:nil];
                break;
            case 20:
                [self button7:nil];
                break;
            case 21:
                [self button8:nil];
                break;
            case 22:
                [self button9:nil];
                break;
        }
    } else {
        int fork = [self forkAnalysed];
        if(fork != 100)
        {
            NSLog(@"Fork Detected");
            switch(fork) {
                case 00:
                    [self button1:nil];
                    break;
                case 01:
                    [self button2:nil];
                    break;
                case 02:
                    [self button3:nil];
                    break;
                case 10:
                    [self button4:nil];
                    break;
                case 11:
                    [self button5:nil];
                    break;
                case 12:
                    [self button6:nil];
                    break;
                case 20:
                    [self button7:nil];
                    break;
                case 21:
                    [self button8:nil];
                    break;
                case 22:
                    [self button9:nil];
                    break;
            }

        } else {
            int player = [self playerWinPossibility];
            if(player != -1)
            {
                NSLog(@"Player's win is possible");
                switch(player) {
                    case 00:
                        [self button1:nil];
                        break;
                    case 01:
                        [self button2:nil];
                        break;
                    case 02:
                        [self button3:nil];
                        break;
                    case 10:
                        [self button4:nil];
                        break;
                    case 11:
                        [self button5:nil];
                        break;
                    case 12:
                        [self button6:nil];
                        break;
                    case 20:
                        [self button7:nil];
                        break;
                    case 21:
                        [self button8:nil];
                        break;
                    case 22:
                        [self button9:nil];
                        break;
                }

            } else {
                //Perform a random move.
                if(gameArray[1][1] == 0) {
                    [self button5:Nil];
                    goto randPlayed;
                }
            reCheck:NSLog(@"Getting Random Numbers");
                int rand = arc4random()%9;
                NSLog(@"%d",rand);
                switch(rand)
                {
                    case 0: {
                            if(gameArray[0][0] == 0)
                            {
                                [self button1:nil];
                            } else {
                                goto reCheck;
                            }
                        }
                        break;
                    case 1: {
                        if(gameArray[0][1] == 0)
                        {
                            [self button2:nil];
                        } else {
                            goto reCheck;
                        }
                    }
                        break;
                    case 2: {
                        if(gameArray[0][2] == 0)
                        {
                            [self button3:nil];
                        } else {
                            goto reCheck;
                        }
                    }
                        break;
                    case 3: {
                        if(gameArray[1][0] == 0)
                        {
                            [self button4:nil];
                        } else {
                            goto reCheck;
                        }
                    }
                        break;
                    case 4: {
                        if(gameArray[1][1] == 0)
                        {
                            [self button5:nil];
                        } else {
                            goto reCheck;
                        }
                    }
                        break;
                    case 5: {
                        if(gameArray[1][2] == 0)
                        {
                            [self button6:nil];
                        } else {
                            goto reCheck;
                        }
                    }
                        break;
                    case 6: {
                        if(gameArray[2][0] == 0)
                        {
                            [self button1:nil];
                        } else {
                            goto reCheck;
                        }
                    }
                        break;
                    case 7: {
                        if(gameArray[2][1] == 0)
                        {
                            [self button8:nil];
                        } else {
                            goto reCheck;
                        }
                    }
                        break;
                    case 8: {
                        if(gameArray[2][2] == 0)
                        {
                            [self button9:nil];
                        } else {
                            goto reCheck;
                        }
                    }
                        break;
                }
            randPlayed:NSLog(@"Random Performed");
            }
        }
    }
    [self gameOver];
    NSLog(@"COmputer Player %d",counter);
}
-(int)win {
    
    //Sequence Row : 1
    CABasicAnimation *rotate;
    rotate = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotate.toValue = [NSNumber numberWithFloat: 3 * 2.0];
    rotate.duration = 3;
    rotate.speed = 10;
    rotate.cumulative = YES;
    rotate.repeatCount = 5;
    if(gameArray[0][0] == 1 && gameArray[0][1] == 1 && gameArray[0][2] == 1)
    {
        [self.image1.layer addAnimation:rotate forKey:@"10"];
        [self.image2.layer addAnimation:rotate forKey:@"10"];
        [self.image3.layer addAnimation:rotate forKey:@"10"];
        return 1;
    }
    //Sequence Row : 2
    if(gameArray[1][0] == 1 && gameArray[1][1] == 1 && gameArray[1][2] == 1)
    {
        [self.image4.layer addAnimation:rotate forKey:@"10"];
        [self.image5.layer addAnimation:rotate forKey:@"10"];
        [self.image6.layer addAnimation:rotate forKey:@"10"];
        return 1;
    }
    //Sequence Row : 3
    if(gameArray[2][0] == 1 && gameArray[2][1] == 1 && gameArray[2][2] == 1)
    {
        [self.image7.layer addAnimation:rotate forKey:@"10"];
        [self.image8.layer addAnimation:rotate forKey:@"10"];
        [self.image9.layer addAnimation:rotate forKey:@"10"];
        return 1;
    }
    //Sequence Col : 1
    if(gameArray[0][0] == 1 && gameArray[1][0] == 1 && gameArray[2][0] == 1)
    {
        [self.image1.layer addAnimation:rotate forKey:@"10"];
        [self.image4.layer addAnimation:rotate forKey:@"10"];
        [self.image7.layer addAnimation:rotate forKey:@"10"];
        return 1;
    }
    //Sequence Col : 2
    if(gameArray[0][1] == 1 && gameArray[1][1] == 1 && gameArray[2][1] == 1)
    {
        [self.image2.layer addAnimation:rotate forKey:@"10"];
        [self.image5.layer addAnimation:rotate forKey:@"10"];
        [self.image8.layer addAnimation:rotate forKey:@"10"];
        return 1;
    }
    //Sequence Col : 3
    if(gameArray[0][2] == 1 && gameArray[1][2] == 1 && gameArray[2][2] == 1)
    {
        [self.image3.layer addAnimation:rotate forKey:@"10"];
        [self.image6.layer addAnimation:rotate forKey:@"10"];
        [self.image9.layer addAnimation:rotate forKey:@"10"];
        return 1;
    }
    //Sequence Diagonal : 1
    if(gameArray[0][0] == 1 && gameArray[1][1] == 1 && gameArray[2][2] == 1)
    {
        [self.image1.layer addAnimation:rotate forKey:@"10"];
        [self.image5.layer addAnimation:rotate forKey:@"10"];
        [self.image9.layer addAnimation:rotate forKey:@"10"];
        return 1;
    }
    //Sequence Diagonal : 2
    if(gameArray[0][2] == 1 && gameArray[1][1] == 1 && gameArray[2][0] == 1)
    {
        [self.image3.layer addAnimation:rotate forKey:@"10"];
        [self.image5.layer addAnimation:rotate forKey:@"10"];
        [self.image7.layer addAnimation:rotate forKey:@"10"];
        return 1;
    }
    //Sequence Row : 1
    if(gameArray[0][0] == -1 && gameArray[0][1] == -1 && gameArray[0][2] == -1)
    {
        [self.image1.layer addAnimation:rotate forKey:@"10"];
        [self.image2.layer addAnimation:rotate forKey:@"10"];
        [self.image3.layer addAnimation:rotate forKey:@"10"];
        return -1;
    }
    //Sequence Row : 2
    if(gameArray[1][0] == -1 && gameArray[1][1] == -1 && gameArray[1][2] == -1)
    {
        [self.image4.layer addAnimation:rotate forKey:@"10"];
        [self.image5.layer addAnimation:rotate forKey:@"10"];
        [self.image6.layer addAnimation:rotate forKey:@"10"];
        return -1;
    }
    //Sequence Row : 3
    if(gameArray[2][0] == -1 && gameArray[2][1] == -1 && gameArray[2][2] == -1)
    {
        [self.image7.layer addAnimation:rotate forKey:@"10"];
        [self.image8.layer addAnimation:rotate forKey:@"10"];
        [self.image9.layer addAnimation:rotate forKey:@"10"];
        return -1;
    }
    //Sequence Col : 1
    if(gameArray[0][0] == -1 && gameArray[1][0] == -1 && gameArray[2][0] == -1)
    {
        [self.image1.layer addAnimation:rotate forKey:@"10"];
        [self.image4.layer addAnimation:rotate forKey:@"10"];
        [self.image7.layer addAnimation:rotate forKey:@"10"];
        return -1;
    }
    //Sequence Col : 2
    if(gameArray[0][1] == -1 && gameArray[1][1] == -1 && gameArray[2][1] == -1)
    {
        [self.image2.layer addAnimation:rotate forKey:@"10"];
        [self.image5.layer addAnimation:rotate forKey:@"10"];
        [self.image8.layer addAnimation:rotate forKey:@"10"];
        return -1;
    }
    //Sequence Col : 3
    if(gameArray[0][2] == -1 && gameArray[1][2] == -1 && gameArray[2][2] == -1)
    {
        [self.image3.layer addAnimation:rotate forKey:@"10"];
        [self.image6.layer addAnimation:rotate forKey:@"10"];
        [self.image9.layer addAnimation:rotate forKey:@"10"];
        return -1;
    }
    //Sequence Diagonal : 1
    if(gameArray[0][0] == -1 && gameArray[1][1] == -1 && gameArray[2][2] == -1)
    {
        [self.image1.layer addAnimation:rotate forKey:@"10"];
        [self.image5.layer addAnimation:rotate forKey:@"10"];
        [self.image9.layer addAnimation:rotate forKey:@"10"];
        return -1;
    }
    //Sequence Diagonal : 2
    if(gameArray[0][2] == -1 && gameArray[1][1] == -1 && gameArray[2][0] == -1)
    {
        [self.image3.layer addAnimation:rotate forKey:@"10"];
        [self.image5.layer addAnimation:rotate forKey:@"10"];
        [self.image7.layer addAnimation:rotate forKey:@"10"];
        return -1;
    }
    return -100;
}
-(void)gameOver{
    
    UIAlertView* player = [[UIAlertView alloc]initWithTitle:@"Winner" message:@"Player" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    UIAlertView* computer = [[UIAlertView alloc]initWithTitle:@"Winner" message:@"Computer" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    UIAlertView* draw = [[UIAlertView alloc]initWithTitle:@"Oops!" message:@"Draw" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    int win = [self win];
    if(win == 1 && animationPlayed == false)
    {
        [player show];
        double delayInSeconds = 2.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [self performSegueWithIdentifier:@"gameOverSP" sender:player];
        });
        animationPlayed = true;
    }
    if(win == -1 && animationPlayed == false)
    {
        [computer show];
        double delayInSeconds = 2.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [self performSegueWithIdentifier:@"gameOverSP" sender:computer];
        });
        animationPlayed = true;
    }
    if(win!=1 && win!=-1 && counter ==9 && animationPlayed == false)
    {
        [draw show];
        double delayInSeconds = 2.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [self performSegueWithIdentifier:@"gameOverSP" sender:draw];
        });
        animationPlayed = true;
    }
}
-(void)viewDidLoad {
    [self initGameWithDefaultValues];
    computerPlayer = false;
    animationPlayed = false;
}

@end
