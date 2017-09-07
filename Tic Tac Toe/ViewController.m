//
//  ViewController.m
//  Tic Tac Toe
//
//  Created by Marmik Shah on 15/12/13.
//  Copyright (c) 2013 Marmik Shah. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *singlePlayerButton;
@property (weak, nonatomic) IBOutlet UIButton *multiplayerButton;
@property (weak, nonatomic) IBOutlet UIButton *aboutButton;


@end



@implementation ViewController


-(void)viewDidLoad {
    [super viewDidLoad];
    self.singlePlayerButton.layer.cornerRadius = 5;
    self.multiplayerButton.layer.cornerRadius = 5;
    self.aboutButton.layer.cornerRadius = 5;
    
}

@end
