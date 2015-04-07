//
//  ZCGStartScreen.m
//  ThrowBallGame
//
//  Created by zhu on 4/6/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "ZCGStartScreenMgr.h"

@implementation ZCGStartScreenMgr

- (IBAction)ButtonTouchUpInsideAction:(UIButton *)sender
{
    
}


- (BOOL)InitStartScreen:(ZCGView *)p_startMainView
{
    if (p_startMainView == nil) {
        return NO;
    }
    mp_startMainView = p_startMainView;
    
    CGRect frame = CGRectMake(100, 100, 100, 50);
    
    mp_startBtn = [mp_startMainView Add_Button:@"START" with_frame:frame with_tag:1 with_index:0];
    
    frame.origin.y += 70;
    mp_startBtn = [mp_startMainView Add_Button:@"HELP" with_frame:frame with_tag:2 with_index:1];
    
    [mp_startBtn addTarget:self action:@selector(ButtonTouchUpInsideAction:) forControlEvents:UIControlEventTouchUpInside];
    [mp_helpBtn addTarget:self action:@selector(ButtonTouchUpInsideAction:) forControlEvents:UIControlEventTouchUpInside];
    
//    [mp_startBtn setTransform : CGAffineTransformMakeRotation(-M_PI / 2)];
//    [mp_helpBtn setTransform : CGAffineTransformMakeRotation(-M_PI / 2)];
    
    return YES;
}

@end


















