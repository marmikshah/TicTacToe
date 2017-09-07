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
    int gameArray[3][3];
    int counter;
    bool computerPlayer;
}

@property (weak, nonatomic) IBOutlet UIView *boardLineOne;
@property (weak, nonatomic) IBOutlet UIView *boardLineTwo;
@property (weak, nonatomic) IBOutlet UIView *boardLineThree;
@property (weak, nonatomic) IBOutlet UIView *boardLineFour;


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

@implementation TwoPlayer



- (IBAction)button1:(id)sender {
    [self gameOver];
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
    [self gameOver];}
- (IBAction)button2:(id)sender {
    [self gameOver];
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
    [self gameOver];    
}
- (IBAction)button3:(id)sender {
    [self gameOver];
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
    [self gameOver];    
}
- (IBAction)button4:(id)sender {
    [self gameOver];
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
    [self gameOver];    
}
- (IBAction)button5:(id)sender {
    [self gameOver];
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
    [self gameOver];    
}
- (IBAction)button6:(id)sender {
    [self gameOver];
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
    [self gameOver];    
}
- (IBAction)button7:(id)sender {
    [self gameOver];
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
    [self gameOver];    
}
- (IBAction)button8:(id)sender {
    [self gameOver];
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
    [self gameOver];    
}
- (IBAction)button9:(id)sender {
    [self gameOver];
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
    [self gameOver];
}


-(int)win {
    //Sequence Row : 1
    CABasicAnimation *rotate;
    rotate = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotate.fromValue = [NSNumber numberWithFloat:0];
    rotate.toValue = [NSNumber numberWithFloat:(10)];
    rotate.duration = 3;
    rotate.repeatCount = 1;
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
    
    UIAlertView* player = [[UIAlertView alloc]initWithTitle:@"Winner" message:@"Player 1" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    UIAlertView* computer = [[UIAlertView alloc]initWithTitle:@"Winner" message:@"Player 2" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    UIAlertView* draw = [[UIAlertView alloc]initWithTitle:@"Oops!" message:@"Draw" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    int win = [self win];
    if(win == 1)
    {
        [player show];
    }
    if(win == -1)
    {
        [computer show];
    }
    if(win!=1 && win!=-1 && counter >8)
    {
        [draw show];
    }
}
-(void)initGameWithDefaultValues {
    counter = 0;
    self.x = [UIImage imageNamed:@"X"];
    self.o = [UIImage imageNamed:@"O"];
    self.boardLineOne.layer.cornerRadius = 50;
    self.boardLineTwo.layer.cornerRadius = 50;
    self.boardLineThree.layer.cornerRadius = 50;
    self.boardLineFour.layer.cornerRadius = 50;
    
    for(int i=0;i<3;i++)
    {
        for(int j=0;j<3;j++)
        {
            gameArray[i][j] = 0;
        }
    }
}
-(void)viewDidLoad {
    [self initGameWithDefaultValues];
    
}

@end
