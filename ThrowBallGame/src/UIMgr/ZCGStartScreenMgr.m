//
//  ZCGStartScreen.m
//  ThrowBallGame
//
//  Created by zhu on 4/6/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "ZCGStartScreenMgr.h"
#import "../gameView/ZCGView.h"

@interface ZCGStartScreenMgr ()
{

}
@property(nonatomic, retain) UIButton *mp_startBtn;
@property(nonatomic, retain) UIButton *mp_helpBtn;
- (IBAction)ButtonTouchUpInsideAction:(UIButton *)sender;
@end

@implementation ZCGStartScreenMgr
@synthesize mp_startMainView;
@synthesize mp_startBtn;
@synthesize mp_helpBtn;


- (void)dealloc
{
    [mp_startMainView release];
    [mp_startBtn release];
    [mp_helpBtn release];
    
    [super dealloc];
}




- (BOOL)InitStartScreen:(ZCGView *)p_startMainView
{
    if (p_startMainView == nil) {
        return NO;
    }
    
    self.mp_startMainView = p_startMainView;
    
    [mp_startMainView setBackgroundColor:[UIColor colorWithRed:0 green:10 blue:10	 alpha:1.0]];
    
    
    CGRect frame = CGRectMake(150, 200, 100, 50);
    
    mp_startBtn = [mp_startMainView Add_Button:@"START" with_frame:frame with_tag:BG_START_BUTTON_ID with_index:0];
    
    frame.origin.x -= 70;
    mp_helpBtn = [mp_startMainView Add_Button:@"HELP" with_frame:frame with_tag:BG_HELP_BUTTON_ID with_index:1];
    
    [mp_startBtn setTransform : CGAffineTransformMakeRotation(M_PI / 2)];
    [mp_helpBtn setTransform : CGAffineTransformMakeRotation(M_PI / 2)];
    
    [mp_startBtn addTarget:self action:@selector(ButtonTouchUpInsideAction:) forControlEvents:UIControlEventTouchUpInside];
    [mp_helpBtn addTarget:self action:@selector(ButtonTouchUpInsideAction:) forControlEvents:UIControlEventTouchUpInside];
    
    return YES;
}

- (IBAction)ButtonTouchUpInsideAction:(UIButton *)sender
{
    switch ([sender tag]) {
        case BG_START_BUTTON_ID:
            NSLog(@"START BUTTON IS CLICKED\n");
            break;
        case BG_HELP_BUTTON_ID:
            NSLog(@"HELP BUTTON IS CLICKED\n");
            break;
        default:
            break;
    }
    
}


@end


















