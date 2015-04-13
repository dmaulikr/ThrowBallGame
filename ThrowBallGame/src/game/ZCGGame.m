//
//  ZCGGame.m
//  ThrowBallGame
//
//  Created by zhu on 4/9/15.
//  Copyright (c) 2015 zhu. All rights reserved.
//

#import "ZCGGame.h"

#import "../gameMsg/ZCGMessage.h"
#import "../game/ZCGMessageID.h"


BEGIN_GAME_MESSAGE(ZCGGame)
ADD_GAME_MSG(TouchViewClicked, GM_TOUCH_VIEW_TOUCHED_ID)
ADD_GAME_MSG(PowerChanged, GM_POWER_CHANGE_ID)
ADD_GAME_MSG(DirectChanged, GM_DIRECT_CHANGE_ID)
ADD_GAME_MSG(ThrowBtnTouched, GM_THROW_BTN_TOUCHED_ID)
ADD_GAME_MSG(NextCardBtnTouched, GM_NEXT_CARD_BTN_TOUCHED_ID)
ADD_GAME_MSG(ThrowBallSucceed, GM_THROW_BALL_SUCCESS_ID)
ADD_GAME_MSG(ThrowBallFailure, GM_THROW_BALL_FAILURE_ID)
END_GAME_MESSAGE()




@interface ZCGGame ()
{
    
}
@property(nonatomic, retain) ZCGThing *mp_gameContainer;
@end


@interface ZCGGame ()
{
    
}
- (void)TouchViewClicked;
- (void)PowerChanged;
- (void)DirectChanged;
- (void)ThrowBtnTouched;

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
    
    [mp_gameCard release];
    
    [super dealloc];
}

//- (void)AddGameMessage
//{
//    [ZCGMessage AddMessage:self withSelector:@selector(TouchViewClicked) withMsgID:GM_TOUCH_VIEW_TOUCHED_ID];
//}

- (void)InitGameWithMainView:(ZCGView *)p_mainGameView
{
    INIT_GAME_MESSAGE()
    
    mp_gameUIMgr = [ZCGUIMgr new];
    [mp_gameUIMgr InitGameUI:p_mainGameView];
    
    [self InitGameContainer];

    [self InitThrowBallCtrl];
    
    [ZCGTimer LaunchTimer:0.01 target:mp_throwBallCtrl selector:@selector(ThrowBall) repeats:YES];
    
    //mp_gameStat.m_gameElement.p_ball = mp_gameBall;
    mp_gameCard = [ZCGCard new];
    GAME_ELEMENT gameElement;
    gameElement.p_ball = mp_gameBall;
    gameElement.p_basket = mp_gameBasket;
    gameElement.p_holeArr = mp_holeArr;
    gameElement.nHoleCount = BG_HOLE_COUNT;
    [mp_gameCard SetGameElement:&gameElement];
    [mp_gameCard FirstCard];
    
    [mp_throwBallCtrl SetNeedTouchGndNum:[mp_gameCard GetNeedTouchGndNum]];
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
    
    return;
}


- (void)TouchEventHandle:(NSSet *)touches withEvent:(UIEvent *)event withEventType:(TOUCH_EVENT_TYPE)touchEventType
{
    [mp_gameUIMgr TouchEventHandle:touches withEvent:event withEventType:touchEventType];
}

///////////////////////////////////////////////////////////////////////////////////////////////////////
// game message handle section
- (void)TouchViewClicked
{
    CGPoint *p = (CGPoint *)([ZCGMessage GetArgument]);
    
    [mp_throwBallCtrl Stop];
    [mp_gameBall MoveToThing:mp_gameContainer];
    [mp_gameBall MoveToPoint:*p];
}

- (void)PowerChanged
{
    float *p_fPower = (float *)([ZCGMessage GetArgument]);
    [mp_throwBallCtrl SetVelocity:*p_fPower];
}


- (void)DirectChanged
{
    float *p_fDirectDeg = (float *)([ZCGMessage GetArgument]);
    [mp_throwBallCtrl SetDirectionDeg:*p_fDirectDeg];
}


- (void)NextCardBtnTouched
{
    [mp_gameCard NextCard];
}

- (void)ThrowBtnTouched
{
    [mp_throwBallCtrl Ready];
}

- (void)ThrowBallSucceed
{
    NSLog(@"SUCCESS\n");
    [mp_gameCard CurrentCardSuccess];
    [mp_gameCard NextCard];
    [mp_throwBallCtrl SetNeedTouchGndNum:[mp_gameCard GetNeedTouchGndNum]];
}

- (void)ThrowBallFailure
{
    NSLog(@"FAILURE\n");
    [mp_gameCard CurrentCardFailure];
}


@end






























