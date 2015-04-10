//
//  ZCGStartScreen.m
//  ThrowBallGame
//
//  Created by zhu on 4/6/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "ZCGStartScreenMgr.h"
#import "../gameView/ZCGView.h"
#import "../statistic/ZCGStat.h"
#import "ZCGUIMgr.h"

@interface ZCGStartScreenMgr ()
{

}
- (IBAction)ButtonTouchUpInsideAction:(UIButton *)sender;
@end

@implementation ZCGStartScreenMgr
@synthesize mp_startMainView;
@synthesize mp_startBtn;
@synthesize mp_helpBtn;
@synthesize mp_gameUIMgr;
@synthesize mp_gameStat;


- (void)dealloc
{
    [mp_startMainView release];
    [mp_startBtn release];
    [mp_helpBtn release];
    
    [mp_gameUIMgr release];
    
    [mp_gameStat release];
    
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
            mp_gameUIMgr.mp_playMainScreen.hidden = NO;
            mp_gameUIMgr.mp_startMainScreen.hidden = YES;
            break;
        case BG_HELP_BUTTON_ID:
            NSLog(@"HELP BUTTON IS CLICKED\n");
            break;
        default:
            break;
    }
    
}

- (void)TouchEventHandle:(NSSet *)touches withEvent:(UIEvent *)event withEventType:(TOUCH_EVENT_TYPE)touchEventType
{
    
}

@end


















