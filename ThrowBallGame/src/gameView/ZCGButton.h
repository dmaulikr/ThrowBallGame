//
//  ZCGButton.h
//  ThrowBallGame
//
//  Created by zhu on 4/5/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCGButton : UIButton
{
    
}
- (void)AddTarget:(id)target action:(SEL)action;
+ (id)InitButton:(NSString *)title with_frame : (CGRect)frame with_tag : (int)nTag;

@end
