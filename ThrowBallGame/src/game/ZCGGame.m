//
//  ZCGGame.m
//  ThrowBallGame
//
//  Created by zhu on 4/9/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "ZCGGame.h"


@interface ZCGGame ()
{
    
}
@property(nonatomic, retain) ZCGView *mp_gameContainer;
@end


@interface ZCGGame ()
{
    
}
- (void)InitGameContainer;
- (void)InitThrowBallCtrl;
@end


@implementation ZCGGame
@synthesize mp_gameBall;
@synthesize mp_gameBasket;
@synthesize mp_gameContainer;

- (void)dealloc
{
    [mp_gameBall release];
    [mp_gameBasket release];
    
    for (int i = 0; i < BG_HOLE_COUNT; i++) {
        [mp_holeArr[i] release];
    }
    
    [mp_throwBallCtrl release];
    
    [mp_gameContainer release];
    
    [super dealloc];
}

- (void)InitGameWithMainView:(ZCGView *)p_mainGameView
{
    mp_gameUIMgr = [ZCGUIMgr new];
    [mp_gameUIMgr InitGameUI:p_mainGameView];
    
    [self InitGameContainer];

    [self InitThrowBallCtrl];
    
    [ZCGTimer LaunchTimer:0.01 target:mp_throwBallCtrl selector:@selector(ThrowBall) repeats:YES];
    
}

- (void)InitGameContainer
{
    int y = 80;
    
    self.mp_gameContainer = [mp_gameUIMgr GetGameContainer];
    
    m_nGameContainerSubviewIndex = 0;
    for (int i = 0; i < BG_HOLE_COUNT; i++) {
        mp_holeArr[i] = [[ZCGHole alloc] initWithFrame:CGRectMake(20, y+= 70, 40, 40)];
        [mp_holeArr[i] InitHole:@"hole" with_type:@"png"];
        [mp_gameContainer insertSubview:mp_holeArr[i] atIndex:m_nGameContainerSubviewIndex++];
    }
    
    mp_gameBall = [[ZCGBall alloc] initWithFrame:CGRectMake(200, 200, 30, 30)];
    [mp_gameBall InitBall:@"ball_3" with_type:@"png"];
    [mp_gameContainer insertSubview:mp_gameBall atIndex:m_nGameContainerSubviewIndex++];
    
    mp_gameBasket = [[ZCGBasket alloc] initWithFrame:CGRectMake(20, 370, 40, 55)];
    [mp_gameBasket InitBasket];
    [mp_gameContainer insertSubview:mp_gameBasket atIndex:m_nGameContainerSubviewIndex++];
}

- (void)InitThrowBallCtrl
{
    mp_throwBallCtrl = [[ZCGThrowBallCtrl alloc] init];
    
    [mp_throwBallCtrl SetBall:mp_gameBall];
    
    for (int i = 0; i < BG_HOLE_COUNT; i++) {
        [mp_throwBallCtrl TryAddHole:mp_holeArr[i]];
    }
    [mp_throwBallCtrl SetBasket:mp_gameBasket];
    
    [mp_throwBallCtrl SetVelocityAndDirection:2 directionDeg:-20];
    //[mp_throwBallCtrl ThrowBallInit];
    
    return;
}


- (void)TouchEventHandle:(NSSet *)touches withEvent:(UIEvent *)event withEventType:(TOUCH_EVENT_TYPE)touchEventType
{
    [mp_gameUIMgr TouchEventHandle:touches withEvent:event withEventType:touchEventType];
    //[mp_throwBallCtrl ThrowBallInit];
}


@end
