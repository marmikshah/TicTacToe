//
//  ViewController.m
//  Tic Tac Toe
//
//  Created by Marmik Shah on 15/12/13.
//  Copyright (c) 2013 Marmik Shah. All rights reserved.
//

#import "ViewController.h"
#import "Function.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *singlePlayerButton;
@property (weak, nonatomic) IBOutlet UIButton *multiplayerButton;
@property (weak, nonatomic) IBOutlet UIButton *aboutButton;
@property (weak, nonatomic) IBOutlet UIButton *reportButton;


@end



@implementation ViewController


-(void)viewDidLoad {
    [super viewDidLoad];
    [Function renderButtonLayout:self.singlePlayerButton useBorderColor:[Function borderColorNormal]];
    [Function renderButtonLayout:self.multiplayerButton useBorderColor:[Function borderColorNormal]];
    [Function renderButtonLayout:self.aboutButton useBorderColor:[Function borderColorNormal]];
    [Function renderButtonLayout:self.reportButton useBorderColor:[Function borderColorDestructive]];
    
}

@end
