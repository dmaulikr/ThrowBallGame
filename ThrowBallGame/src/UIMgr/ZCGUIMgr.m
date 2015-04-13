//
//  ZCGUIMgr.m
//  ThrowBallGame
//
//  Created by zhu on 4/5/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "ZCGUIMgr.h"
#import "../gameView/ZCGView.h"
#import "../statistic/ZCGStat.h"
#import "../thing/ZCGThing.h"
#import "ZCGPlayScreenMgr.h"
#import "ZCGStartScreenMgr.h"
#import "ZCGBackgroundMgr.h"

#import "../gameMsg/ZCGMessage.h"
#import "../game/ZCGMessageID.h"


BEGIN_GAME_MESSAGE(ZCGUIMgr)
ADD_GAME_MSG(HomeBtnClicked,GM_HOME_BTN_TOUCHED_ID)
ADD_GAME_MSG(StartBtnClicked,GM_START_BTN_TOUCHED_ID)
END_GAME_MESSAGE()




@interface ZCGUIMgr ()
{
}
- (void)HomeBtnClicked;
- (void)StartBtnClicked;
@end


@implementation ZCGUIMgr
@synthesize mp_mainViewContainer;
@synthesize mp_startMainScreen;
@synthesize mp_startScreenMgr;
@synthesize mp_playMainScreen;
@synthesize mp_playScreenMgr;
//@synthesize mp_gameStat;

- (void)dealloc
{
    [mp_mainViewContainer release];
    [mp_startMainScreen release];
    [mp_playMainScreen release];
    [mp_playScreenMgr release];
    [mp_startScreenMgr release];
    
    //[mp_gameStat release];
    
    [super dealloc];
}

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
    
    INIT_GAME_MESSAGE()
    
    CGRect frame;
    
    self.mp_mainViewContainer = p_mainViewContainer;
    
    frame = mp_mainViewContainer.frame;
    
    frame.origin = CGPointMake(0, 0);
    
    mp_startMainScreen = [[ZCGView alloc] initWithFrame:frame];
    [mp_startMainScreen setBackgroundColor:[UIColor clearColor]];
    mp_startMainScreen.hidden = YES;
    mp_startScreenMgr = [[ZCGStartScreenMgr alloc] init];
    //mp_startScreenMgr.mp_gameUIMgr = self;
    [mp_startScreenMgr InitStartScreen:mp_startMainScreen];
    
    
    mp_playMainScreen = [[ZCGView alloc] initWithFrame:frame];
    [mp_playMainScreen setBackgroundColor:[UIColor clearColor]];
    mp_playMainScreen.hidden = YES;
    mp_playScreenMgr = [[ZCGPlayScreenMgr alloc] init];
    [mp_playScreenMgr InitPlayScreen:mp_playMainScreen];
   // mp_playScreenMgr.mp_gameUIMgr = self;
    
    [mp_mainViewContainer insertSubview:mp_startMainScreen atIndex:0];
    [mp_mainViewContainer insertSubview:mp_playMainScreen atIndex:1];
    
    mp_startMainScreen.hidden = NO;
    mp_playMainScreen.hidden = YES;
    
    
    [mp_mainViewContainer insertSubview:mp_startMainScreen atIndex:0];
    [mp_mainViewContainer insertSubview:mp_playMainScreen atIndex:1];
    
    return;
}


- (void)SetGameStatistic:(ZCGStat *)p_stat
{
    //self.mp_gameStat = p_stat;
    //mp_playScreenMgr.mp_gameStat = p_stat;
    //mp_startScreenMgr.mp_gameStat = p_stat;
}


- (ZCGThing *)GetGameContainer
{
    return mp_playScreenMgr.mp_gameContainer;
}

- (IBAction)ButtonTouchUpInsideAction:(UIButton *)sender
{
    
}


- (void)TouchEventHandle:(NSSet *)touches withEvent:(UIEvent *)event withEventType:(TOUCH_EVENT_TYPE)touchEventType
{
    [mp_playScreenMgr TouchEventHandle:touches withEvent:event withEventType:touchEventType];
    [mp_startScreenMgr TouchEventHandle:touches withEvent:event withEventType:touchEventType];
    
    return;
}


- (void)HomeBtnClicked
{
    mp_startMainScreen.hidden = NO;
    mp_playMainScreen.hidden = YES;
}

- (void)StartBtnClicked
{
    mp_playMainScreen.hidden = NO;
    mp_startMainScreen.hidden = YES;
    
}


@end











