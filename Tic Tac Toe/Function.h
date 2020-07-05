//
//  Function.h
//  Tic Tac Toe
//
//  Created by Marmik Shah on 19/1/2019.
//  Copyright © 2019 Marmik Shah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface Function : NSObject

+(UIColor*) borderColorNormal;
+(UIColor*) borderColorDestructive;

+(void) renderButtonLayout :(UIButton*)button useBorderColor : (UIColor*) color;
+(void) renderLabelLayout :(UILabel*)label useBorderColor : (UIColor*) color;

@end

