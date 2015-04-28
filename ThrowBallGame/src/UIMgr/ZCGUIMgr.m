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
#import "ZCGGameOverView.h"

#import "../gameMsg/ZCGMessage.h"
#import "../game/ZCGMessageID.h"


BEGIN_GAME_MESSAGE(ZCGUIMgr)
ADD_GAME_MSG(HomeBtnClicked,GM_HOME_BTN_TOUCHED_ID)
ADD_GAME_MSG(StartBtnClicked,GM_START_BTN_TOUCHED_ID)
ADD_GAME_MSG(ReturnBtnTouched, GM_RETURN_BTN_TOUCHED_ID)
ADD_GAME_MSG(RestartBtnTouched, GM_RESTART_BTN_TOUCHED_ID)
ADD_GAME_MSG(GameOver, GM_GAME_OVER_ID)
END_GAME_MESSAGE()




@interface ZCGUIMgr ()
{
}
@property(nonatomic, retain) ZCGGameOverView *mp_gameOverView;
- (void)HomeBtnClicked;
- (void)StartBtnClicked;
- (void)ReturnBtnTouched;
- (void)RestartBtnTouched;
- (void)GameOver;
@end


@implementation ZCGUIMgr
@synthesize mp_mainViewContainer;
@synthesize mp_startMainScreen;
@synthesize mp_startScreenMgr;
@synthesize mp_playMainScreen;
@synthesize mp_playScreenMgr;
@synthesize mp_gameOverView;
//@synthesize mp_gameStat;

- (void)dealloc
{
    [mp_mainViewContainer release];
    [mp_startMainScreen release];
    [mp_playMainScreen release];
    [mp_playScreenMgr release];
    [mp_startScreenMgr release];
    
    [mp_gameOverView release];
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
    
    
    mp_gameOverView = [[ZCGGameOverView alloc] initWithFrame:frame];
    mp_gameOverView.center = CGPointMake(frame.size.width / 2, frame.size.height / 2);
    mp_gameOverView.hidden = YES;
    [mp_mainViewContainer insertSubview:mp_gameOverView atIndex:2];
    
//    mp_startMainScreen.hidden = YES;
//    mp_playMainScreen.hidden = NO;
//    mp_gameOverView.hidden = NO;
    
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
    mp_gameOverView.hidden = YES;
}

- (void)StartBtnClicked
{
    mp_playMainScreen.hidden = NO;
    mp_startMainScreen.hidden = YES;
    mp_gameOverView.hidden = YES;
    
    [ZCGMessage PostGameMessage:GM_NEED_RESTART_GAME_ID];
    
    NSString *pInfo = [[NSString alloc] initWithFormat:@"CARD %d", 1];
    [mp_playScreenMgr SetNotifyInfo:pInfo];
    
}


- (void)ReturnBtnTouched
{
    mp_playMainScreen.hidden = YES;
    mp_startMainScreen.hidden = NO;
    mp_gameOverView.hidden = YES;
}

- (void)RestartBtnTouched
{
    mp_playMainScreen.hidden = NO;
    mp_startMainScreen.hidden = YES;
    mp_gameOverView.hidden = YES;
    
    [ZCGMessage PostGameMessage:GM_NEED_RESTART_GAME_ID];
}

- (void)GameOver
{
    mp_playMainScreen.hidden = YES;
    mp_startMainScreen.hidden = YES;
    mp_gameOverView.hidden = NO;
}


- (void)SetNotifyInfo:(NSString *)pInfo
{
    [mp_playScreenMgr SetNotifyInfo:pInfo];
}

- (void)GameStatusLabelMove
{
    [mp_playScreenMgr GameStatusLabelMove];
}

@end











