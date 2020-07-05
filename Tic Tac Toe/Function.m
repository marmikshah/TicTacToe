//
//  Function.m
//  Tic Tac Toe
//
//  Created by Marmik Shah on 19/1/2019.
//  Copyright © 2019 Marmik Shah. All rights reserved.
//

#import "Function.h"

@implementation Function

+(UIColor *)borderColorNormal {
    return [UIColor colorWithRed:20/255 green:227/255 blue:194/255 alpha:1.0];
}

+(UIColor *)borderColorDestructive {
    return [UIColor colorWithRed:255/255 green:0/255 blue:31/255 alpha:1.0];

}

+ (void) renderLabelLayout:(UILabel *)label useBorderColor:(UIColor*)color {
    [label.layer setCornerRadius : 5];
    [label setBackgroundColor : UIColor.whiteColor];
    [label.layer setBorderWidth : 3];
    [label.layer setBorderColor : [color CGColor]];
}

+ (void) renderButtonLayout:(UIButton *)button useBorderColor:(UIColor*)color {
    [button.layer setCornerRadius : button.frame.size.height/2];
    [button setBackgroundColor : UIColor.whiteColor];
    [button.layer setBorderWidth : 3];
    [button.layer setBorderColor : [color CGColor]];
}


@end
