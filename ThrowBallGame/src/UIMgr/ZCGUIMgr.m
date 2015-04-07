//
//  ZCGUIMgr.m
//  ThrowBallGame
//
//  Created by zhu on 4/5/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "ZCGUIMgr.h"

@implementation ZCGUIMgr

- (id)init:(ZCGView *)p_mainViewContainer
{
    self = [super init];
    if (self) {
        [self InitGameUI:p_mainViewContainer];
    }
    
    return self;
}

- (void)InitGameUI:(ZCGView *)p_mainViewContainer
{
    CGRect frame;
    
    mp_mainViewContainer = p_mainViewContainer;
    
    frame = mp_mainViewContainer.frame;
    frame.origin = CGPointMake(0, 0);
    mp_startMainScreen = [[ZCGView alloc] initWithFrame:frame];
    mp_playMainScreen = [[ZCGView alloc] initWithFrame:frame];
    mp_startMainScreen.hidden = YES;
    mp_playMainScreen.hidden = YES;
    
    mp_startScreenMgr = [[ZCGStartScreenMgr alloc] init];
    [mp_startScreenMgr InitStartScreen:mp_startMainScreen];
    
    mp_playScreenMgr = [[ZCGPlayScreenMgr alloc] init];
    [mp_playScreenMgr InitPlayScreen:mp_playMainScreen];
    
    [mp_mainViewContainer insertSubview:mp_startMainScreen atIndex:0];
    [mp_mainViewContainer insertSubview:mp_playMainScreen atIndex:1];
    
    mp_startMainScreen.hidden = NO;
    mp_playMainScreen.hidden = YES;
}

@end











